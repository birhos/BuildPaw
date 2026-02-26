#!/bin/bash
set -euo pipefail

# ──────────────────────────────────────────────
# BuildPaw — macOS DMG Creator
# ──────────────────────────────────────────────
# Usage:
#   ./scripts/create_dmg.sh            (uses version from pubspec.yaml)
#   ./scripts/create_dmg.sh 2.0.0      (override version)
# ──────────────────────────────────────────────

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

APP_NAME="BuildPaw"
VOLUME_NAME="BuildPaw"
BUILD_DIR="$PROJECT_ROOT/build"
RELEASE_DIR="$BUILD_DIR/macos/Build/Products/Release"
APP_PATH="$RELEASE_DIR/$APP_NAME.app"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

print_step() { echo -e "\n${CYAN}▸ $1${NC}"; }
print_success() { echo -e "${GREEN}✓ $1${NC}"; }
print_warning() { echo -e "${YELLOW}⚠ $1${NC}"; }
print_error() { echo -e "${RED}✗ $1${NC}"; }

get_version() {
  if [[ -n "${1:-}" ]]; then
    echo "$1"
    return
  fi

  local pubspec="$PROJECT_ROOT/pubspec.yaml"
  if [[ ! -f "$pubspec" ]]; then
    print_error "pubspec.yaml not found at $pubspec"
    exit 1
  fi

  local version
  version=$(grep '^version:' "$pubspec" | head -1 | awk '{print $2}' | cut -d'+' -f1)

  if [[ -z "$version" ]]; then
    print_error "Could not parse version from pubspec.yaml"
    exit 1
  fi

  echo "$version"
}

VERSION=$(get_version "${1:-}")
DMG_NAME="BuildPaw-${VERSION}.dmg"
DMG_PATH="$BUILD_DIR/$DMG_NAME"
TEMP_DMG="$BUILD_DIR/tmp_${APP_NAME}.dmg"

echo -e "${CYAN}"
echo "╔══════════════════════════════════════╗"
echo "║       BuildPaw DMG Creator           ║"
echo "╚══════════════════════════════════════╝"
echo -e "${NC}"
echo "  Version  : $VERSION"
echo "  Output   : build/$DMG_NAME"
echo ""

# ── Step 1: Build ──────────────────────────
print_step "Building macOS release..."

cd "$PROJECT_ROOT"
flutter build macos --release

if [[ ! -d "$APP_PATH" ]]; then
  print_error "Build failed — $APP_PATH not found"
  exit 1
fi

APP_SIZE=$(du -sh "$APP_PATH" | awk '{print $1}')
print_success "Built $APP_NAME.app ($APP_SIZE)"

# ── Step 2: Create writable DMG ───────────
print_step "Creating DMG image..."

rm -f "$TEMP_DMG" "$DMG_PATH"

SIZE_KB=$(du -sk "$APP_PATH" | cut -f1)
SIZE_KB=$((SIZE_KB + 10240))

hdiutil create \
  -srcfolder "$APP_PATH" \
  -volname "$VOLUME_NAME" \
  -fs HFS+ \
  -fsargs "-c c=64,a=16,e=16" \
  -format UDRW \
  -size "${SIZE_KB}k" \
  "$TEMP_DMG" \
  -ov \
  -quiet

print_success "Writable DMG created"

# ── Step 3: Mount & add Applications symlink
print_step "Adding Applications symlink..."

DEVICE=$(hdiutil attach -readwrite -noverify -noautoopen "$TEMP_DMG" \
  | grep -E '^/dev/' | head -1 | awk '{print $1}')
MOUNT_POINT="/Volumes/$VOLUME_NAME"

if [[ ! -d "$MOUNT_POINT" ]]; then
  print_error "Failed to mount DMG at $MOUNT_POINT"
  exit 1
fi

ln -sf /Applications "$MOUNT_POINT/Applications"

sync
sleep 1

hdiutil detach "$DEVICE" -quiet
print_success "Applications symlink added"

# ── Step 4: Compress ──────────────────────
print_step "Compressing DMG..."

hdiutil convert "$TEMP_DMG" \
  -format UDZO \
  -imagekey zlib-level=9 \
  -o "$DMG_PATH" \
  -ov \
  -quiet

rm -f "$TEMP_DMG"

DMG_SIZE=$(du -sh "$DMG_PATH" | awk '{print $1}')
print_success "Compressed DMG created ($DMG_SIZE)"

# ── Done ──────────────────────────────────
echo ""
echo -e "${GREEN}╔══════════════════════════════════════╗"
echo "║            DMG Ready!                ║"
echo "╚══════════════════════════════════════╝${NC}"
echo ""
echo "  File : $DMG_PATH"
echo "  Size : $DMG_SIZE"
echo ""

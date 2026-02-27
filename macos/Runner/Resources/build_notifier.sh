#!/bin/bash
# Builds BuildPawNotifier.app with BuildPaw icon for custom notification icon.
# See: https://stackoverflow.com/q/48856158
#
# Run after `flutter build macos` so AppIcon.icns is available.
# Or run `flutter build macos` first if the icon is missing.

set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
RUNNER_DIR="$(dirname "$SCRIPT_DIR")"
PROJECT_DIR="$(cd "$RUNNER_DIR/../.." && pwd)"
OUTPUT_APP="$SCRIPT_DIR/BuildPawNotifier.app"
CONFIG="${CONFIGURATION:-Release}"
BUILT_ICNS="$PROJECT_DIR/build/macos/Build/Products/$CONFIG/buildpaw.app/Contents/Resources/AppIcon.icns"

# Compile AppleScript to .app
osacompile -o "$OUTPUT_APP" "$SCRIPT_DIR/BuildPawNotifier.applescript"

# Use AppIcon.icns from Flutter build (same icon as main app)
if [[ -f "$BUILT_ICNS" ]]; then
  cp "$BUILT_ICNS" "$OUTPUT_APP/Contents/Resources/applet.icns"
else
  echo "Warning: Run 'flutter build macos' first for custom icon."
  echo "Using default Script Editor icon for now."
fi

echo "Built $OUTPUT_APP"

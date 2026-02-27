# BuildPaw - Changelog

## v0.0.2 - MVP Release (2026-02-27)

### New Features

#### Publish Tab
- New **Publish** tab alongside Build tab in the main UI
- Publish Flutter builds to Firebase App Distribution, Google Play Console, and App Store Connect (TestFlight)
- Publish profiles with configurable credentials per target
- Last build output tracking — automatically uses the most recent build artifacts
- Release notes and tester group support for Firebase
- Play Store track selection (internal, closed, production)

#### Publish Profiles
- Create and manage multiple publish profiles
- Firebase: App ID, token (stored securely)
- Google Play: Package name, service account JSON path
- App Store Connect: Bundle ID, Apple ID or API Key auth, Team IDs
- Secure storage for sensitive values (Firebase token, app-specific password)

#### Fastlane Integration
- Auto-detection of Fastlane installation
- One-click Fastlane install via Homebrew
- Auto-generation of Fastfile, Appfile, and .env.default when missing
- Gemfile and Pluginfile creation with Firebase/Flutter plugins
- Real-time publish log streaming
- Cancel support during publish

#### macOS Notifications
- BuildPawNotifier — custom notification app with BuildPaw icon
- Success/error notifications after publish completes
- Localized notification strings for all 8 languages

### Documentation

- README now uses local BuildPaw logo (`assets/logo.png`) instead of external icon

### Build

- Updated macOS app icons (AppIcon.appiconset)

### Technical Changes

#### New Files
- `lib/domain/models/publish_profile.dart` — Publish profile model
- `lib/domain/enums/publish_target.dart` — Firebase, GooglePlay, AppStoreConnect
- `lib/domain/enums/play_track.dart` — internal, closed, production
- `lib/domain/enums/secure_key.dart` — Secure key storage
- `lib/infrastructure/services/notification_service.dart` — macOS notifications
- `lib/infrastructure/services/publish_profile_repository.dart` — Profile CRUD + secure storage
- `lib/application/last_build_output/` — LastBuildOutputCubit
- `lib/application/publishing/` — PublishCubit, PublishProfileCubit, Fastlane helpers
- `lib/presentation/pages/publish_config_page.dart` — Profile configuration UI
- `lib/presentation/widgets/publish_tab_content.dart` — Publish tab UI
- `lib/presentation/widgets/publish_log_panel.dart` — Publish output panel
- `macos/Runner/Resources/BuildPawNotifier.app` — Custom notification app
- `macos/Runner/Resources/build_notifier.sh` — Build script for notifier

#### Updated Files
- `lib/application/build_execution/` — Added projectPath, projectName to BuildSuccess
- `lib/infrastructure/services/process_service.dart` — runWithExitCode, environment param
- `lib/core/i18n/*.i18n.json` — Publish translations for all 8 locales
- `lib/core/i18n/strings*.g.dart` — Regenerated with Slang

---

## v0.0.1 - MVP Release (2026-02-26)

### New Features

#### Multi-Language Support (i18n Expansion)
- Added 6 new languages: Arabic (AR), German (DE), French (FR), Simplified Chinese (ZH), Russian (RU), Hindi (HI)
- Total supported languages increased to 8 (EN, TR, AR, DE, FR, ZH, RU, HI)
- Full translation of all UI texts for each language
- All new languages added to the language selector

#### RTL (Right-to-Left) Support
- App automatically switches to RTL mode when Arabic is selected
- LTR mode is preserved for all other languages
- Explicit RTL/LTR control via `Directionality` widget through `MaterialApp.builder`
- `EdgeInsets.fromLTRB` → `EdgeInsetsDirectional.fromSTEB` conversions

#### Forced LTR Areas in RTL Mode
- **Terminal/Log panel**: Code output is always LTR
- **File path TextFields**: System paths are always LTR
- **Dependency table**: Package names and versions are always LTR
- **Config panel inputs**: Flavor and target fields (all platforms) are always LTR

### Bug Fixes

- Fixed web build `--web-renderer` deprecated flag error
- Fixed FVM Dart execution support
- Fixed `file_picker` entitlement error
- Fixed `RadioListTile` and `DropdownButtonFormField` deprecated API warnings

#### YAML Parser Top-Level Key Detection
- Fixed top-level YAML key detection bug in `_parsePubspecYamlDeps` method
- Old code: `!stripped.startsWith(' ')` (always true on trimmed string) and `stripped == trimmed` (trailing whitespace check — incorrect logic)
- New code: `!line.startsWith(' ') && !line.startsWith('\t')` for leading indentation check on the original line
- Prevented indented sub-keys (`  git:`) from being incorrectly detected as top-level keys
- Ensured correct detection of top-level keys with trailing whitespace (`flutter_icons:  `)

#### RTL/LTR Rebuild Issue
- Removed redundant `Builder` widget from `app.dart`
- `BlocBuilder<ThemeCubit>` now subscribes directly to `TranslationProvider`
- Guaranteed reliable rebuild on locale and theme changes

### Technical Changes

#### New Files
- `lib/core/i18n/ar.i18n.json` — Arabic translations
- `lib/core/i18n/de.i18n.json` — German translations
- `lib/core/i18n/fr.i18n.json` — French translations
- `lib/core/i18n/zh.i18n.json` — Simplified Chinese translations
- `lib/core/i18n/ru.i18n.json` — Russian translations
- `lib/core/i18n/hi.i18n.json` — Hindi translations

#### Updated Files
- `lib/core/i18n/en.i18n.json` / `tr.i18n.json` — Added new language name keys
- `lib/core/i18n/strings*.g.dart` — Regenerated with Slang for 8 locales
- `lib/app.dart` — RTL/LTR support, Builder removed, locale directly in BlocBuilder context
- `lib/presentation/widgets/language_selector.dart` — 8 language options
- `lib/presentation/widgets/project_info_card.dart` — `EdgeInsetsDirectional`, dependency table LTR
- `lib/presentation/widgets/build_log_panel.dart` — Terminal output LTR
- `lib/presentation/widgets/project_selector_widget.dart` — File path LTR
- `lib/presentation/widgets/platform_config/android_config_panel.dart` — Flavor/target LTR
- `lib/presentation/widgets/platform_config/ios_config_panel.dart` — Flavor/target LTR
- `lib/presentation/widgets/platform_config/web_config_panel.dart` — Flavor/target LTR
- `lib/infrastructure/services/flutter_service.dart` — YAML parser top-level key detection fix

---

#### Profile Management
- Added in-app **profile mode**
- Current build configurations can be saved as profiles with name + version
- Saved profiles are stored persistently on device via `shared_preferences`
- One-click configuration apply from profile list
- Save (overwrite) support for the active profile
- Overwrite confirmation when a profile with the same name exists
- Profile deletion (with confirmation dialog)

#### Profile Selector (Top-Right Menu)
- Profile area moved to top-right corner as `PopupMenuButton`
- Consistent design with language and theme selectors
- Section header, radio-button style icons, two-line profile items (name + version)
- Primary (orange) icon color when an active profile exists
- In-menu actions: profile list, save, new profile, delete

#### Project Info TabBar Structure
- `ProjectInfoCard` converted to a two-tab layout:
  - **General**: Project name, version, branch, tag, Flutter/Dart versions, FVM status
  - **Dependencies**: All dependencies read from `pubspec.yaml` and `pubspec.lock`
- Dependencies tab features:
  - Alphabetically sorted table view
  - PACKAGE / VERSION column headers
  - Zebra-stripe row coloring
  - Monospace font for version numbers
  - Package count in tab title: `Dependencies (12)`

#### Resolved Dependency Versions
- Dependency versions are now read from `pubspec.lock` (resolved/actual version)
- Falls back to `pubspec.yaml` constraint version if lock file is unavailable
- Shows actual resolved versions like `9.1.0` instead of `^9.1.0`

### UI/UX Improvements

#### Popup Menu Design Overhaul
- All popup menu buttons (profile, theme, language) given a consistent design
- `popupMenuTheme` added to both themes (12px radius, 8 elevation, thin border)
- Consistent design pattern:
  - Menus open below the button via `PopupMenuPosition.under`
  - Consistent menu width via `constraints`
  - Selected item: `fontWeight: w600` + primary color + check icon on the right
  - Fixed item heights (40px)
  - 20px button icons, 16px in-menu icons
- **Theme Selector**: `dark_mode_rounded` / `light_mode_rounded` icons
- **Language Selector**: "EN" / "TR" text badges, 11px bold
- **Profile Selector**: Radio-button style, two-line items, minimal close icon

### Technical Changes

#### New Files
- `lib/infrastructure/services/profile_storage_service.dart` — Profile CRUD via SharedPreferences
- `lib/application/profile/profile_cubit.dart` — Profile state management
- `lib/application/profile/profile_state.dart` — Profile state model
- `lib/presentation/widgets/profile_panel.dart` — ProfileSelector PopupMenuButton
- `lib/presentation/widgets/save_profile_dialog.dart` — Profile save dialog

#### Updated Files
- `lib/infrastructure/services/flutter_service.dart` — Added `getDependencies()`, `_parseLockFileVersions()`
- `lib/domain/models/project_info.dart` — Added `dependencies` field
- `lib/application/project/project_cubit.dart` — Dependency fetch runs in parallel
- `lib/presentation/widgets/project_info_card.dart` — TabBar + AnimatedCrossFade tab structure
- `lib/presentation/widgets/theme_selector.dart` — Consistent popup menu design
- `lib/presentation/widgets/language_selector.dart` — Consistent popup menu design
- `lib/presentation/widgets/project_selector_widget.dart` — ProfileSelector added to header
- `lib/presentation/pages/home_page.dart` — ProfilePanel card removed
- `lib/core/theme/app_theme.dart` — Added `popupMenuTheme` (dark + light)
- `lib/core/i18n/en.i18n.json` / `tr.i18n.json` — Profile and dependency translations

---

#### Localization Support
- Added i18n infrastructure with Slang (EN / TR)
- All UI texts are read from translation files
- Language selector in the top-right corner

#### Theme Support
- Added light theme
- Dark/Light theme toggle
- Theme selector in the top-right corner
- Theme preference stored persistently

#### Drag & Drop Config Import
- Import configuration by dragging and dropping a JSON file
- `desktop_drop` + `cross_file` integration
- Drop zone overlay display

#### Config Export/Import
- Export current configuration as versioned JSON
- Import JSON preset file to auto-fill all fields
- Postman collection-like metadata structure

#### Project Info Enhancements
- Project version display
- Refresh button to reload project info
- Latest git tag version display

#### Log Copy
- Added copy button to the build log panel
- Copies all log lines to clipboard with newline characters

---

### Project Structure

```
lib/
  main.dart                                  # App entry point
  app.dart                                   # MultiBlocProvider + MaterialApp setup
  core/
    theme/
      app_theme.dart                         # Material 3 dark theme
      app_colors.dart                        # Paw-themed color palette (amber/orange)
    constants/
      app_constants.dart                     # Constant values
  domain/
    enums/
      build_mode.dart                        # debug / profile / release
      android_output_type.dart               # apk / aab / both
      ios_output_type.dart                   # ios / ipa
      pwa_strategy.dart                      # default / none
      build_platform.dart                    # android / ios / web
    models/
      project_info.dart                      # Project info model
      android_build_config.dart              # Android configuration model
      ios_build_config.dart                  # iOS configuration model
      web_build_config.dart                  # Web configuration model
      build_result.dart                      # Build result model
      build_preset.dart                      # Export/Import preset model
  application/
    project/                                 # Project selection and info loading
    build_config/                            # Platform enable/disable + config management
    build_execution/                         # Build process management
    services/                                # Command generator + artifact manager
  infrastructure/
    services/                                # Process, Git, Flutter, FileSystem services
  presentation/
    pages/home_page.dart                     # Main page
    widgets/                                 # All UI widgets
```

### Features

#### Project Selection & Info Display
- Flutter project directory selection via Finder
- Validation with `pubspec.yaml` existence check
- Automatic project info loading (name, version, branch, tag, Flutter/Dart version, FVM)

#### Platform-Based Build Configuration
- **Android**: APK / AAB / both, obfuscation, split debug info, flavor, build mode, target
- **iOS**: Runner.app / IPA, obfuscation, split debug info, flavor, build mode, target
- **Web**: PWA strategy, no tree shake icons, flavor, build mode, target

#### Build Execution
- Automatic CLI command generation
- `fvm flutter` prefix when FVM is detected
- Real-time log streaming
- Sequential platform build (Android → iOS → Web)
- Cancel support

#### Log Panel
- Terminal-style viewer (JetBrains Mono)
- Color-coded log lines
- Auto-scroll to bottom
- Status badge: Idle / Running / Success / Failed

#### Artifact Management
- Automatic artifact collection after build
- Timestamped folder structure on Desktop
- Finder opens automatically after build

### Technical Details
- **State Management**: Bloc / Cubit (flutter_bloc)
- **UI Framework**: Material Design 3
- **macOS**: Sandbox disabled, file read-write permission
- **Minimum Window**: 1000x700
- **Dependencies**: flutter_bloc, equatable, file_picker, google_fonts, shared_preferences, slang

# GitHub Copilot Instructions for Thriftwood

## Repository Overview

**Thriftwood** is a cross-platform media management application built with Flutter. It's designed as a modern reimplementation inspired by LunaSea, providing a unified interface for managing media automation services like Radarr (movies), Sonarr (TV series), Lidarr (music), and download clients (NZBGet, SABnzbd).

### Project Status
- **Current Stage**: Early development - still using Flutter template code
- **Repository Size**: 1.8M, 143 files total
- **Dart Files**: 2 files (lib/main.dart, test/widget_test.dart)
- **Documentation**: 13 markdown files with comprehensive specifications
- **Target Platforms**: iOS, Android, Web, Windows, macOS, Linux

### Key Technologies
- **Framework**: Flutter (SDK ^3.9.0)
- **Language**: Dart
- **Architecture**: Cross-platform with native compilation
- **CI/CD**: GitHub Actions
- **Linting**: flutter_lints ^6.0.0

## Build and Development Process

### Environment Setup
**Always install Flutter SDK 3.9.0 or higher before starting any development work.**

```bash
# Install Flutter (varies by platform)
# On macOS: brew install --cask flutter
# On Linux: snap install flutter --classic
# On Windows: Download from flutter.dev

# Verify installation
flutter --version
flutter doctor
```

### Essential Commands (Run in Order)

#### 1. Dependency Management
```bash
# ALWAYS run this first before any other Flutter commands
flutter pub get
```
**Note**: This command must complete successfully before building or testing.

#### 2. Code Analysis
```bash
# Run static analysis (required by CI)
flutter analyze
```
**Expected**: Should pass with 0 issues. Fix any analysis errors before proceeding.

#### 3. Testing
```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```
**Expected**: Currently has 1 widget test that should pass.

#### 4. Building

**Android Builds:**
```bash
# Build APK (debug)
flutter build apk

# Build App Bundle (release)
flutter build appbundle
```

**Web Build:**
```bash
# Build for web
flutter build web
```

**Other Platforms:**
```bash
# iOS (requires macOS)
flutter build ios

# Desktop platforms
flutter build windows  # Windows only
flutter build macos    # macOS only  
flutter build linux    # Linux only
```

### Development Workflow

#### Code Formatting
```bash
# Format code (currently commented out in CI)
dart format .

# Check formatting without changes
dart format --output=none --set-exit-if-changed .
```

#### Running the App
```bash
# Run in debug mode
flutter run

# Run in release mode
flutter run --release

# Run on specific device
flutter devices
flutter run -d <device-id>
```

### Known Issues and Workarounds

1. **CI Pipeline**: The `dart format` check is currently commented out in `.github/workflows/ci.yml`
2. **Platform Dependencies**: Some build commands only work on specific platforms (iOS on macOS, etc.)
3. **First Run**: Always run `flutter pub get` after cloning or changing dependencies

## Repository Architecture

### Directory Structure
```
/
├── .github/          # CI/CD workflows and GitHub config
├── android/          # Android platform-specific code
├── ios/              # iOS platform-specific code  
├── lib/              # Main Dart source code
│   └── main.dart     # Application entry point (currently template)
├── linux/            # Linux platform-specific code
├── macos/            # macOS platform-specific code
├── spec/             # Comprehensive project specifications
├── test/             # Test files
│   └── widget_test.dart
├── web/              # Web platform-specific code
├── windows/          # Windows platform-specific code
├── pubspec.yaml      # Project dependencies and configuration
└── analysis_options.yaml  # Dart/Flutter linting rules
```

### Key Configuration Files

- **`pubspec.yaml`**: Dependencies, assets, and project metadata
- **`analysis_options.yaml`**: Linting rules using flutter_lints package
- **`.metadata`**: Flutter project tracking (do not modify)
- **`.github/workflows/ci.yml`**: CI pipeline configuration

### Specifications Directory (`/spec/`)
**Critical**: This repository contains extensive specifications that define the intended architecture and features. Review these before making significant changes:

- **`spec/architecture/`**: System design and architectural patterns
- **`spec/data/`**: Database schemas and data models
- **`spec/services/`**: External service integration specifications (Radarr, Sonarr, etc.)
- **`spec/ui-ux/`**: Design system and interface specifications
- **`spec/features/`**: Feature requirements and implementation details

## CI/CD Pipeline

### GitHub Actions Workflow
The CI runs on every push/PR to `main` and `develop` branches:

1. **Setup**: Uses `subosito/flutter-action@v2` with stable channel
2. **Dependencies**: `flutter pub get`
3. **Analysis**: `flutter analyze` (must pass)
4. **Testing**: `flutter test` (must pass)
5. **Builds**: Android APK, Android appbundle, and Web

### Dependencies Management
- **Dependabot**: Configured for weekly updates of Dart packages and GitHub Actions
- **Auto-approve**: Dependabot PRs are auto-approved via `auto-approve.yml`

## Making Changes

### Current Implementation Status
The project is in **very early development**:
- `lib/main.dart` contains standard Flutter counter app template
- Only one test exists: `test/widget_test.dart`
- Actual media management features not yet implemented

### Before Implementing Features
1. **Read Specifications**: Study relevant files in `/spec/` directory
2. **Understand Architecture**: Review `spec/architecture/` for design patterns
3. **Check Dependencies**: Verify if new packages are needed in `pubspec.yaml`
4. **Plan Testing**: Consider test strategy before implementing features

### Code Quality Standards
- **Linting**: Follow flutter_lints rules (configured in `analysis_options.yaml`)
- **Testing**: Add tests for new widgets and functionality
- **Documentation**: Update relevant specification files if architecture changes
- **Platform Support**: Consider cross-platform compatibility

### Common Pitfalls to Avoid
1. **Dependencies**: Don't add packages without running `flutter pub get`
2. **Platform-Specific Code**: Be careful with platform-specific features
3. **State Management**: Follow the reactive patterns outlined in specifications
4. **Testing**: Don't break the existing widget test
5. **CI Compatibility**: Ensure changes pass `flutter analyze` and `flutter test`

## Validation Steps

After making changes, always run these commands to validate:

```bash
# 1. Get dependencies
flutter pub get

# 2. Run analysis
flutter analyze

# 3. Run tests  
flutter test

# 4. Build to verify no build issues
flutter build apk
flutter build web
```

All commands should complete without errors before committing changes.

## Performance Considerations

- **Hot Reload**: Use `flutter run` for development with hot reload support
- **Build Times**: Initial builds may be slow; subsequent builds are faster
- **Memory Usage**: Monitor memory usage during development, especially with large media datasets
- **Platform Performance**: Test on actual devices when possible
- **Gradle Memory**: Android builds use 8GB heap size (configured in `android/gradle.properties`)

## Platform-Specific Notes

### Android
- **Application ID**: Currently `com.example.thriftwood` (should be changed for production)
- **Java Version**: Uses Java 11 for compilation
- **Gradle Memory**: Configured with 8GB heap for large builds
- **SDK Versions**: Uses Flutter-managed SDK versions

### Web
- **PWA Ready**: Configured as Progressive Web App with manifest.json
- **Theme Colors**: Uses blue theme (#0175C2) 
- **Icons**: Includes standard and maskable icons for mobile installation

### iOS/macOS
- **Swift**: Uses Swift for native iOS/macOS integration
- **Asset Management**: Standard Xcode asset catalogs for icons

## Trust These Instructions

These instructions are comprehensive and tested. Only search for additional information if:
- You encounter specific error messages not covered here
- You need to add new dependencies or features not yet documented
- The instructions appear outdated or incorrect based on your observations

Following these instructions will minimize build failures, reduce CI issues, and help you work more efficiently with the Thriftwood codebase.
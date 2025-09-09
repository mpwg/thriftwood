# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter project called "Thriftwood" - a standard Flutter application using Material Design with Dart SDK ^3.9.0. The project uses flutter_lints for code analysis and follows standard Flutter conventions.

## Development Commands

### Running the Application
- `flutter run` - Run the app in debug mode with hot reload
- `flutter run --release` - Run in release mode

### Testing
- `flutter test` - Run all widget and unit tests
- `flutter test test/widget_test.dart` - Run specific test file

### Code Quality
- `flutter analyze` - Run static analysis (uses analysis_options.yaml configuration with flutter_lints)
- `flutter format .` - Format all Dart files in the project
- `dart fix --apply` - Apply automatic fixes for linting issues

### Dependencies
- `flutter pub get` - Install dependencies from pubspec.yaml
- `flutter pub upgrade` - Upgrade dependencies to latest compatible versions
- `flutter pub outdated` - Check for newer versions of dependencies

### Building
- `flutter build apk` - Build APK for Android
- `flutter build ios` - Build for iOS (macOS only)
- `flutter build web` - Build for web

## Project Structure

- `lib/main.dart` - Entry point with MyApp root widget and MyHomePage counter demo
- `test/widget_test.dart` - Basic widget test for the counter functionality
- `pubspec.yaml` - Dependencies and project configuration
- `analysis_options.yaml` - Linting configuration using flutter_lints package

## Architecture Notes

The project currently contains the default Flutter counter app with:
- MaterialApp as the root widget
- StatefulWidget (MyHomePage) demonstrating basic state management with setState
- Basic widget testing setup using flutter_test

The codebase follows standard Flutter patterns with Widget-based architecture and uses Material Design components.

## Issue Standards and Best Practices

### GitHub Issue Requirements
All GitHub issues must follow specific standards for AI-assisted development. Before working on any issue, verify it includes:

- **User Story Format**: Clear "As a [user] I want [feature] so that [benefit]" structure
- **Value Proposition**: Explanation of why the feature matters
- **Specific File Paths**: Exact files to create/modify (e.g., `lib/services/radarr_client.dart`)
- **Implementation Guidance**: Required packages, patterns, and conventions
- **Acceptance Criteria**: Measurable, testable outcomes as checkboxes
- **Error Handling Requirements**: How errors should be managed
- **Testing Requirements**: Coverage expectations and test types
- **Definition of Done**: Clear completion criteria

### File Structure Conventions
```
lib/
├── models/[service]/[entity].dart     # Freezed data models
├── services/[service]_client.dart     # API clients with retry logic
├── screens/[service]/[screen]_screen.dart # UI screens
├── widgets/common/[widget]_widget.dart # Reusable widgets
├── utils/[utility]_helper.dart        # Utility functions
└── exceptions/api_exception.dart      # Custom exceptions
```

### Code Standards
- **Models**: Use Freezed for immutable data classes with JSON serialization
- **API Clients**: Implement repository pattern with dependency injection
- **UI**: Prefer StatelessWidget with proper state management (Provider/Bloc/Riverpod)
- **Error Handling**: Custom exceptions with user-friendly messages
- **Testing**: 80%+ unit test coverage for services and business logic
- **Performance**: Screen load times < 2s, efficient list rendering
- **Security**: Encrypt credentials, validate all inputs, use HTTPS

### Documentation Resources
- `docs/AI_CODING_GUIDE.md` - Comprehensive coding standards and patterns
- `docs/ISSUE_QUALITY_CHECKLIST.md` - Quality checklist for issues
- `.github/ISSUE_TEMPLATE/` - GitHub issue templates

### Before Implementation
1. Review issue against quality checklist
2. Verify all requirements are clear and complete  
3. Check dependencies and implementation order
4. Ensure testing approach is defined
5. Confirm error handling patterns are specified

### Quality Gates
- Issues scoring < 4.0 on quality checklist should be improved before implementation
- All code must pass static analysis (`flutter analyze`)
- Unit tests required for all services and business logic
- Performance benchmarks must be met
- Security review required for credential handling

## Feature Flags System

### Overview
The project includes a centralized feature flag system using Riverpod for state management, supporting both runtime configuration and build-time overrides via `dart-define`.

### Usage

#### Basic Usage
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/feature_flag_provider.dart';

class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFeatureEnabled = ref.watch(featureFlagProvider('my_feature'));
    
    return isFeatureEnabled 
      ? Text('Feature is enabled!')
      : Text('Feature is disabled');
  }
}
```

#### Managing Feature Flags
```dart
// Get the service instance
final service = ref.read(featureFlagServiceProvider);

// Set a feature flag
service.setFlag('new_ui', true, description: 'Enable new UI design');

// Check if enabled
final isEnabled = service.isEnabled('new_ui');

// Get flag details
final flag = service.getFlag('new_ui');
```

#### Build-Time Overrides with dart-define

Override feature flags at build time using `dart-define`:

```bash
# Enable a single feature
flutter run --dart-define=FEATURE_FLAGS="example_feature=true"

# Enable multiple features
flutter run --dart-define=FEATURE_FLAGS="example_feature=true,new_ui=false,dark_mode=true"

# Build with feature flags
flutter build apk --dart-define=FEATURE_FLAGS="example_feature=true"
```

#### File Structure
```
lib/
├── models/
│   └── feature_flag.dart          # Freezed models for feature flags
├── providers/
│   └── feature_flag_provider.dart # Riverpod providers and service
```

#### Architecture
- **FeatureFlag**: Immutable data model using Freezed
- **FeatureFlagService**: Core service managing flags and overrides
- **featureFlagProvider**: Riverpod provider for individual flag checks
- **featureFlagServiceProvider**: Riverpod provider for service access

Build-time overrides take precedence over runtime configuration, allowing deployment-specific feature control.

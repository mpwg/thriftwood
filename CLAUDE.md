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
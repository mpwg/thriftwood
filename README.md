# thriftwood

A new Flutter project.

## CI/CD

This project includes a GitHub Actions CI workflow that runs on every push and pull request to the `main` and `develop` branches. The CI pipeline:

- ✅ Sets up Flutter stable channel
- ✅ Installs project dependencies  
- ✅ Verifies code formatting (`dart format`)
- ✅ Runs static analysis (`flutter analyze`)
- ✅ Executes tests (`flutter test`)
- ✅ Builds Android APK and Web app for validation

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# AI Coding Best Practices Guide

## Overview

This guide establishes standards for creating GitHub issues that are optimized for AI-assisted development. Following these practices ensures consistent, high-quality code implementation with minimal iteration.

## User Story Format

### Template Structure
```markdown
## User Story
**As a** [user type]  
**I want** [functionality]  
**So that** [benefit]

## Value Proposition
[Clear explanation of why this feature matters]

## Acceptance Criteria
- [ ] Specific, measurable outcome 1
- [ ] Specific, measurable outcome 2
- [ ] Performance requirement (if applicable)
- [ ] Security requirement (if applicable)

## Implementation Requirements for AI Coding
- Create: `lib/[domain]/[specific_file].dart`
- Update: `existing_file.dart` (add specific functionality)
- Dependencies: package_name, other_package
- Patterns: Repository, Provider, Freezed models
- Testing: Unit tests with 80%+ coverage

## Technical Details
- Platform considerations
- Performance requirements
- Security constraints
- Integration points

## Definition of Done
- [ ] All acceptance criteria implemented and tested
- [ ] Unit tests passing with required coverage
- [ ] Performance benchmarks met
- [ ] Code review completed
```

## File Structure Conventions

### Flutter/Dart Project Structure
```
lib/
├── models/
│   ├── common/          # Shared models
│   ├── radarr/          # Radarr-specific models
│   ├── sonarr/          # Sonarr-specific models
│   └── downloads/       # Download-related models
├── services/
│   ├── api_clients/     # API client implementations
│   ├── storage/         # Local storage services
│   └── notifications/   # Notification services
├── screens/
│   ├── radarr/          # Radarr-specific screens
│   ├── sonarr/          # Sonarr-specific screens
│   ├── downloads/       # Download management screens
│   └── settings/        # Settings screens
├── widgets/
│   ├── common/          # Reusable widgets
│   ├── forms/           # Form-specific widgets
│   └── media/           # Media-related widgets
├── utils/
│   ├── constants.dart   # App constants
│   ├── helpers.dart     # Utility functions
│   └── extensions.dart  # Dart extensions
└── exceptions/
    └── api_exception.dart
```

## Code Patterns and Conventions

### 1. Data Models
- **Use Freezed** for immutable data classes
- **JSON Serialization** with json_serializable
- **Null Safety** with explicit nullable types
- **Validation** methods for business rules

```dart
@freezed
class Movie with _$Movie {
  const factory Movie({
    required int id,
    required String title,
    String? overview,
    @JsonKey(name: 'release_date') DateTime? releaseDate,
    required bool monitored,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
```

### 2. API Clients
- **Repository Pattern** for data access
- **Dependency Injection** with get_it or riverpod
- **Error Handling** with custom exceptions
- **Retry Logic** with exponential backoff

```dart
class RadarrApiClient {
  final HttpClient _httpClient;
  
  RadarrApiClient(this._httpClient);
  
  Future<List<Movie>> getMovies({int page = 1}) async {
    try {
      final response = await _httpClient.get('/api/v3/movie', 
        queryParameters: {'page': page});
      return (response.data as List)
        .map((json) => Movie.fromJson(json))
        .toList();
    } on HttpException catch (e) {
      throw ApiException.fromHttpException(e);
    }
  }
}
```

### 3. UI Components
- **Stateless Widgets** preferred when possible
- **State Management** with Provider, Bloc, or Riverpod
- **Responsive Design** with LayoutBuilder
- **Accessibility** with semantic labels

```dart
class MovieListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movies')),
      body: Consumer<MovieListViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithResponsiveColumns(
              minWidth: 150,
            ),
            itemCount: viewModel.movies.length,
            itemBuilder: (context, index) {
              return MovieCard(movie: viewModel.movies[index]);
            },
          );
        },
      ),
    );
  }
}
```

### 4. Testing Patterns
- **Unit Tests** for business logic
- **Widget Tests** for UI components
- **Integration Tests** for complete workflows
- **Mocking** with mockito or mocktail

```dart
void main() {
  group('RadarrApiClient', () {
    late RadarrApiClient client;
    late MockHttpClient mockHttpClient;

    setUp(() {
      mockHttpClient = MockHttpClient();
      client = RadarrApiClient(mockHttpClient);
    });

    test('getMovies returns list of movies', () async {
      // Arrange
      when(mockHttpClient.get('/api/v3/movie'))
        .thenAnswer((_) async => Response(data: [movieJson]));

      // Act
      final movies = await client.getMovies();

      // Assert
      expect(movies, isA<List<Movie>>());
      expect(movies.length, 1);
    });
  });
}
```

## Error Handling Patterns

### Custom Exception Hierarchy
```dart
abstract class AppException implements Exception {
  final String message;
  final String? details;
  
  const AppException(this.message, [this.details]);
}

class ApiException extends AppException {
  final int? statusCode;
  final String? endpoint;
  
  const ApiException(String message, {this.statusCode, this.endpoint, String? details})
      : super(message, details);
  
  factory ApiException.fromHttpException(HttpException e) {
    return ApiException(
      'Network request failed',
      statusCode: e.statusCode,
      endpoint: e.uri.path,
      details: e.message,
    );
  }
}

class ValidationException extends AppException {
  final Map<String, String> fieldErrors;
  
  const ValidationException(String message, this.fieldErrors) : super(message);
}
```

## Performance Requirements

### Standard Benchmarks
- **Screen Load Time**: < 2 seconds for initial display
- **Search Response**: < 500ms for local search, < 2s for API search
- **Image Loading**: Progressive loading with placeholders
- **Memory Usage**: < 100MB for typical usage
- **Battery Impact**: Minimal background processing

### Implementation Guidelines
- Use `const` constructors where possible
- Implement proper `ListView.builder` for large lists
- Cache images with `CachedNetworkImage`
- Debounce search inputs (300ms)
- Use pagination for large datasets

## Security Requirements

### Credential Management
- Store API keys in `flutter_secure_storage`
- Never log credentials in any form
- Use certificate pinning for production
- Validate all user inputs

### Data Protection
- Encrypt sensitive local data
- Use HTTPS for all API calls
- Implement proper session management
- Follow OWASP mobile security guidelines

## Testing Requirements

### Coverage Expectations
- **Unit Tests**: 80%+ coverage for services and business logic
- **Widget Tests**: All custom widgets and screens
- **Integration Tests**: Critical user workflows
- **Performance Tests**: Key user interactions

### Test Organization
```
test/
├── unit/
│   ├── models/
│   ├── services/
│   └── utils/
├── widget/
│   ├── screens/
│   └── widgets/
└── integration/
    └── workflows/
```

## Issue Quality Checklist

Before implementing any issue, verify:

- [ ] **User Story Format**: Clear "As a...I want...So that..." structure
- [ ] **Value Proposition**: Explains why feature matters
- [ ] **Specific File Paths**: Exact files to create/modify
- [ ] **Dependencies**: Required packages and services listed
- [ ] **Acceptance Criteria**: Measurable, testable outcomes
- [ ] **Technical Constraints**: Performance, security, platform needs
- [ ] **Error Handling**: How errors should be managed
- [ ] **Testing Requirements**: Coverage and test types specified
- [ ] **Definition of Done**: Clear completion criteria

## Common Anti-Patterns to Avoid

### Issue Creation
- ❌ Vague titles like "Fix the app" or "Add features"
- ❌ Missing implementation guidance
- ❌ No testing requirements
- ❌ Unclear acceptance criteria
- ❌ Missing error handling specifications

### Code Implementation  
- ❌ Hardcoded values instead of constants
- ❌ Missing error handling
- ❌ No input validation
- ❌ Inefficient widget rebuilds
- ❌ Memory leaks in streams/subscriptions

## AI Coding Optimization

### Writing AI-Friendly Issues
1. **Be Specific**: Provide exact file paths and method signatures
2. **Include Examples**: Show expected input/output or UI mockups
3. **List Dependencies**: Specify all required packages
4. **Define Patterns**: Reference existing code patterns to follow
5. **Set Constraints**: Clear performance and security requirements

### Code Review Checklist
- [ ] Follows established patterns
- [ ] Includes comprehensive error handling
- [ ] Has appropriate test coverage
- [ ] Meets performance requirements
- [ ] Follows security best practices
- [ ] Uses consistent naming conventions
- [ ] Includes proper documentation

This guide ensures all team members and AI assistants can contribute effectively to the codebase while maintaining high quality and consistency standards.
# Issue Quality Checklist

Use this checklist before creating or updating any GitHub issue to ensure it's optimized for AI-assisted development.

## Pre-Creation Checklist

### 1. Issue Type Selection
- [ ] **User Story**: New feature or functionality
- [ ] **Epic**: Large feature spanning multiple issues
- [ ] **Bug Report**: Issue with existing functionality
- [ ] **Technical Task**: Infrastructure or technical debt

### 2. Title Standards
- [ ] **Descriptive**: Clearly indicates what the issue addresses
- [ ] **Action-Oriented**: Starts with a verb (e.g., "Add", "Fix", "Implement")
- [ ] **Concise**: Under 80 characters
- [ ] **Specific**: Avoids vague terms like "improve" or "enhance"

**Good Examples:**
- ✅ "Add movie search with TMDB integration"
- ✅ "Fix download progress not updating in real-time"
- ✅ "Implement Radarr API client with retry logic"

**Bad Examples:**
- ❌ "Movies"
- ❌ "Fix bugs"
- ❌ "Improve user experience"

## User Story Quality Check

### 3. User Story Format
- [ ] **As a** [specific user type] - not just "user"
- [ ] **I want** [specific functionality] - actionable and clear
- [ ] **So that** [clear benefit] - explains the value

### 4. Value Proposition
- [ ] **User Impact**: Explains how users benefit
- [ ] **Business Value**: Connects to project goals
- [ ] **Priority Justification**: Why this matters now

### 5. Acceptance Criteria
- [ ] **Checkbox Format**: Each criterion as `- [ ]`
- [ ] **Measurable**: Can be objectively verified
- [ ] **Specific**: Clear pass/fail conditions
- [ ] **Complete**: Covers all functionality aspects
- [ ] **Testable**: Can be validated through testing

**Good Examples:**
- ✅ `- [ ] User can search for movies by title with results appearing within 2 seconds`
- ✅ `- [ ] Search results display poster, title, year, and rating`
- ✅ `- [ ] Invalid search terms show "No results found" message`

**Bad Examples:**
- ❌ `- [ ] Search works well`
- ❌ `- [ ] Good user experience`
- ❌ `- [ ] Fast performance`

## Implementation Requirements

### 6. File Structure Guidance
- [ ] **Specific Paths**: Exact files to create (e.g., `lib/services/radarr_client.dart`)
- [ ] **Update Instructions**: Files to modify with specific changes
- [ ] **Folder Organization**: Follows project conventions

### 7. Dependencies and Packages
- [ ] **Required Packages**: List all needed pub.dev packages
- [ ] **Version Constraints**: Specify if version matters
- [ ] **Internal Dependencies**: Other issues/features required first

### 8. Code Patterns
- [ ] **Architectural Patterns**: Repository, Provider, etc.
- [ ] **Data Patterns**: Freezed models, JSON serialization
- [ ] **UI Patterns**: StatelessWidget, responsive design
- [ ] **Testing Patterns**: Unit tests, widget tests, mocking

## Technical Specifications

### 9. Performance Requirements
- [ ] **Load Times**: Specific timing requirements (e.g., < 2s)
- [ ] **Memory Usage**: Maximum memory consumption
- [ ] **Network Usage**: Caching, request frequency
- [ ] **Battery Impact**: Background processing limits

### 10. Security Requirements
- [ ] **Data Protection**: Encryption needs, secure storage
- [ ] **Authentication**: API key handling, session management
- [ ] **Input Validation**: User input sanitization
- [ ] **Network Security**: HTTPS, certificate validation

### 11. Platform Considerations
- [ ] **Android Specific**: Material Design, navigation
- [ ] **iOS Specific**: Cupertino widgets, iOS guidelines
- [ ] **Web Support**: If applicable, web-specific needs
- [ ] **Responsive Design**: Multiple screen sizes

## Error Handling

### 12. Error Scenarios
- [ ] **Network Errors**: Connection failures, timeouts
- [ ] **API Errors**: HTTP status codes, invalid responses
- [ ] **Validation Errors**: User input validation
- [ ] **Storage Errors**: Local database issues

### 13. Error Presentation
- [ ] **User-Friendly Messages**: Non-technical language
- [ ] **Recovery Options**: Clear next steps for users
- [ ] **Logging Requirements**: What to log for debugging
- [ ] **Fallback Behavior**: Graceful degradation

## Testing Requirements

### 14. Test Coverage
- [ ] **Unit Tests**: Business logic coverage (80%+)
- [ ] **Widget Tests**: UI component testing
- [ ] **Integration Tests**: End-to-end workflows
- [ ] **Performance Tests**: Load and stress testing

### 15. Test Scenarios
- [ ] **Happy Path**: Normal usage scenarios
- [ ] **Edge Cases**: Boundary conditions, empty states
- [ ] **Error Cases**: Failure scenarios and recovery
- [ ] **Performance Cases**: Large datasets, slow networks

## Definition of Done

### 16. Completion Criteria
- [ ] **Functional Requirements**: All acceptance criteria met
- [ ] **Quality Standards**: Code review passed
- [ ] **Testing Standards**: Required tests implemented and passing
- [ ] **Performance Standards**: Benchmarks met
- [ ] **Documentation**: Code and user documentation updated

### 17. Validation Methods
- [ ] **Automated Testing**: CI pipeline passes
- [ ] **Manual Testing**: User scenarios validated
- [ ] **Code Review**: Peer review completed
- [ ] **Performance Testing**: Benchmarks verified

## Labels and Metadata

### 18. Required Labels
- [ ] **Type**: `user-story`, `epic`, `bug`, `technical-task`
- [ ] **Priority**: `priority:high`, `priority:medium`, `priority:low`
- [ ] **Area**: `area:ui`, `area:backend`, `area:models`, etc.
- [ ] **Service**: `service:radarr`, `service:sonarr` (if applicable)

### 19. Optional Labels
- [ ] **Effort**: `effort:small`, `effort:medium`, `effort:large`
- [ ] **Complexity**: `complexity:low`, `complexity:high`
- [ ] **Platform**: `platform:android`, `platform:ios`, `platform:web`

## Final Validation

### 20. AI Readiness Check
- [ ] **Clear Instructions**: AI can understand what to implement
- [ ] **Complete Guidance**: No ambiguity in requirements
- [ ] **Proper Examples**: Code patterns or UI mockups provided
- [ ] **Dependency Chain**: Clear order of implementation
- [ ] **Success Criteria**: Objective measures of completion

### 21. Review Questions
Ask yourself:
- [ ] **Can I implement this?** Would I understand exactly what to build?
- [ ] **Is it focused?** Does it address one specific concern?
- [ ] **Is it testable?** Can I verify it works correctly?
- [ ] **Is it valuable?** Does it deliver clear user or business value?

## Scoring System

Rate each section (1-5 scale):
- **5**: Excellent - Comprehensive and clear
- **4**: Good - Minor improvements needed
- **3**: Adequate - Some gaps but workable
- **2**: Poor - Significant improvements needed
- **1**: Inadequate - Major revision required

**Minimum Score for AI Implementation**: 4.0 average across all applicable sections

## Quick Reference

### Must-Have Elements
1. Clear user story format
2. Specific file paths
3. Measurable acceptance criteria
4. Error handling requirements
5. Testing specifications
6. Definition of done

### Nice-to-Have Elements
1. UI mockups or examples
2. Performance benchmarks
3. Security considerations
4. Related issue links
5. Implementation examples

Use this checklist as a quality gate before submitting any issue for AI implementation.
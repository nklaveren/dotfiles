---
mode: 'agent'
tools: ['codebase']
description: 'Generate comprehensive unit tests for selected code'
---
Generate comprehensive unit tests for the selected code.

## Requirements

### Test Coverage
- Cover all public methods and functions
- Test happy path scenarios
- Test edge cases and error conditions
- Test boundary conditions
- Include negative test cases

### Test Structure
- Use descriptive test names that explain the scenario
- Follow the AAA pattern (Arrange, Act, Assert)
- Group related tests in describe blocks
- Use beforeEach/afterEach for setup and cleanup

### Mocking Strategy
- Mock external dependencies (APIs, databases, file system)
- Mock complex internal dependencies
- Use dependency injection where possible
- Avoid mocking simple utilities

### Test Data
- Use factory functions for creating test data
- Create realistic but minimal test data
- Use different data sets for different scenarios
- Avoid hard-coded values in assertions

### Assertions
- Use specific assertions (toBe, toEqual, toContain, etc.)
- Include meaningful error messages
- Test both positive and negative outcomes
- Verify side effects and state changes

### For React Components
- Test component rendering with different props
- Test user interactions (clicks, form submissions)
- Test conditional rendering
- Test accessibility attributes
- Mock child components if needed

### For API/Service Functions
- Test with valid inputs
- Test with invalid inputs
- Test error handling
- Test async operations
- Mock network calls

Please generate tests that are maintainable, readable, and provide good coverage of the functionality.

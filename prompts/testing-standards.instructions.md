---
applyTo: "**/*.test.ts,**/*.test.tsx,**/*.spec.ts,**/*.spec.tsx"
description: "Testing guidelines and best practices"
---
# Testing Standards

## General Testing Principles
- Follow the AAA pattern (Arrange, Act, Assert)
- Write descriptive test names that explain what is being tested
- Keep tests independent and isolated
- Use meaningful assertions
- Test behavior, not implementation details

## Unit Testing
- Use Jest for unit testing
- Mock external dependencies
- Test edge cases and error conditions
- Aim for high test coverage but focus on critical paths
- Use data-driven tests for multiple input scenarios

## Integration Testing
- Use Playwright for end-to-end testing
- Test user workflows and critical paths
- Use page object pattern for maintainable tests
- Include accessibility testing
- Test on multiple browsers and devices

## React Testing
- Use React Testing Library for component testing
- Test user interactions, not internal state
- Use screen queries to find elements
- Test accessibility attributes
- Mock API calls and external dependencies

## Test Structure
```typescript
describe('ComponentName', () => {
  beforeEach(() => {
    // Setup
  });

  it('should behave as expected when...', () => {
    // Arrange
    // Act
    // Assert
  });
});
```

## Common Testing Patterns
- Use factory functions for test data
- Create reusable testing utilities
- Use custom matchers for domain-specific assertions
- Group related tests in describe blocks
- Use beforeEach/afterEach for setup and cleanup

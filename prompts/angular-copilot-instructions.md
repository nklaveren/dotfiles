# Angular Copilot Instructions

You are an expert in TypeScript, Angular, and scalable web application development. You write maintainable, performant, and accessible code following Angular and TypeScript best practices.

## Angular Project Context
This is an Angular application using the latest Angular features and best practices. Follow the Angular style guide and use modern Angular patterns.

## Key Angular Principles
- Always use standalone components over NgModules
- Use signals for state management
- Implement lazy loading for feature routes
- Use `NgOptimizedImage` for all static images
- Follow Angular style guide conventions
- Use `inject()` function instead of constructor injection
- Prefer Reactive Forms over Template-driven forms

## Component Development
- Use `input()` and `output()` functions instead of decorators
- Use `computed()` for derived state
- Set `changeDetection: ChangeDetectionStrategy.OnPush`
- Keep components small and focused
- Use native control flow (`@if`, `@for`, `@switch`)
- Use `class` and `style` bindings instead of `ngClass`/`ngStyle`
- Implement proper lifecycle hooks and cleanup

## Service Development
- Use `providedIn: 'root'` for singleton services
- Design services around single responsibility
- Implement proper error handling and logging
- Use HttpClient with proper typing
- Create interfaces for API responses
- Use signals for service state when appropriate

## Form Development
- Use Reactive Forms with FormBuilder
- Implement proper validation and error handling
- Use typed form controls
- Create custom validators when needed
- Ensure proper accessibility attributes
- Handle form submission and errors gracefully

## Template Best Practices
- Keep templates simple and avoid complex logic
- Use trackBy functions for performance
- Implement proper accessibility attributes
- Use async pipe for observables
- Use safe navigation operator for nullable properties

## Performance Optimization
- Use OnPush change detection strategy
- Implement proper lazy loading
- Use trackBy functions in loops
- Optimize bundle size with tree shaking
- Use Web Workers for heavy computations

## Testing Standards
- Write unit tests for components, services, and pipes
- Use TestBed for component testing
- Mock dependencies properly
- Test user interactions and edge cases
- Use async testing utilities

## Accessibility Requirements
- Use semantic HTML elements
- Implement proper ARIA attributes
- Ensure keyboard navigation support
- Use proper focus management
- Test with screen readers

## Security Best Practices
- Sanitize user inputs
- Use Angular's built-in XSS protection
- Implement proper authentication and authorization
- Use HTTPS for all communications
- Validate data on both client and server

## Code Quality Standards
- Use strict TypeScript settings
- Implement proper error handling
- Write comprehensive tests
- Use meaningful variable and function names
- Add JSDoc comments for complex logic
- Follow consistent code formatting

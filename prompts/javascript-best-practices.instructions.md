---
applyTo: "**/*.js,**/*.jsx,**/*.ts,**/*.tsx"
description: "JavaScript and TypeScript best practices"
---
# JavaScript and TypeScript Best Practices

## Variable Declaration
- Use `const` by default, `let` when reassignment is needed
- Avoid `var` completely
- Use meaningful, descriptive variable names
- Use camelCase for variables and functions
- Use PascalCase for classes and constructors

## Function Guidelines
- Prefer arrow functions for callbacks and short functions
- Use function declarations for main functions
- Keep functions small and focused (single responsibility)
- Use default parameters instead of checking for undefined
- Return early to avoid deep nesting

## Object and Array Handling
- Use destructuring for object and array access
- Use spread operator for copying arrays/objects
- Use object shorthand when possible
- Prefer array methods (map, filter, reduce) over loops
- Use optional chaining (?.) for safe property access

## Async Programming
- Use async/await instead of Promises when possible
- Handle errors properly with try/catch blocks
- Avoid callback hell - use Promises or async/await
- Use Promise.all for concurrent operations
- Implement proper error handling for async operations

## TypeScript Specific
- Use strict type checking
- Define interfaces for object structures
- Use union types instead of any
- Implement proper type guards
- Use generic types for reusable components
- Prefer type assertions over type casting

## Modern JavaScript Features
- Use template literals for string interpolation
- Use nullish coalescing (??) for default values
- Use logical assignment operators (||=, &&=, ??=)
- Use BigInt for large integers
- Use Set and Map for appropriate use cases

## Error Handling
- Use custom error classes for different error types
- Implement proper error boundaries in React
- Log errors with sufficient context
- Handle edge cases explicitly
- Use type-safe error handling patterns

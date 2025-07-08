---
applyTo: "**/*.ts,**/*.tsx"
description: "TypeScript and React specific coding guidelines"
---
# Project coding standards for TypeScript and React

Apply the [general coding guidelines](./general-coding.instructions.md) to all code.

## TypeScript Guidelines
- Use TypeScript for all new code
- Follow functional programming principles where possible
- Use interfaces for data structures and type definitions
- Prefer immutable data (const, readonly)
- Use optional chaining (?.) and nullish coalescing (??) operators
- Always define explicit types for function parameters and return values
- Use union types instead of any when possible
- Prefer type assertions over type casting

## React Guidelines
- Use functional components with hooks
- Follow the React hooks rules (no conditional hooks)
- Use React.FC type for components with children
- Keep components small and focused
- Use CSS modules for component styling
- Use useState for local state, useContext for global state
- Use useEffect for side effects and cleanup
- Prefer controlled components over uncontrolled
- Use key prop for lists and dynamic content

## File Organization
- One component per file
- Use index.ts files for barrel exports
- Group related files in folders
- Keep test files alongside implementation files

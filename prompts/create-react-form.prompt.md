---
mode: 'agent'
tools: ['githubRepo', 'codebase']
description: 'Generate a new React form component'
---
Your goal is to generate a new React form component.

Ask for the form name and fields if not provided.

Requirements for the form:
* Use form design system components when available
* Use `react-hook-form` for form state management
* Always define TypeScript types for your form data
* Prefer *uncontrolled* components using register
* Use `defaultValues` to prevent unnecessary rerenders
* Use `yup` for validation:
  * Create reusable validation schemas in separate files
  * Use TypeScript types to ensure type safety
  * Customize UX-friendly validation rules
* Include proper error handling and display
* Add loading states for async operations
* Implement proper accessibility attributes
* Use semantic HTML elements
* Add proper form submission handling

## Form Structure
1. Define TypeScript interface for form data
2. Create validation schema
3. Implement form component with proper hooks
4. Add error handling and loading states
5. Include form submission logic
6. Add proper styling classes

## Example Structure
```typescript
interface FormData {
  // Define form fields here
}

const validationSchema = yup.object({
  // Define validation rules
});

export const FormComponent: React.FC = () => {
  // Implementation
};
```

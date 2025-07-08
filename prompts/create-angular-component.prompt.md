---
mode: 'agent'
tools: ['codebase']
description: 'Generate Angular component following best practices'
---
Generate a new Angular component following current best practices and conventions.

## Component Requirements

### Basic Structure
- Use standalone components (default, don't specify `standalone: true`)
- Use `input()` and `output()` functions instead of decorators
- Set `changeDetection: ChangeDetectionStrategy.OnPush`
- Use signals for state management
- Implement proper lifecycle hooks (OnInit, OnDestroy)

### Component Template
- Use native control flow (`@if`, `@for`, `@switch`) instead of structural directives
- Use `class` bindings instead of `ngClass`
- Use `style` bindings instead of `ngStyle`
- Keep templates simple and avoid complex logic
- Use async pipe for observables
- Implement proper accessibility attributes

### State Management
- Use signals for local component state
- Use `computed()` for derived state
- Keep state transformations pure and predictable
- Use `inject()` function instead of constructor injection

### TypeScript
- Use strict typing for all properties and methods
- Prefer type inference when obvious
- Avoid `any` type, use `unknown` when uncertain
- Use interfaces for object shapes

### Forms (if applicable)
- Use Reactive Forms instead of Template-driven
- Implement proper form validation
- Use FormBuilder for form creation
- Handle form submission and errors properly

## Component Structure Template

```typescript
import { Component, ChangeDetectionStrategy, signal, computed, inject } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-component-name',
  standalone: true,
  imports: [CommonModule],
  changeDetection: ChangeDetectionStrategy.OnPush,
  template: `
    <div class="component-container">
      @if (isLoading()) {
        <div class="loading">Loading...</div>
      } @else {
        <div class="content">
          @for (item of items(); track item.id) {
            <div class="item">{{ item.name }}</div>
          }
        </div>
      }
    </div>
  `,
  styles: [`
    .component-container {
      /* Add styles here */
    }
  `]
})
export class ComponentNameComponent implements OnInit, OnDestroy {
  // Signals for state
  private readonly isLoading = signal(false);
  private readonly items = signal<Item[]>([]);
  
  // Computed properties
  readonly itemCount = computed(() => this.items().length);
  
  // Services
  private readonly service = inject(SomeService);
  
  ngOnInit(): void {
    // Initialize component
  }
  
  ngOnDestroy(): void {
    // Cleanup
  }
}

interface Item {
  id: string;
  name: string;
}
```

## Instructions
1. Ask for the component name and purpose if not provided
2. Generate the component following the template above
3. Include proper TypeScript interfaces
4. Add relevant imports
5. Include basic styles structure
6. Add proper error handling if needed
7. Include accessibility attributes in template
8. Add JSDoc comments for complex methods

Please provide a component name and describe its functionality to generate the appropriate Angular component.

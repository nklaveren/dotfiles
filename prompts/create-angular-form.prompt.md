---
mode: 'agent'
tools: ['codebase']
description: 'Generate Angular reactive form following best practices'
---
Generate a new Angular reactive form following current best practices and conventions.

## Form Requirements

### Basic Structure
- Use Reactive Forms instead of Template-driven forms
- Use FormBuilder for form creation
- Implement proper form validation
- Use typed form controls with proper typing
- Handle form submission and errors properly

### Validation
- Use built-in validators where possible
- Create custom validators when needed
- Display validation errors properly
- Implement async validators for server-side validation
- Use proper error messaging

### Accessibility
- Use proper labels and form controls
- Implement ARIA attributes
- Ensure keyboard navigation support
- Use semantic HTML elements
- Provide clear error messages

### TypeScript
- Use strict typing for form controls
- Create interfaces for form data
- Use proper return types for validation
- Implement proper error handling

## Form Structure Template

```typescript
import { Component, ChangeDetectionStrategy, signal, inject } from '@angular/core';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-form-name',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  changeDetection: ChangeDetectionStrategy.OnPush,
  template: `
    <form [formGroup]="form" (ngSubmit)="onSubmit()" class="form-container">
      <h2>Form Title</h2>
      
      <div class="form-field">
        <label for="fieldName">Field Label *</label>
        <input
          id="fieldName"
          type="text"
          formControlName="fieldName"
          class="form-control"
          [class.error]="isFieldInvalid('fieldName')"
          aria-describedby="fieldName-error"
        />
        @if (isFieldInvalid('fieldName')) {
          <div id="fieldName-error" class="error-message" role="alert">
            @if (form.get('fieldName')?.hasError('required')) {
              Field is required
            }
            @if (form.get('fieldName')?.hasError('minlength')) {
              Minimum length is {{ form.get('fieldName')?.getError('minlength')?.requiredLength }}
            }
          </div>
        }
      </div>
      
      <div class="form-field">
        <label for="email">Email *</label>
        <input
          id="email"
          type="email"
          formControlName="email"
          class="form-control"
          [class.error]="isFieldInvalid('email')"
          aria-describedby="email-error"
        />
        @if (isFieldInvalid('email')) {
          <div id="email-error" class="error-message" role="alert">
            @if (form.get('email')?.hasError('required')) {
              Email is required
            }
            @if (form.get('email')?.hasError('email')) {
              Please enter a valid email address
            }
          </div>
        }
      </div>
      
      <div class="form-actions">
        <button
          type="submit"
          [disabled]="form.invalid || isSubmitting()"
          class="btn btn-primary"
        >
          @if (isSubmitting()) {
            <span class="spinner" aria-hidden="true"></span>
            Submitting...
          } @else {
            Submit
          }
        </button>
        
        <button
          type="button"
          (click)="onCancel()"
          class="btn btn-secondary"
        >
          Cancel
        </button>
      </div>
      
      @if (submitError()) {
        <div class="error-message" role="alert">
          {{ submitError() }}
        </div>
      }
    </form>
  `,
  styles: [`
    .form-container {
      max-width: 600px;
      margin: 0 auto;
      padding: 2rem;
    }
    
    .form-field {
      margin-bottom: 1.5rem;
    }
    
    .form-control {
      width: 100%;
      padding: 0.75rem;
      border: 1px solid #ddd;
      border-radius: 4px;
      font-size: 1rem;
    }
    
    .form-control.error {
      border-color: #dc3545;
    }
    
    .error-message {
      color: #dc3545;
      font-size: 0.875rem;
      margin-top: 0.25rem;
    }
    
    .form-actions {
      display: flex;
      gap: 1rem;
      margin-top: 2rem;
    }
    
    .btn {
      padding: 0.75rem 1.5rem;
      border: none;
      border-radius: 4px;
      font-size: 1rem;
      cursor: pointer;
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }
    
    .btn-primary {
      background-color: #007bff;
      color: white;
    }
    
    .btn-primary:disabled {
      background-color: #6c757d;
      cursor: not-allowed;
    }
    
    .btn-secondary {
      background-color: #6c757d;
      color: white;
    }
    
    .spinner {
      width: 1rem;
      height: 1rem;
      border: 2px solid transparent;
      border-top: 2px solid currentColor;
      border-radius: 50%;
      animation: spin 1s linear infinite;
    }
    
    @keyframes spin {
      to {
        transform: rotate(360deg);
      }
    }
  `]
})
export class FormNameComponent {
  private readonly formBuilder = inject(FormBuilder);
  
  // Form state signals
  private readonly isSubmitting = signal(false);
  private readonly submitError = signal<string | null>(null);
  
  // Form definition
  readonly form: FormGroup = this.formBuilder.group({
    fieldName: ['', [Validators.required, Validators.minLength(2)]],
    email: ['', [Validators.required, Validators.email]]
  });
  
  /**
   * Check if a form field is invalid and has been touched
   */
  isFieldInvalid(fieldName: string): boolean {
    const field = this.form.get(fieldName);
    return !!(field && field.invalid && (field.dirty || field.touched));
  }
  
  /**
   * Handle form submission
   */
  async onSubmit(): Promise<void> {
    if (this.form.invalid) {
      this.markAllFieldsAsTouched();
      return;
    }
    
    this.isSubmitting.set(true);
    this.submitError.set(null);
    
    try {
      const formData: FormData = this.form.value;
      
      // Submit form data
      await this.submitForm(formData);
      
      // Reset form on success
      this.form.reset();
      
    } catch (error) {
      this.submitError.set(
        error instanceof Error ? error.message : 'An unexpected error occurred'
      );
    } finally {
      this.isSubmitting.set(false);
    }
  }
  
  /**
   * Handle form cancellation
   */
  onCancel(): void {
    this.form.reset();
    this.submitError.set(null);
  }
  
  /**
   * Mark all form fields as touched to show validation errors
   */
  private markAllFieldsAsTouched(): void {
    Object.keys(this.form.controls).forEach(key => {
      this.form.get(key)?.markAsTouched();
    });
  }
  
  /**
   * Submit form data to server
   */
  private async submitForm(data: FormData): Promise<void> {
    // Implement form submission logic here
    // This would typically call a service
    console.log('Submitting form data:', data);
    
    // Simulate API call
    await new Promise(resolve => setTimeout(resolve, 1000));
  }
}

// Type definitions
interface FormData {
  fieldName: string;
  email: string;
}
```

## Instructions
1. Ask for the form name and fields if not provided
2. Generate the form following the template above
3. Include proper validation for each field
4. Add accessible labels and ARIA attributes
5. Include proper error handling and display
6. Add loading states for form submission
7. Include TypeScript interfaces for form data
8. Add proper styling for form elements

Please provide a form name and describe the fields needed to generate the appropriate Angular reactive form.

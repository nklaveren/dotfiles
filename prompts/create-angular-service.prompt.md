---
mode: 'agent'
tools: ['codebase']
description: 'Generate Angular service following best practices'
---
Generate a new Angular service following current best practices and conventions.

## Service Requirements

### Basic Structure
- Use `@Injectable({ providedIn: 'root' })` for singleton services
- Use `inject()` function instead of constructor injection
- Design around a single responsibility
- Implement proper error handling and logging
- Use HttpClient for HTTP operations with proper typing

### HTTP Operations
- Create typed interfaces for API responses
- Use proper HTTP methods (GET, POST, PUT, DELETE)
- Implement error handling with proper error types
- Use RxJS operators for data transformation
- Implement retry logic where appropriate

### State Management
- Use signals for service state when appropriate
- Keep state transformations pure and predictable
- Implement proper cleanup and resource management
- Use BehaviorSubject for shared state when needed

### TypeScript
- Use strict typing for all methods and properties
- Create interfaces for data models
- Use proper return types for all methods
- Implement proper error handling with typed exceptions

## Service Structure Template

```typescript
import { Injectable, inject, signal } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { Observable, catchError, retry, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ServiceNameService {
  private readonly http = inject(HttpClient);
  private readonly baseUrl = 'api/endpoint';
  
  // Signal for service state (if needed)
  private readonly loading = signal(false);
  
  // Public readonly signals
  readonly isLoading = this.loading.asReadonly();
  
  /**
   * Get all items
   * @returns Observable of items array
   */
  getItems(): Observable<Item[]> {
    this.loading.set(true);
    
    return this.http.get<Item[]>(`${this.baseUrl}/items`).pipe(
      retry(3),
      catchError(this.handleError),
      finalize(() => this.loading.set(false))
    );
  }
  
  /**
   * Get item by ID
   * @param id Item identifier
   * @returns Observable of single item
   */
  getItem(id: string): Observable<Item> {
    return this.http.get<Item>(`${this.baseUrl}/items/${id}`).pipe(
      catchError(this.handleError)
    );
  }
  
  /**
   * Create new item
   * @param item Item to create
   * @returns Observable of created item
   */
  createItem(item: CreateItemRequest): Observable<Item> {
    return this.http.post<Item>(`${this.baseUrl}/items`, item).pipe(
      catchError(this.handleError)
    );
  }
  
  /**
   * Update existing item
   * @param id Item identifier
   * @param item Updated item data
   * @returns Observable of updated item
   */
  updateItem(id: string, item: UpdateItemRequest): Observable<Item> {
    return this.http.put<Item>(`${this.baseUrl}/items/${id}`, item).pipe(
      catchError(this.handleError)
    );
  }
  
  /**
   * Delete item
   * @param id Item identifier
   * @returns Observable of void
   */
  deleteItem(id: string): Observable<void> {
    return this.http.delete<void>(`${this.baseUrl}/items/${id}`).pipe(
      catchError(this.handleError)
    );
  }
  
  /**
   * Handle HTTP errors
   * @param error HTTP error response
   * @returns Observable error
   */
  private handleError(error: HttpErrorResponse): Observable<never> {
    let errorMessage = 'An unknown error occurred';
    
    if (error.error instanceof ErrorEvent) {
      // Client-side error
      errorMessage = `Error: ${error.error.message}`;
    } else {
      // Server-side error
      errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
    }
    
    console.error(errorMessage);
    return throwError(() => new Error(errorMessage));
  }
}

// Type definitions
interface Item {
  id: string;
  name: string;
  description?: string;
  createdAt: Date;
  updatedAt: Date;
}

interface CreateItemRequest {
  name: string;
  description?: string;
}

interface UpdateItemRequest {
  name?: string;
  description?: string;
}
```

## Instructions
1. Ask for the service name and purpose if not provided
2. Generate the service following the template above
3. Include proper TypeScript interfaces for data models
4. Add relevant HTTP methods based on service purpose
5. Include proper error handling
6. Add JSDoc comments for all public methods
7. Include loading state management if needed
8. Add retry logic for HTTP operations where appropriate

Please provide a service name and describe its functionality to generate the appropriate Angular service.

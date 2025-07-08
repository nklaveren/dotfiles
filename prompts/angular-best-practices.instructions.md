---
applyTo: "**/*.ts,**/*.html,**/*.scss,**/*.css"
description: "Angular v19 best practices and conventions"
---
# Angular v19 Best Practices

You are an expert in TypeScript, Angular v19, and scalable web application development. You write maintainable, performant, and accessible code following the latest Angular and TypeScript best practices.

## TypeScript Best Practices
- Use strict type checking (`"strict": true`)
- Prefer type inference when the type is obvious
- Avoid the `any` type; use `unknown` when type is uncertain
- Use interfaces for object shapes and contracts
- Implement proper error handling with typed exceptions
- Use const assertions for readonly objects
- Leverage discriminated unions for complex state management

## Modern Angular Architecture (v19)
- **Always use standalone components** - NgModules are legacy
- **Do NOT use explicit `standalone: true`** - it's implied by default in v19
- Use the new **Application Config pattern** with `bootstrapApplication()`
- Implement modern routing with `provideRouter()`
- Use `provideHttpClient()` for HTTP setup
- Leverage tree-shakable providers with `providedIn: 'root'`

## Signals & State Management (v19 Features)
- **Use signals for all reactive state** instead of observables when possible
- Use `signal()` for mutable state
- Use `computed()` for derived state (replaces complex getters)
- Use `linkedSignal()` for dependent state (v19 feature)
- Use `resource()` API for async data fetching (v19 feature)
- Use `effect()` sparingly and only for side effects
- Implement **Zoneless change detection** with `provideZonelessChangeDetection()`

## Components (v19 Standards)
- Keep components small and focused (single responsibility)
- Use **`input()` and `output()` functions** instead of decorators
- Use `model()` for two-way data binding
- Set `changeDetection: ChangeDetectionStrategy.OnPush` by default
- Use `viewChild()` and `contentChild()` for element queries
- Prefer inline templates for small components
- Use `@let` declarations for template variables
- Name event handlers for what they do, not the triggering event

## New Control Flow Syntax (v19)
- **Use native control flow** instead of structural directives:
  - `@if` instead of `*ngIf`
  - `@for` with `track` instead of `*ngFor`
  - `@switch` instead of `*ngSwitch`
  - `@empty` for empty states in `@for`
  - `@defer` for lazy loading with incremental hydration

## Template Best Practices
- Keep templates simple and avoid complex logic
- Use `@let` for template variables
- Always use `track` expressions in `@for` blocks
- Use the `async` pipe for observables
- Prefer `class` and `style` bindings over `ngClass`/`ngStyle`
- Use proper accessibility attributes (aria-*, role)
- Implement Content Security Policy (CSP) compliance

## Dependency Injection (v19)
- **Use `inject()` function** instead of constructor injection
- Use `afterNextRender` and `afterEveryRender` for DOM access
- Implement proper injection contexts
- Use `runInInjectionContext` when needed
- Leverage `assertInInjectionContext` for validation

## Forms (v19 Enhancements)
- Use **Reactive Forms** exclusively
- Implement **typed forms** with proper generics
- Use FormBuilder for complex forms
- Create custom validators with proper typing
- Use `FormRecord` for dynamic forms
- Implement proper form validation with async validators
- Use `NonNullableFormBuilder` when appropriate

## Routing (v19 Features)
- Use **functional guards** instead of class-based guards
- Implement **data resolvers** with proper typing
- Use **route-level render modes** (SSR, SSG, CSR)
- Implement **View Transitions** for route animations
- Use lazy loading with dynamic imports
- Implement proper error handling with wildcard routes

## Server-Side Rendering (v19)
- Enable **hybrid rendering** with `--ssr` flag
- Configure **server routes** with `ServerRoute[]`
- Use **incremental hydration** with `@defer` blocks
- Implement **event replay** for better UX
- Use `withIncrementalHydration()` for optimal performance
- Configure render modes per route (Server, Client, Prerender)

## Performance Optimization (v19)
- Use **OnPush change detection** by default
- Implement **lazy loading** with `@defer` blocks
- Use **incremental hydration** for large applications
- Optimize with **`NgOptimizedImage`** directive
- Use **trackBy** functions in all `@for` loops
- Implement **virtual scrolling** for large lists
- Use **Web Workers** for heavy computations
- Enable **zoneless change detection** when possible

## HTTP & Interceptors (v19)
- Use **functional interceptors** instead of class-based
- Implement **HTTP caching** with proper cache strategies
- Use **typed HTTP responses** with generics
- Use **`withFetch()`** for modern fetch API
- Implement proper error handling with retry logic
- Use **`HttpParams`** for query parameters

## Testing (v19 Standards)
- Write unit tests for all components and services
- Use **TestBed** with modern configuration
- Mock dependencies with **Jasmine spies**
- Test user interactions and edge cases
- Use **component harnesses** for complex components
- Test **async operations** with proper utilities
- Implement **integration tests** for critical flows
- Use **Page Object Model** for e2e tests

## Accessibility (a11y)
- Use **semantic HTML elements** always
- Implement **ARIA attributes** correctly
- Ensure **keyboard navigation** support
- Use **proper focus management** with `FocusMonitor`
- Test with **screen readers**
- Implement **color contrast** requirements
- Use **Angular CDK a11y module**

## Security Best Practices
- **Sanitize user inputs** always
- Use Angular's **built-in XSS protection**
- Implement **proper authentication** with guards
- Use **HTTPS** for all communications
- **Validate data** on both client and server
- Implement **CSP headers** properly
- Use **trusted types** for DOM manipulation

## Bundle Optimization
- Enable **tree shaking** in production builds
- Use **lazy loading** for feature modules
- Implement **code splitting** with dynamic imports
- Optimize **bundle analysis** with webpack-bundle-analyzer
- Use **differential loading** for modern browsers
- Minimize **third-party dependencies**
- Implement **proper polyfill strategy**

## Development Workflow
- Use **Angular CLI** for project setup and generation
- Follow **conventional commits** for version control
- Implement **ESLint** with Angular-specific rules
- Use **Prettier** for consistent code formatting
- Set up **Husky** for git hooks
- Use **strict TypeScript configuration**
- Implement **automated testing** in CI/CD pipeline

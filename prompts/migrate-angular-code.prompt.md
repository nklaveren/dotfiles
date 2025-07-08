---
mode: 'edit'
description: 'Migrate Angular code to modern best practices'
---
Migrate the selected Angular code to follow current best practices and conventions.

## Migration Areas

### Component Migration
- Convert to standalone components (remove NgModule imports)
- Replace `@Input()` and `@Output()` decorators with `input()` and `output()` functions
- Add `changeDetection: ChangeDetectionStrategy.OnPush`
- Convert class properties to signals where appropriate
- Use `computed()` for derived state
- Replace constructor injection with `inject()` function

### Template Migration
- Replace `*ngIf` with `@if` control flow
- Replace `*ngFor` with `@for` control flow
- Replace `*ngSwitch` with `@switch` control flow
- Replace `ngClass` with `class` bindings
- Replace `ngStyle` with `style` bindings
- Add `trackBy` functions for performance
- Update accessibility attributes

### Service Migration
- Add `providedIn: 'root'` to `@Injectable` decorator
- Replace constructor injection with `inject()` function
- Add proper error handling and logging
- Use signals for service state where appropriate
- Implement proper typing for all methods

### Form Migration
- Convert Template-driven forms to Reactive Forms
- Use FormBuilder for form creation
- Add proper validation and error handling
- Implement proper accessibility attributes
- Use typed form controls

### State Management Migration
- Replace class properties with signals
- Use `computed()` for derived state
- Replace BehaviorSubject with signals where appropriate
- Implement proper cleanup in OnDestroy

## Migration Checklist

### Before Migration
- [ ] Identify current Angular version
- [ ] Check for deprecated features
- [ ] Analyze component structure
- [ ] Review template syntax
- [ ] Check service implementation

### Component Updates
- [ ] Convert to standalone component
- [ ] Update imports to remove NgModule
- [ ] Replace decorators with functions
- [ ] Add OnPush change detection
- [ ] Convert properties to signals
- [ ] Update template control flow
- [ ] Add proper accessibility

### Service Updates
- [ ] Add providedIn root
- [ ] Replace constructor injection
- [ ] Add proper error handling
- [ ] Use signals for state
- [ ] Implement proper typing

### Template Updates
- [ ] Replace structural directives
- [ ] Update class/style bindings
- [ ] Add trackBy functions
- [ ] Improve accessibility
- [ ] Simplify complex logic

### Testing Updates
- [ ] Update component tests
- [ ] Update service tests
- [ ] Test signal updates
- [ ] Test new control flow
- [ ] Verify accessibility

## Example Migrations

### Component Migration
```typescript
// Before
@Component({
  selector: 'app-example',
  template: `
    <div *ngIf="isLoading">Loading...</div>
    <div *ngFor="let item of items; trackBy: trackByFn">
      {{ item.name }}
    </div>
  `
})
export class ExampleComponent {
  @Input() data: any;
  @Output() itemSelected = new EventEmitter();
  
  isLoading = false;
  items: Item[] = [];
  
  constructor(private service: ExampleService) {}
}

// After
@Component({
  selector: 'app-example',
  standalone: true,
  changeDetection: ChangeDetectionStrategy.OnPush,
  template: `
    @if (isLoading()) {
      <div>Loading...</div>
    }
    @for (item of items(); track item.id) {
      <div>{{ item.name }}</div>
    }
  `
})
export class ExampleComponent {
  readonly data = input<any>();
  readonly itemSelected = output<Item>();
  
  private readonly isLoading = signal(false);
  private readonly items = signal<Item[]>([]);
  
  private readonly service = inject(ExampleService);
}
```

### Service Migration
```typescript
// Before
@Injectable()
export class ExampleService {
  constructor(private http: HttpClient) {}
  
  getData() {
    return this.http.get('/api/data');
  }
}

// After
@Injectable({
  providedIn: 'root'
})
export class ExampleService {
  private readonly http = inject(HttpClient);
  
  getData(): Observable<Data[]> {
    return this.http.get<Data[]>('/api/data').pipe(
      catchError(this.handleError)
    );
  }
  
  private handleError(error: HttpErrorResponse): Observable<never> {
    console.error('Service error:', error);
    return throwError(() => new Error('Service error'));
  }
}
```

## Instructions
1. Analyze the current code structure
2. Identify areas for migration
3. Apply modern Angular patterns
4. Ensure proper typing throughout
5. Add proper error handling
6. Update tests accordingly
7. Verify accessibility improvements
8. Test thoroughly after migration

Please provide specific migration recommendations and updated code following Angular best practices.

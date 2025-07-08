---
mode: 'agent'
tools: ['codebase']
description: 'Analyze and optimize code performance'
---
Analyze the selected code for performance issues and provide optimization recommendations.

## Performance Analysis Areas

### Code Efficiency
- Identify inefficient algorithms and data structures
- Look for unnecessary computations and operations
- Check for redundant code execution
- Analyze loop performance and optimization opportunities

### Memory Usage
- Identify memory leaks and unnecessary object creation
- Check for proper cleanup of resources
- Analyze object lifecycle and garbage collection impact
- Look for opportunities to reduce memory footprint

### React Performance (if applicable)
- Check for unnecessary re-renders
- Identify missing useMemo and useCallback optimizations
- Analyze component structure and prop drilling
- Look for opportunities to use React.memo
- Check for proper key usage in lists

### Database & API Performance
- Analyze query efficiency and N+1 problems
- Check for unnecessary API calls
- Look for opportunities to batch operations
- Analyze caching strategies

### Bundle Size & Loading
- Identify large dependencies and unused code
- Check for code splitting opportunities
- Analyze import statements and tree shaking
- Look for dynamic import opportunities

## Optimization Recommendations

Please provide:
1. Specific performance issues found
2. Concrete optimization suggestions
3. Code examples showing the improvements
4. Performance impact estimates where possible
5. Trade-offs and considerations for each optimization

## Measurement
- Suggest appropriate performance metrics to track
- Recommend profiling tools and techniques
- Provide before/after performance comparisons where relevant

Focus on optimizations that will have the most significant impact on user experience and application performance.

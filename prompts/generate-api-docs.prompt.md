---
mode: 'agent'
tools: ['codebase']
description: 'Generate API documentation from code'
---
Generate comprehensive API documentation for the selected code.

## Documentation Requirements

### API Overview
- Provide a clear description of the API's purpose
- List main features and capabilities
- Include authentication requirements
- Specify supported formats (JSON, XML, etc.)

### Endpoints Documentation
For each endpoint, include:
- HTTP method and URL pattern
- Description of functionality
- Request parameters (path, query, body)
- Request examples with sample data
- Response format and structure
- Response examples (success and error cases)
- HTTP status codes and their meanings
- Authentication requirements

### Data Models
- Document all data structures and schemas
- Include field descriptions and types
- Specify required vs optional fields
- Provide example objects
- Document relationships between models

### Error Handling
- List common error codes and messages
- Provide troubleshooting guidance
- Include error response examples
- Document retry strategies where applicable

### Code Examples
- Provide examples in multiple programming languages
- Include both basic and advanced usage scenarios
- Show proper error handling in examples
- Include complete, runnable code samples

### Additional Information
- Rate limiting information
- Versioning strategy
- Deprecation notices
- Performance considerations
- Security best practices

## Format
Generate documentation in Markdown format with:
- Clear headings and structure
- Code blocks with syntax highlighting
- Tables for parameter documentation
- Collapsible sections for detailed information

The documentation should be comprehensive enough for developers to successfully integrate with the API without additional resources.

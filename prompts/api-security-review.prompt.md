---
mode: 'edit'
description: 'Perform a REST API security review'
---
Perform a REST API security review on the selected code:

## Security Checklist

### Authentication & Authorization
- [ ] Ensure all endpoints are protected by authentication and authorization
- [ ] Verify JWT tokens are properly validated
- [ ] Check for proper role-based access control (RBAC)
- [ ] Validate session management

### Input Validation
- [ ] Validate all user inputs and sanitize data
- [ ] Check for SQL injection vulnerabilities
- [ ] Verify XSS protection measures
- [ ] Validate file upload restrictions
- [ ] Check for command injection vulnerabilities

### Rate Limiting & DDoS Protection
- [ ] Implement rate limiting and throttling
- [ ] Add request size limits
- [ ] Implement IP-based restrictions when needed
- [ ] Check for brute force protection

### Data Protection
- [ ] Ensure sensitive data is encrypted at rest and in transit
- [ ] Check for proper password hashing
- [ ] Verify API keys and secrets are not exposed
- [ ] Validate CORS configuration

### Logging & Monitoring
- [ ] Implement logging and monitoring for security events
- [ ] Log failed authentication attempts
- [ ] Monitor for unusual API usage patterns
- [ ] Ensure logs don't contain sensitive information

### Error Handling
- [ ] Avoid exposing sensitive information in error messages
- [ ] Implement proper error status codes
- [ ] Use generic error messages for security-related failures

### Headers & Security
- [ ] Implement proper security headers (HSTS, CSP, etc.)
- [ ] Check for information disclosure in headers
- [ ] Validate content-type headers

Please provide specific recommendations for each area where issues are found.

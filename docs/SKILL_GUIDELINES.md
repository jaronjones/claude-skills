# Skill Writing Guidelines

This guide helps you write clear, effective skills that others can use successfully.

## Overview

A great skill is:
- **Clear** - Easy to understand
- **Complete** - All necessary information
- **Correct** - Tested and accurate
- **Concise** - No unnecessary complexity
- **Consistent** - Follows established patterns

## Structure

### Required Sections

#### 1. Skill Name (H1)
The first line of your SKILL.md:

```markdown
# Docker Compose Helper
```

**Guidelines**:
- Use title case
- Be descriptive and specific
- Keep it under 50 characters
- Make it searchable

#### 2. Overview
2-4 sentences explaining what the skill does:

```markdown
## Overview
This skill helps you create and manage Docker Compose configurations
for multi-container applications. It provides templates and best practices
for common stacks, with validation and troubleshooting built in.
```

**Guidelines**:
- Explain what it does
- Mention key benefits
- Keep it brief but informative

#### 3. When to Use This Skill
List specific use cases:

```markdown
## When to Use This Skill
Use this skill when you need to:
- Set up multi-container development environments
- Deploy applications with multiple services
- Manage service dependencies and networks
- Configure volumes and environment variables
```

**Guidelines**:
- List 3-5 concrete scenarios
- Use bullet points
- Be specific

#### 4. Prerequisites
List everything needed:

```markdown
## Prerequisites
- Docker 20.10+ installed and running
- Docker Compose 2.0+
- Basic understanding of containerization
- Terminal/command line access
```

**Guidelines**:
- Include specific versions
- List required knowledge
- Mention system requirements
- Link to installation guides

#### 5. Instructions
Step-by-step guide:

```markdown
## Instructions

### Step 1: Create Base Configuration
Create a new `docker-compose.yml` file:

\`\`\`yaml
version: '3.8'
services:
  app:
    image: node:18
    ports:
      - "3000:3000"
\`\`\`

### Step 2: Add Services
Add additional services as needed...
```

**Guidelines**:
- Number steps sequentially
- One clear action per step
- Include code examples
- Explain expected outcomes

#### 6. Examples
At least one complete, working example:

```markdown
## Examples

### Example 1: Node.js with PostgreSQL

\`\`\`yaml
version: '3.8'
services:
  app:
    build: .
    ports:
      - "3000:3000"
    depends_on:
      - db
  db:
    image: postgres:14
    environment:
      POSTGRES_PASSWORD: example
\`\`\`

**Usage:**
\`\`\`bash
docker-compose up -d
\`\`\`

**Expected Output:**
\`\`\`
Creating network "project_default"
Creating project_db_1  ... done
Creating project_app_1 ... done
\`\`\`
```

**Guidelines**:
- Show complete examples
- Include expected output
- Test before publishing
- Explain what's happening

### Recommended Sections

#### Best Practices

```markdown
## Best Practices

- **Use version pinning** - Pin image versions to avoid breaking changes
- **Health checks** - Add healthcheck commands for reliability
- **Named volumes** - Use named volumes for data persistence
- **Environment files** - Store secrets in .env files, not compose.yml
```

#### Common Issues

```markdown
## Common Issues

### Port Already in Use

**Problem**: Error "port is already allocated"

**Solution**:
\`\`\`bash
# Find what's using the port
lsof -i :3000

# Change the port in docker-compose.yml
ports:
  - "3001:3000"
\`\`\`

**Why this works**: Maps a different host port to the container port
```

#### Additional Resources

```markdown
## Additional Resources

- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [Awesome Compose](https://github.com/docker/awesome-compose)
- [Compose Specification](https://github.com/compose-spec/compose-spec)
```

## Writing Style

### Voice and Tone

**Use active voice:**
- ✅ "Run the command to start the server"
- ❌ "The command should be run to start the server"

**Use present tense:**
- ✅ "The script creates a backup"
- ❌ "The script will create a backup"

**Use second person:**
- ✅ "You can configure the timeout"
- ❌ "One can configure the timeout"

**Be direct and clear:**
- ✅ "Install Docker before proceeding"
- ❌ "It would be advisable to perhaps install Docker"

### Formatting

#### Code Blocks

Always specify language:

```markdown
\`\`\`bash
echo "Bash script"
\`\`\`

\`\`\`python
print("Python code")
\`\`\`

\`\`\`yaml
key: value
\`\`\`
```

#### Inline Code

Use backticks for:
- Commands: `docker-compose up`
- File names: `config.json`
- Code references: `PORT` variable
- Technical terms: `HTTP` status code

#### Emphasis

- **Bold** for important terms or warnings
- *Italic* for subtle emphasis
- Don't overuse formatting

#### Lists

Unordered lists for non-sequential items:
```markdown
- First item
- Second item
- Third item
```

Ordered lists for sequential steps:
```markdown
1. First step
2. Second step
3. Third step
```

### Command Examples

**Show complete commands:**
```bash
# Good - complete and clear
docker run -d -p 8080:80 --name webserver nginx:latest

# Bad - incomplete
docker run nginx
```

**Include comments:**
```bash
# Pull the latest image
docker pull nginx:latest

# Run the container in detached mode
docker run -d -p 8080:80 nginx:latest
```

**Show expected output:**
```bash
$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED
abc123def456   nginx     "/docker-entrypoint.…"   2 minutes ago
```

## Content Guidelines

### Accuracy

- Test every command
- Verify all examples work
- Check version compatibility
- Update when tools change

### Completeness

- Include all necessary steps
- Don't skip obvious steps
- Explain non-obvious choices
- Link to external resources

### Clarity

- Use simple language
- Define technical terms
- Avoid jargon when possible
- Break complex concepts into steps

### Usefulness

- Focus on practical applications
- Provide real-world examples
- Address common problems
- Share best practices

## Common Mistakes to Avoid

### 1. Assuming Knowledge

❌ **Bad**: "Just use the usual setup process"

✅ **Good**: 
```markdown
### Step 1: Install Dependencies
Install Node.js 18 or higher from nodejs.org, then verify:
\`\`\`bash
node --version  # Should show v18.x.x or higher
\`\`\`
```

### 2. Missing Context

❌ **Bad**:
```bash
npm install
npm start
```

✅ **Good**:
```markdown
### Step 2: Install and Run
Install the project dependencies:
\`\`\`bash
npm install
\`\`\`

Start the development server:
\`\`\`bash
npm start
\`\`\`

The server will be available at http://localhost:3000
```

### 3. Incomplete Examples

❌ **Bad**:
```bash
curl api.example.com
```

✅ **Good**:
```bash
# Make API request
curl -X POST https://api.example.com/users \
  -H "Content-Type: application/json" \
  -d '{"name": "John Doe", "email": "john@example.com"}'

# Expected response
{
  "id": "123",
  "name": "John Doe",
  "email": "john@example.com",
  "created_at": "2026-01-11T19:00:00Z"
}
```

### 4. No Error Handling

❌ **Bad**: Just show the happy path

✅ **Good**: Include troubleshooting
```markdown
## Common Issues

### Command Not Found

**Problem**: `docker: command not found`

**Solution**: Install Docker following the official guide:
https://docs.docker.com/get-docker/

**Verify installation**:
\`\`\`bash
docker --version
\`\`\`
```

### 5. Outdated Information

❌ **Bad**: Reference old versions or deprecated features

✅ **Good**: 
```markdown
## Prerequisites
- Docker 20.10+ (released 2020)
- Docker Compose 2.0+ (not the old docker-compose v1.x)

**Note**: If using older versions, some features may not work.
Check your versions with:
\`\`\`bash
docker --version
docker compose version  # Note: no hyphen in v2
\`\`\`
```

## Testing Your Skill

Before submitting:

1. **Fresh environment test**
   - Test on a clean system if possible
   - Follow your own instructions exactly
   - Note any issues

2. **Multiple scenarios**
   - Test the basic example
   - Test the advanced example
   - Test error cases

3. **Different perspectives**
   - Read as a beginner
   - Read as an expert
   - Is anything confusing?

4. **Technical accuracy**
   - Verify all commands
   - Check all links
   - Validate code syntax

5. **Completeness**
   - Can someone follow without asking questions?
   - Are prerequisites clear?
   - Is output documented?

## Checklist

Before submitting your skill:

- [ ] Skill name is clear and descriptive
- [ ] Overview explains what it does (2-4 sentences)
- [ ] Use cases are listed
- [ ] Prerequisites are complete with versions
- [ ] Instructions are step-by-step
- [ ] At least one complete example
- [ ] Examples are tested and work
- [ ] Expected output is shown
- [ ] Common issues are documented
- [ ] Best practices are included
- [ ] All code blocks have language tags
- [ ] No sensitive information (API keys, etc.)
- [ ] No placeholder text
- [ ] Links work
- [ ] Spell-checked
- [ ] Apache 2.0 license footer

## Getting Feedback

Before final submission:
1. Have someone else try your skill
2. Ask for feedback on clarity
3. Note where they get stuck
4. Revise accordingly

## Continuous Improvement

After publishing:
- Monitor for issues
- Update based on feedback
- Keep current with tool updates
- Add new examples as needed

## Questions?

See these resources:
- [CATEGORIES.md](CATEGORIES.md) - Category guidelines
- [CONTRIBUTING.md](../CONTRIBUTING.md) - Contribution process
- [SKILL_TEMPLATE.md](../SKILL_TEMPLATE.md) - Template to use

Need help? Open a Discussion!

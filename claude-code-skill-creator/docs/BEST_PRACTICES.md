# Best Practices for Writing Claude Code Skills

This guide helps you create effective, professional skills that provide real value.

## Core Principles

### 1. Clarity Over Cleverness

**Good:**
```markdown
## Step 1: Install Dependencies
Run npm install to download required packages:
\`\`\`bash
npm install
\`\`\`
```

**Bad:**
```markdown
## Step 1
npm i
```

**Why:** Clear instructions help users of all skill levels.

### 2. Show, Don't Just Tell

**Good:**
```markdown
### Example: Deploy to Production
\`\`\`bash
./deploy.sh production --validate
\`\`\`

**Expected Output:**
\`\`\`
✓ Validation passed
✓ Building artifacts
✓ Deploying to production
✓ Deployment successful
\`\`\`
```

**Bad:**
```markdown
Use the deploy script with the production flag.
```

**Why:** Examples demonstrate correct usage and expected results.

### 3. Test Everything

- Run every command in your instructions
- Verify all examples work
- Test on a fresh environment when possible
- Document any quirks or edge cases

## Writing Guidelines

### Skill Names

**Do:**
- `git-commit-formatter` - Descriptive and clear
- `api-client-generator` - Shows what it does
- `docker-compose-helper` - Specific and searchable

**Don't:**
- `gcf` - Too abbreviated
- `my-script` - Too generic
- `tool` - Not descriptive

### Descriptions

**Good description:**
> Automates Git commit message formatting according to Conventional Commits specification, ensuring consistent commit history across your team.

**Bad description:**
> A commit tool.

**Elements of good descriptions:**
- What it does (automates formatting)
- How it works (Conventional Commits spec)
- Why it matters (consistent history)

### Instructions

#### Be Sequential

**Good:**
```markdown
### Step 1: Configure Settings
Edit config.json with your preferences:
\`\`\`json
{
  "apiKey": "your-key-here"
}
\`\`\`

### Step 2: Run Setup
Initialize the tool:
\`\`\`bash
./setup.sh
\`\`\`

### Step 3: Test Configuration
Verify everything works:
\`\`\`bash
./validate.sh
\`\`\`
```

**Bad:**
```markdown
Configure settings, run setup, and test.
```

#### Include Context

**Good:**
```markdown
### Step 2: Create Database
Create a PostgreSQL database for the application. The tool expects a database named 'appdb' by default:
\`\`\`bash
createdb appdb
\`\`\`

To use a different name, set the DATABASE_NAME environment variable.
```

**Bad:**
```markdown
### Step 2
\`\`\`bash
createdb appdb
\`\`\`
```

### Examples

#### Complete Examples

Every example should include:
1. **Context** - When to use this example
2. **Input** - Commands or code to run
3. **Output** - What to expect
4. **Explanation** - Why it works this way

**Template:**
```markdown
### Example 2: Advanced Configuration
When you need custom validation rules:

\`\`\`bash
./script.sh --config custom.json --strict
\`\`\`

**Expected Output:**
\`\`\`
✓ Loading custom.json
✓ Running strict validation
✓ All checks passed
\`\`\`

This enables stricter validation than the default mode.
```

#### Multiple Examples

Provide examples for:
- **Basic usage** - Simplest case
- **Common usage** - Typical real-world scenario
- **Advanced usage** - Complex or edge cases

## Common Pitfalls

### 1. Assuming Knowledge

**Bad:**
```markdown
Run the usual npm commands to get started.
```

**Good:**
```markdown
### Prerequisites
- Node.js 18+ installed
- npm 9+ installed

Check your versions:
\`\`\`bash
node --version  # Should show v18.x.x or higher
npm --version   # Should show 9.x.x or higher
\`\`\`
```

### 2. Missing Error Handling

**Bad:**
```markdown
\`\`\`bash
./script.sh input.txt
\`\`\`
```

**Good:**
```markdown
\`\`\`bash
./script.sh input.txt
\`\`\`

**Common Errors:**

- **"File not found"** - Ensure input.txt exists in the current directory
- **"Permission denied"** - Make script executable: `chmod +x script.sh`
```

### 3. Incomplete Cleanup

**Bad:**
```markdown
Run the deployment script.
```

**Good:**
```markdown
### Cleanup
After deployment, remove temporary files:
\`\`\`bash
./cleanup.sh
\`\`\`

This removes build artifacts and temporary credentials.
```

### 4. Hard-Coded Paths

**Bad:**
```markdown
\`\`\`bash
cp /Users/john/project/file.txt ./
\`\`\`
```

**Good:**
```markdown
\`\`\`bash
cp ~/project/file.txt ./
# Or use relative paths:
cp ../project/file.txt ./
\`\`\`
```

## Skill Scope

### When to Create a New Skill

Create a new skill when:
- It solves a distinct problem
- It has clear boundaries
- It provides reusable value
- It's not redundant with existing skills

### When to Extend an Existing Skill

Extend when:
- Adding minor variations
- Improving documentation
- Fixing bugs or errors
- Adding related examples

### Skill Size

**Too small:**
```markdown
# Echo Command

## Overview
Prints text to console.

## Usage
\`\`\`bash
echo "hello"
\`\`\`
```

**Too large:**
```markdown
# Complete DevOps Toolkit

## Overview
Everything for DevOps including Docker, Kubernetes, 
CI/CD, monitoring, logging, security, networking...
```

**Just right:**
```markdown
# Docker Compose Generator

## Overview
Generates docker-compose.yml files for common 
application stacks with best practices built-in.
```

## Organization

### Logical Flow

Structure skills in order of usage:
1. Prerequisites
2. Setup/Installation
3. Configuration
4. Usage
5. Examples
6. Troubleshooting
7. Advanced topics

### Sections

Use sections to organize:
- **Related steps** under one heading
- **Different approaches** in separate sections
- **Progressive complexity** from simple to advanced

## Documentation

### Comments in Code

**Good:**
```bash
# Create backup before modifying
cp config.json config.json.backup

# Update configuration with new values
jq '.timeout = 30' config.json > config.tmp
mv config.tmp config.json
```

**Bad:**
```bash
cp config.json config.json.backup
jq '.timeout = 30' config.json > config.tmp
mv config.tmp config.json
```

### Inline Documentation

**Good:**
```markdown
The `--force` flag bypasses safety checks. Use only when you're 
certain the operation is safe, as it can cause data loss.
```

**Bad:**
```markdown
Use --force to bypass checks.
```

## Quality Checklist

Before submitting a skill, verify:

- [ ] Tested all commands and examples
- [ ] Included clear prerequisites
- [ ] Provided at least one complete example
- [ ] Documented common errors
- [ ] Used consistent formatting
- [ ] No hard-coded personal paths
- [ ] No sensitive information
- [ ] Passed validation script
- [ ] Apache 2.0 license included
- [ ] Copyright year is current

## Examples of Excellence

Look at these example skills for inspiration:
- `examples/git-commit-formatter/` - Clear, focused purpose
- `examples/api-client-generator/` - Good use of templates
- `examples/terraform-scaffolder/` - Complex but well-organized

## Anti-Patterns to Avoid

### Over-Engineering

Don't create overly complex skills for simple tasks.

### Under-Documenting

Don't assume users know context you haven't provided.

### Copy-Paste Documentation

Don't copy from elsewhere without understanding and testing.

### Orphaned Skills

Don't create skills you won't maintain or update.

## Maintenance

### Keeping Skills Current

- Update when tools change significantly
- Fix reported issues promptly
- Add clarifications based on user feedback
- Archive if tool becomes obsolete

### Version Notes

When tools change versions, add notes:

```markdown
## Version Notes

**v2.0 Changes:**
- New `--config` flag replaces old `-c` option
- Default timeout increased to 30s
- Removed deprecated `--legacy` mode
```

## Getting Feedback

Before finalizing:
1. Have someone unfamiliar with the tool try it
2. Ask for feedback on clarity
3. Test on a fresh environment
4. Review with the validation checklist

## Conclusion

Great skills are:
- **Clear** - Easy to understand
- **Complete** - All information needed
- **Correct** - Tested and verified
- **Concise** - No unnecessary complexity
- **Current** - Up-to-date and maintained

Focus on helping users succeed quickly and confidently.

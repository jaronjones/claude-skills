# Skill Format Specification

This document defines the structure and requirements for Claude Code skills.

## File Structure

### Required Files

Every skill must include:

```
skill-name/
├── SKILL.md      # Main documentation (required)
└── LICENSE       # Apache 2.0 license (required)
```

### Optional Files

Skills may include:

```
skill-name/
├── SKILL.md
├── LICENSE
├── scripts/      # Automation scripts
│   ├── setup.sh
│   └── run.sh
├── config/       # Configuration files
│   └── example.json
└── README.md     # Additional documentation (optional)
```

## SKILL.md Format

### Required Sections

#### 1. Skill Name (H1)

The first line must be an H1 heading with the skill name:

```markdown
# My Skill Name
```

**Requirements:**
- Must be the first line of the file
- Use title case
- Be descriptive and clear

#### 2. Overview

A clear description of what the skill does:

```markdown
## Overview
This skill helps you automate deployment pipelines by...
```

**Requirements:**
- 2-4 sentences minimum
- Explain what the skill does
- Describe the value it provides

### Recommended Sections

#### When to Use This Skill

```markdown
## When to Use This Skill
Use this skill when you need to:
- Scenario 1
- Scenario 2
- Scenario 3
```

#### Prerequisites

```markdown
## Prerequisites
- Tool or knowledge required
- Another requirement
```

#### Instructions

```markdown
## Instructions

### Step 1: Setup
Detailed step description...

### Step 2: Execute
More detailed steps...
```

**Best practices:**
- Number steps sequentially
- Include code examples
- Explain expected outcomes

#### Examples

```markdown
## Examples

### Example 1: Basic Usage
Description of the example.

\`\`\`bash
# Command or code here
./script.sh --option value
\`\`\`

**Expected Output:**
\`\`\`
Output example here
\`\`\`
```

**Requirements:**
- At least one complete example
- Show both input and expected output
- Use realistic scenarios

### Optional Sections

#### Best Practices

```markdown
## Best Practices
- Follow this guideline
- Consider this approach
- Avoid this anti-pattern
```

#### Common Issues

```markdown
## Common Issues

### Issue Title
**Problem**: Description of the problem

**Solution**: How to fix it
```

#### Additional Resources

```markdown
## Additional Resources
- [Related Documentation](https://example.com)
- [Tool Website](https://example.com)
```

### License Section

Every SKILL.md must end with:

```markdown
## License
Copyright YYYY Author Name

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

## Markdown Style Guide

### Headers

- Use ATX-style headers (`#` not `===`)
- Leave blank line before and after headers
- Use sentence case for most headers
- H1 for skill name only
- H2 for major sections
- H3 for subsections

### Code Blocks

- Always specify language: ` ```bash `, ` ```python `, etc.
- Include comments in code examples
- Keep examples concise but complete
- Show expected output when relevant

### Lists

- Use `-` for unordered lists (not `*` or `+`)
- Use `1.` for ordered lists
- Indent sublists with 2 spaces
- Leave blank line before and after lists

### Links

- Use descriptive link text: `[Installation Guide](url)`
- Not generic text: `[click here](url)`
- Test all links before submitting

### Emphasis

- Use `**bold**` for important terms
- Use `*italic*` for emphasis
- Use `` `code` `` for inline code, commands, and filenames
- Don't overuse formatting

## Content Guidelines

### Writing Style

- **Clear and concise** - Get to the point quickly
- **Active voice** - "Run the command" not "The command should be run"
- **Present tense** - "The script creates..." not "The script will create..."
- **Second person** - "You can configure..." not "One can configure..."

### Technical Accuracy

- Test all commands and code
- Verify all examples work
- Update for current versions
- Note version-specific behavior

### Completeness

- Include all necessary information
- Don't assume prior knowledge
- Link to prerequisites
- Explain non-obvious steps

### Accessibility

- Describe what code does, don't just show it
- Explain technical terms on first use
- Provide context for examples
- Consider different skill levels

## Validation Rules

### Automatic Checks

The validator checks for:

1. **Required files exist**
   - SKILL.md present
   - LICENSE present (Apache 2.0)

2. **No template placeholders**
   - No `{{VARIABLE}}` syntax
   - No TODO or FIXME markers (warning)

3. **Valid markdown**
   - Balanced code fences (` ``` `)
   - Proper heading hierarchy

4. **Minimum content**
   - At least 20 lines
   - Skill name (H1 header)
   - Reasonable description length

5. **Current copyright**
   - Year matches current year

### Manual Review

During PR review, check for:

- Clear, understandable writing
- Complete, tested examples
- No sensitive information
- Proper formatting and style
- Value to community

## Template Placeholders

When creating skills from templates, replace all:

- `{{SKILL_NAME}}` - Your skill name
- `{{DESCRIPTION}}` - Skill description
- `{{AUTHOR}}` - Your name
- `{{YEAR}}` - Current year
- `{{WHEN_TO_USE}}` - Usage scenarios
- `{{PREREQUISITES}}` - Requirements
- `{{STEP_X_TITLE}}` - Step titles
- `{{STEP_X_INSTRUCTIONS}}` - Step details
- `{{EXAMPLE_X_...}}` - Example content

## Examples

### Minimal Valid Skill

```markdown
# Simple Formatter

## Overview
A basic code formatter for JavaScript files using Prettier.

## Instructions

### Step 1: Install Prettier
\`\`\`bash
npm install -g prettier
\`\`\`

### Step 2: Format Files
\`\`\`bash
prettier --write "**/*.js"
\`\`\`

## Examples

### Example 1: Format Single File
\`\`\`bash
prettier --write src/app.js
\`\`\`

## License
Copyright 2025 Your Name

Licensed under the Apache License, Version 2.0...
```

### Comprehensive Skill

See the `examples/` directory for full examples of well-structured skills.

## Version History

- **1.0.0** (2025-01-11) - Initial specification

# Git Commit Message Formatter

## Overview
Automatically format Git commit messages according to the Conventional Commits specification, ensuring consistent and meaningful commit history across your team.

## When to Use This Skill
Use this skill when you need to:
- Standardize commit messages across a team
- Generate changelogs automatically
- Trigger CI/CD pipelines based on commit types
- Improve commit history readability

## Prerequisites
- Git installed and configured
- Basic understanding of Git workflows
- Terminal/command line access

## Conventional Commits Format

Commit messages should follow this structure:

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Commit Types

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation changes
- **style**: Code style changes (formatting, missing semicolons, etc.)
- **refactor**: Code refactoring
- **test**: Adding or updating tests
- **chore**: Maintenance tasks

## Instructions

### Step 1: Set Up Git Commit Template

Create a commit message template:

```bash
cat > ~/.gitmessage << 'EOF'
# <type>(<scope>): <subject>
#
# <body>
#
# <footer>
#
# Type: feat, fix, docs, style, refactor, test, chore
# Scope: Component or file being changed
# Subject: Short description (imperative mood)
# Body: Detailed explanation (optional)
# Footer: Breaking changes, issue references (optional)
EOF
```

### Step 2: Configure Git to Use Template

```bash
git config --global commit.template ~/.gitmessage
```

### Step 3: Make Commits Using Template

When you commit, Git will open your editor with the template:

```bash
git commit
```

### Step 4: Add Pre-Commit Hook (Optional)

Validate commit messages automatically:

```bash
cat > .git/hooks/commit-msg << 'EOF'
#!/bin/bash

commit_msg_file=$1
commit_msg=$(cat "$commit_msg_file")

# Regex for conventional commits
conventional_commit_regex="^(feat|fix|docs|style|refactor|test|chore)(\(.+\))?: .{1,50}"

if ! echo "$commit_msg" | grep -qE "$conventional_commit_regex"; then
    echo "ERROR: Commit message does not follow Conventional Commits format"
    echo ""
    echo "Format: <type>(<scope>): <subject>"
    echo "Example: feat(auth): add login functionality"
    echo ""
    echo "Valid types: feat, fix, docs, style, refactor, test, chore"
    exit 1
fi
EOF

chmod +x .git/hooks/commit-msg
```

## Examples

### Example 1: New Feature

```bash
git add src/auth/login.go
git commit -m "feat(auth): add OAuth2 login support

Implemented OAuth2 authentication flow with Google and GitHub providers.
Includes token refresh and session management.

Closes #123"
```

### Example 2: Bug Fix

```bash
git add src/api/handler.go
git commit -m "fix(api): resolve null pointer in user handler

Fixed crash when user profile is incomplete.
Added null checks and default values."
```

### Example 3: Documentation

```bash
git add README.md
git commit -m "docs: update installation instructions

Added Docker installation method.
Clarified prerequisite versions."
```

### Example 4: Breaking Change

```bash
git add src/api/
git commit -m "feat(api)!: migrate to REST API v2

BREAKING CHANGE: API endpoints now use /v2/ prefix.
Old /v1/ endpoints deprecated but still functional until 2025-06.

Migration guide: docs/migration-v2.md"
```

## Best Practices

- **Keep subjects under 50 characters** - Forces clarity and conciseness
- **Use imperative mood** - "add feature" not "added feature" or "adds feature"
- **Reference issues** - Include issue numbers in footer when applicable
- **Write descriptive bodies** - Explain the "why" not just the "what"
- **Mark breaking changes** - Use `!` and `BREAKING CHANGE:` footer
- **Be specific with scopes** - Use component or file names

## Common Issues

### Editor Opens Unexpectedly

**Problem**: Git opens an editor when you want to use `-m` flag

**Solution**: Unset the template for quick commits:
```bash
git -c commit.template= commit -m "your message"
```

### Hook Rejected Valid Commit

**Problem**: Pre-commit hook rejects a properly formatted message

**Solution**: Check for:
- Typos in commit type
- Missing colon after type/scope
- Subject longer than 50 chars
- Leading/trailing whitespace

### Want to Skip Validation Once

**Problem**: Need to make a commit that doesn't follow the format

**Solution**: Use `--no-verify` flag:
```bash
git commit --no-verify -m "WIP: temporary commit"
```

## Generating Changelogs

Use tools like `standard-version` or `conventional-changelog`:

```bash
# Install
npm install -g standard-version

# Generate changelog
standard-version

# Or just generate without version bump
npx conventional-changelog -p angular -i CHANGELOG.md -s
```

## Additional Resources

- [Conventional Commits Specification](https://www.conventionalcommits.org/)
- [Semantic Versioning](https://semver.org/)
- [Git Hooks Documentation](https://git-scm.com/docs/githooks)

## License
Copyright 2026 Claude Code Skill Creator Contributors

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

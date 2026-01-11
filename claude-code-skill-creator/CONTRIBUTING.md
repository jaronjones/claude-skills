# Contributing to Claude Code Skill Creator

Thank you for your interest in contributing! This guide will help you submit high-quality skills and improvements.

## 🎯 Ways to Contribute

- **Add new example skills** - Share your working skills with the community
- **Improve existing skills** - Enhance documentation or fix issues
- **Create new templates** - Design templates for specific use cases
- **Improve tooling** - Enhance scripts and validation
- **Update documentation** - Help make guides clearer

## 📝 Contribution Process

### 1. Before You Start

- Check existing skills and issues to avoid duplication
- For major changes, open an issue first to discuss
- Ensure you have the rights to share your skill (if based on proprietary work)

### 2. Creating a New Skill

**Use the wizard:**
```bash
./scripts/create-skill.sh
```

**Or copy a template:**
```bash
./scripts/copy-template.sh basic my-skill-name
```

### 3. Skill Requirements

All skills must include:

- [ ] **SKILL.md** - Complete documentation
- [ ] **LICENSE** - Apache 2.0 license file
- [ ] **Clear name** - Descriptive, lowercase-with-hyphens
- [ ] **Description** - What the skill does and when to use it
- [ ] **Instructions** - Step-by-step usage guide
- [ ] **Examples** - At least one working example
- [ ] **No placeholders** - All `{{TEMPLATE_VARS}}` replaced

### 4. Validation

Before submitting, validate your skill:

```bash
./scripts/validate-skill.sh path/to/your-skill
```

Fix any errors reported by the validator.

### 5. Testing

- Test your skill thoroughly
- Verify all examples work as documented
- Check that instructions are clear and complete
- Ensure no sensitive information is included

### 6. Submit a Pull Request

1. Fork the repository
2. Create a feature branch: `git checkout -b skill/my-new-skill`
3. Add your skill to the `examples/` directory
4. Commit your changes: `git commit -m "Add: my-new-skill"`
5. Push to your fork: `git push origin skill/my-new-skill`
6. Open a pull request

## ✅ Pull Request Checklist

When submitting a PR, ensure:

- [ ] Skill passes validation (`./scripts/validate-skill.sh`)
- [ ] All template placeholders replaced
- [ ] Apache 2.0 LICENSE included
- [ ] Examples are tested and working
- [ ] No sensitive data (API keys, passwords, etc.)
- [ ] Clear commit messages
- [ ] PR description explains what the skill does

## 📋 Skill Quality Guidelines

### Documentation

- **Be clear and concise** - Write for developers unfamiliar with your domain
- **Use examples** - Show, don't just tell
- **Include prerequisites** - List required tools and knowledge
- **Add troubleshooting** - Document common issues and solutions

### Code/Scripts

- **Follow conventions** - Use established patterns and style
- **Add comments** - Explain non-obvious logic
- **Handle errors** - Fail gracefully with helpful messages
- **Make it portable** - Avoid hard-coded paths and assumptions

### Examples

- **Test thoroughly** - Ensure examples actually work
- **Show real usage** - Use realistic scenarios
- **Explain output** - Show what users should expect
- **Cover edge cases** - Include both simple and complex examples

## 🎨 Style Guidelines

### Skill Names

- Use lowercase with hyphens: `my-skill-name`
- Be descriptive: `git-commit-formatter` not `gcf`
- Avoid redundancy: `api-client` not `api-client-skill`

### Markdown

- Use consistent heading levels
- Include code blocks with language tags
- Add blank lines around headings and code blocks
- Keep lines under 120 characters when possible

### Code

- Use 2-space indentation for shell scripts
- Add shebang lines: `#!/bin/bash`
- Include usage/help messages
- Follow bash best practices (use `set -e`, quote variables, etc.)

## 🚫 What Not to Include

- Personal credentials or API keys
- Proprietary or confidential information
- Copyrighted material without permission
- Malicious code or security vulnerabilities
- Incomplete or untested skills

## 🔄 Review Process

1. **Automated checks** - GitHub Actions validates your skill
2. **Maintainer review** - We review for quality and completeness
3. **Feedback** - We may request changes or improvements
4. **Merge** - Once approved, your skill is merged!

## 🏷️ Versioning

- Skills don't use semantic versioning
- Updates should improve documentation or fix issues
- Breaking changes should be discussed in an issue first

## 📜 License

By contributing, you agree that your contributions will be licensed under Apache License 2.0.

All skills in this repository are licensed under Apache 2.0.

## ❓ Questions

- **General questions**: Open a [Discussion](https://github.com/YOUR_USERNAME/claude-code-skill-creator/discussions)
- **Bug reports**: Open an [Issue](https://github.com/YOUR_USERNAME/claude-code-skill-creator/issues)
- **Feature requests**: Open an [Issue](https://github.com/YOUR_USERNAME/claude-code-skill-creator/issues) with the enhancement label

## 🙏 Recognition

Contributors will be:
- Listed in repository contributors
- Mentioned in CHANGELOG for significant contributions
- Credited in skill documentation if they created it

Thank you for helping make Claude Code skills better for everyone!

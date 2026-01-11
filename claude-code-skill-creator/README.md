# Claude Code Skill Creator

Create high-quality Claude Code skills quickly and consistently with templates, validation, and automation.

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![Validate Skills](https://github.com/YOUR_USERNAME/claude-code-skill-creator/actions/workflows/validate-examples.yml/badge.svg)](https://github.com/YOUR_USERNAME/claude-code-skill-creator/actions/workflows/validate-examples.yml)

## 🚀 Quick Start

### Interactive Wizard (Recommended)
```bash
./scripts/create-skill.sh
```

The wizard guides you through:
- Naming your skill
- Choosing a template
- Customizing details
- Auto-validation

### Quick Template Copy
```bash
./scripts/copy-template.sh basic my-awesome-skill
```

## 📋 Features

- 🧙 **Interactive wizard** for guided skill creation
- 📄 **Three templates**: basic, with-scripts, with-config
- ✅ **Automatic validation** ensures quality and completeness
- 📜 **Apache 2.0 licensing** included by default
- 🤖 **GitHub Actions** for automated PR validation
- 📚 **Example skills** for reference and learning
- 🛠️ **Validation tools** to check skill completeness

## 📁 What's Included

```
claude-code-skill-creator/
├── scripts/
│   ├── create-skill.sh      # Interactive wizard
│   ├── copy-template.sh     # Quick template copy
│   └── validate-skill.sh    # Validation tool
├── templates/
│   ├── basic/               # Simple skill template
│   ├── with-scripts/        # Template with automation scripts
│   └── with-config/         # Template with configuration
├── examples/
│   └── ...                  # Example skills for reference
└── docs/
    ├── SKILL_FORMAT.md      # Format specification
    └── BEST_PRACTICES.md    # Writing guidelines
```

## 🎯 Templates

### Basic
Perfect for straightforward documentation-based skills.
- `SKILL.md` - Main documentation
- `LICENSE` - Apache 2.0

### With Scripts
For skills that include automation or helper scripts.
- `SKILL.md` - Main documentation
- `scripts/` - Directory for automation scripts
- `LICENSE` - Apache 2.0

### With Config
For skills requiring configuration files.
- `SKILL.md` - Main documentation
- `config/` - Directory for configuration files
- `LICENSE` - Apache 2.0

## 📖 Usage

### Create a New Skill

**Option 1: Interactive Wizard**
```bash
./scripts/create-skill.sh
```

Follow the prompts to:
1. Name your skill
2. Add a description
3. Choose a template
4. Customize settings
5. Auto-generate and validate

**Option 2: Quick Copy**
```bash
./scripts/copy-template.sh <template> <skill-name> [output-dir]
```

Examples:
```bash
./scripts/copy-template.sh basic git-helper
./scripts/copy-template.sh with-scripts api-wrapper ./my-skills
./scripts/copy-template.sh with-config deployment-tool
```

### Validate a Skill

```bash
./scripts/validate-skill.sh <skill-directory>
```

The validator checks:
- ✅ Required files exist (SKILL.md, LICENSE)
- ✅ Apache 2.0 license is used
- ✅ No template placeholders remain
- ✅ Markdown syntax is valid
- ✅ Reasonable content length
- ✅ Current copyright year

## 🔍 Validation

All skills should pass validation before submission:

```bash
./scripts/validate-skill.sh ./my-skill
```

**Validation checks:**
- Required files present
- Apache 2.0 license included
- No `{{PLACEHOLDER}}` text
- Valid markdown syntax
- Minimum content requirements
- No TODO/FIXME markers (warnings only)

## 🤝 Contributing

We welcome contributions! To add your skill:

1. Create your skill using the wizard or templates
2. Ensure it passes validation
3. Submit a pull request
4. Automated checks will verify your skill

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

## 📚 Documentation

- [Skill Format Specification](docs/SKILL_FORMAT.md) - Detailed format requirements
- [Best Practices](docs/BEST_PRACTICES.md) - Writing effective skills
- [Quick Start Guide](docs/QUICKSTART.md) - Get started fast

## 🎓 Examples

Check out the `examples/` directory for reference implementations:
- Basic skills with simple documentation
- Advanced skills with scripts
- Complex skills with configuration

## 🧰 Requirements

- Bash 4.0+
- Git (for version control)
- Standard Unix utilities (sed, grep, etc.)

## 📜 License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

All skills created with this tool are automatically licensed under Apache 2.0.

## 🙏 Acknowledgments

Created to help teams build consistent, high-quality Claude Code skills.

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/YOUR_USERNAME/claude-code-skill-creator/issues)
- **Discussions**: [GitHub Discussions](https://github.com/YOUR_USERNAME/claude-code-skill-creator/discussions)

## 🗺️ Roadmap

- [ ] Additional templates (Python, Go, Node.js specific)
- [ ] Web-based skill creator
- [ ] Skill versioning support
- [ ] Automated skill testing framework
- [ ] Community skill marketplace

---

**Made with ❤️ for the Claude Code community**

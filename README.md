# Security Audit Skill for Claude Code

A global Claude Code skill that performs comprehensive security audits on any codebase. Analyzes source code, Docker configuration, CI/CD pipelines, dependencies, and more. Produces classified findings, actionable epics, and a professional PDF report.

## Installation

```bash
cd /path/to/security-audit
chmod +x install.sh
./install.sh
```

This creates a symlink from `~/.claude/skills/security-audit` to the skill directory.

## Usage

In any project with Claude Code:

```
/security-audit          # Full audit (all categories)
/security-audit docker   # Docker & container security only
/security-audit api      # API & network security only
/security-audit auth     # Authentication & authorization only
/security-audit dependencies  # Dependency analysis only
/security-audit config   # Configuration review only
/security-audit network  # Network & transport security only
```

## What It Does

### Phase 1 – Analysis

Systematically examines the codebase across these categories:

| Category | Checks |
|----------|--------|
| Source Code | Injection (SQL, Command, SSRF, XSS), input validation, hardcoded secrets, insecure crypto |
| Auth | Token handling, session management, credential storage, token leakage |
| Docker | Root user, unnecessary packages, missing security options, secret handling |
| CI/CD | Secret exposure in logs, missing image scans, SAST/DAST |
| Dependencies | Known CVEs, outdated packages, unnecessary dependencies |
| Configuration | TLS enforcement, CORS, rate limits, security headers, insecure defaults |
| Network | Cleartext transmission, timeouts, body size limits, DNS rebinding |

Findings are classified by severity: CRITICAL, HIGH, MEDIUM, LOW.

### Phase 2 – Epics

Creates actionable epics in `docs/epics/` with:
- One epic per severity level
- Concrete tickets with file/line references
- Fix code suggestions
- Testable acceptance criteria

### Phase 3 – PDF Report

Generates a professional PDF report containing:
- Executive summary
- Security score (A/B+/B/C/D rating)
- Findings overview table
- Detailed findings with code references
- Positive findings (what's already done well)
- Risk matrix (likelihood vs. impact)
- References (OWASP, CWE, NIST)

## Scoring

```
Score = 100 - (Critical * 20) - (High * 10) - (Medium * 4) - (Low * 1)
```

| Score | Grade | Color |
|-------|-------|-------|
| 90-100 | A | Dark green |
| 75-89 | B+ | Green |
| 60-74 | B | Yellow |
| 40-59 | C | Orange |
| 0-39 | D | Red |

## Files

| File | Purpose |
|------|---------|
| `SKILL.md` | Main skill definition (prompt + frontmatter) |
| `report-template.html` | HTML/CSS template for PDF generation |
| `references.md` | Security reference catalog (OWASP, CWE, URLs) |
| `install.sh` | Symlink installer |
| `README.md` | This file |

## Requirements

- Claude Code CLI
- Google Chrome (for headless PDF generation)

## License

MIT

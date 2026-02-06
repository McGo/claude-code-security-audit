# Security Audit Skill for Claude Code

A global Claude Code skill that performs comprehensive security audits on any codebase. Analyzes source code, Docker configuration, CI/CD pipelines, dependencies, and more. Produces classified findings, actionable epics, and a professional PDF report.

## Installation

```bash
git clone git@github.com:McGo/claude-code-security-audit.git
cd claude-code-security-audit
chmod +x install.sh
./install.sh
```

### What `install.sh` does

The script creates a single symlink: `~/.claude/skills/security-audit` → the cloned repo directory. That's it.

Specifically, it:
1. Creates `~/.claude/skills/` if it doesn't exist (`mkdir -p`)
2. Creates (or updates) the symlink so Claude Code can discover the skill
3. Refuses to overwrite anything that isn't already a symlink — if a regular file or directory exists at the target path, it exits with an error

What it does **not** do:
- Does **not** install any packages, binaries, or dependencies
- Does **not** modify your shell profile, PATH, or environment variables
- Does **not** download anything from the internet
- Does **not** require or request elevated privileges (`sudo`)
- Does **not** touch any files outside `~/.claude/skills/`

You can review the script yourself — it's ~30 lines of bash.

## Usage

In any project with Claude Code:

```
/security-audit                # Full audit (all categories, English)
/security-audit docker         # Docker & container security only
/security-audit api            # API & network security only
/security-audit auth           # Authentication & authorization only
/security-audit dependencies   # Dependency analysis only
/security-audit config         # Configuration review only
/security-audit network        # Network & transport security only
/security-audit lang=de        # Full audit in German
/security-audit docker lang=de # Category audit in German
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

**File naming:**
- First audit: `[projectname]-security-audit-YYYY-MM-DD.pdf`
- Subsequent reviews: `[projectname]-security-review-YYYY-MM-DD-HHmmSS.pdf`

This keeps the original audit as baseline and creates timestamped reviews alongside it for traceability.

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

## Example Output

This repository includes a self-audit as an example of what the skill produces:

- **Initial Audit (Score 90):** [`docs/security-audit/security-audit-security-audit-2026-02-06.pdf`](docs/security-audit/security-audit-security-audit-2026-02-06.pdf)
- **Follow-up Review (Score 92):** [`docs/security-audit/security-audit-security-review-2026-02-06-113004.pdf`](docs/security-audit/security-audit-security-review-2026-02-06-113004.pdf)
- **Epics:** [`docs/epics/`](docs/epics/)
- **Review commit diff:** [`1393e05`](https://github.com/McGo/claude-code-security-audit/commit/1393e05e439e9ec4a4c1f052447109001c034fab) — shows what changes a review produces (L2 fix, updated epics, new review PDF)

## Requirements

- **[Claude Code](https://docs.anthropic.com/en/docs/claude-code)** — the skill runs inside Claude Code
- **Google Chrome** — used in headless mode to convert the HTML report to PDF. The skill auto-detects the Chrome path for macOS, Linux, and Windows (WSL/Git Bash). If Chrome is not found, PDF generation is skipped (epics and summary are still produced)
- **git** — to clone this repository
- **bash** — to run the install script

## License

MIT

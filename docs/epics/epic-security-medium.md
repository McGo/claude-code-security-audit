# Epic: Security Hardening – Medium Findings

**Status:** open
**Priority:** MEDIUM
**Source:** Security Audit, 2026-02-06

## Description

Two medium-severity defense-in-depth gaps were identified: an overly broad Bash permission rule in the local Claude settings and the use of the `--no-sandbox` flag in the Chrome headless PDF generation command documented in the skill prompt.

---

## Tickets

### 1.1 – Restrict Overly Broad Bash Permission

**File:** `.claude/settings.local.json`
**Finding:** M1 – The permission `Bash(bash:*)` allows arbitrary bash command execution without user confirmation, which is unnecessarily broad and could be exploited if the skill is extended or if other skills share this settings context.

**Current Code (.claude/settings.local.json:3-7):**
```json
"permissions": {
    "allow": [
      "Bash(git add:*)",
      "Bash(git commit:*)",
      "Bash(bash:*)"
    ]
  }
```

**Required Changes:**

1. Remove the overly broad `Bash(bash:*)` permission. If specific bash commands are needed, allow them individually:

```json
"permissions": {
    "allow": [
      "Bash(git add:*)",
      "Bash(git commit:*)"
    ]
  }
```

2. If Chrome headless execution is needed, add a specific permission for it rather than a blanket allowance.

---

### 1.2 – Remove `--no-sandbox` from Chrome Headless Command

**File:** `SKILL.md`
**Finding:** M2 – The Chrome headless command in the skill prompt uses `--no-sandbox`, which disables Chrome's sandbox security. While this may be required in some CI/container environments, it is unnecessary and insecure on local macOS execution where the skill is designed to run.

**Current Code (SKILL.md:147-151):**
```bash
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --headless --disable-gpu --no-sandbox \
  --print-to-pdf="docs/security-audit/[projectname]-security-audit-YYYY-MM-DD.pdf" \
  --print-to-pdf-no-header \
  "docs/security-audit/[projectname]-security-audit-YYYY-MM-DD.html"
```

**Required Changes:**

1. Remove the `--no-sandbox` flag since the skill targets macOS local execution:

```bash
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --headless --disable-gpu \
  --print-to-pdf="docs/security-audit/[projectname]-security-audit-YYYY-MM-DD.pdf" \
  --print-to-pdf-no-header \
  "docs/security-audit/[projectname]-security-audit-YYYY-MM-DD.html"
```

2. If container/CI support is needed in the future, document `--no-sandbox` as an optional flag with an explanatory comment rather than including it by default.

---

## Acceptance Criteria

- [ ] `.claude/settings.local.json` no longer contains `Bash(bash:*)` permission
- [ ] `SKILL.md` Chrome headless command no longer includes `--no-sandbox`
- [ ] PDF generation still works correctly on macOS after removing `--no-sandbox`

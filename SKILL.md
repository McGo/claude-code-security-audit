---
name: security-audit
description: Comprehensive security audit with findings classification, epic generation, and PDF report
disable-model-invocation: true
---

# Security Audit Skill

Du fuehrst einen vollstaendigen Security-Audit der aktuellen Codebase durch. Der Audit besteht aus drei Phasen: Analyse, Epic-Erstellung und PDF-Report-Generierung.

**Scope:** `$ARGUMENTS` (default: `full` – alle Kategorien). Moegliche Einschraenkungen: `docker`, `api`, `auth`, `dependencies`, `config`, `network`.

---

## Phase 1 – Analyse

Untersuche die Codebase systematisch in diesen Kategorien:

### 1.1 Analyse-Kategorien

| Kategorie | Was pruefen |
|-----------|-------------|
| **Source Code** | Injection-Schwachstellen (SQL, Command, SSRF, XSS), unsichere Deserialisierung, fehlende Input-Validierung, hartcodierte Secrets, unsichere Crypto |
| **Authentifizierung & Autorisierung** | Token-Handling, Session-Management, fehlende Auth-Checks, Token-Leakage (Logs, Errors), Credential-Speicherung |
| **Docker & Container** | Root-User, ueberfluessige Packages, fehlende Security-Optionen (read_only, no-new-privileges, cap_drop), Secret-Handling, Base-Image-Aktualitaet |
| **CI/CD Pipeline** | Secret-Exposure in Logs, fehlende Image-Scans, unsichere Registry-Konfiguration, fehlende SAST/DAST |
| **Dependencies** | Bekannte CVEs (pruefe package.json/requirements.txt/go.mod etc.), veraltete Packages, ueberfluessige Dependencies |
| **Konfiguration** | Fehlende TLS-Erzwingung, offene CORS, fehlende Rate-Limits, unsichere Defaults, fehlende Security-Header |
| **Netzwerk & Transport** | Cleartext-Uebertragung, fehlende Timeouts, unbegrenzte Body-Groessen, DNS-Rebinding |

### 1.2 Vorgehen

1. Lies `CLAUDE.md`, `README.md`, `package.json` (oder aequivalent) fuer Projektueberblick
2. Durchsuche `src/` (oder Haupt-Sourceverzeichnis) rekursiv
3. Pruefe `Dockerfile`, `docker-compose*.yml`, `.gitlab-ci.yml`, `.github/workflows/`
4. Pruefe Konfigurationsdateien (`.env*`, `config.*`, etc.)
5. Pruefe `package-lock.json`/`yarn.lock`/`go.sum` auf bekannte vulnerable Versionen

### 1.3 Finding-Klassifikation

Klassifiziere jedes Finding nach Schweregrad:

| Schweregrad | Kriterien | Kuerzel |
|-------------|-----------|---------|
| **KRITISCH** | Direkt ausnutzbar, Remote Code Execution, Credential-Theft, vollstaendige Kompromittierung | K1, K2, ... |
| **HOCH** | Ausnutzbar mit Vorbedingungen, signifikanter Impact, Datenverlust moeglich | H1, H2, ... |
| **MITTEL** | Defense-in-Depth-Luecke, Best-Practice-Verstoss mit konkretem Risiko | M1, M2, ... |
| **NIEDRIG** | Haertungsmassnahme, minimaler direkter Impact, Verbesserungsvorschlag | N1, N2, ... |

Fuer jedes Finding dokumentiere:
- **ID** und **Titel**
- **Datei und Zeile** (soweit moeglich)
- **Beschreibung** des Problems
- **Aktueller Code** (relevanter Ausschnitt)
- **Empfohlene Behebung** mit konkretem Code-Vorschlag
- **OWASP Top 10** Zuordnung (falls zutreffend)
- **CWE-Nummer** (konsultiere die references.md in diesem Skill-Verzeichnis)

### 1.4 Positiv-Findings

Dokumentiere auch, was gut umgesetzt ist. Beispiele:
- Bereits vorhandene Input-Validierung
- Korrekte Secret-Behandlung
- Security-Header vorhanden
- Dependency-Management auf aktuellem Stand

---

## Phase 2 – Epics erstellen

Erstelle in `docs/epics/` je ein Epic pro Schweregrad mit konkreten Tickets:

### 2.1 Epic-Struktur

Fuer jeden Schweregrad (bei dem Findings existieren) erstelle eine Datei:

- `docs/epics/epic-security-critical.md` – Kritische Findings
- `docs/epics/epic-security-high.md` – Hohe Findings
- `docs/epics/epic-security-medium.md` – Mittlere Findings
- `docs/epics/epic-security-low.md` – Niedrige Findings

### 2.2 Epic-Format

```markdown
# Epic: Security Hardening – [Schweregrad] Findings

**Status:** open
**Priority:** [CRITICAL/HIGH/MEDIUM/LOW]
**Source:** Security Audit, [Datum]

## Description

[1-2 Saetze Zusammenfassung]

---

## Tickets

### [Epic-Nr].[Ticket-Nr] – [Titel]

**File:** `[Pfad]`
**Finding:** [ID] – [Kurzbeschreibung]

**Aktueller Code ([Datei]:[Zeilen]):**
\`\`\`[sprache]
[code]
\`\`\`

**Erforderliche Aenderungen:**

1. [Konkrete Anweisung mit Code-Beispiel]
2. [...]

---

## Acceptance Criteria

- [ ] [Testbares Kriterium 1]
- [ ] [Testbares Kriterium 2]
```

### 2.3 Regeln fuer Epics

- Jedes Ticket muss **Datei und Zeile** referenzieren
- Jedes Ticket muss **konkreten Fix-Code** enthalten (nicht nur "sollte gefixt werden")
- Acceptance Criteria muessen **testbar** sein (z.B. "Request mit X gibt Y zurueck")
- Wenn sich Fixes ueberschneiden, cross-referenziere die Tickets
- Reihenfolge innerhalb eines Epics: nach Aufwand/Impact absteigend

---

## Phase 3 – PDF-Report generieren

Generiere einen professionellen Security-Audit-Report als PDF.

### 3.1 Vorgehen

1. Lies das HTML-Template aus diesem Skill-Verzeichnis: `report-template.html`
2. Lies die Referenzen aus diesem Skill-Verzeichnis: `references.md`
3. Befuelle das Template mit den Audit-Ergebnissen (ersetze die Platzhalter-Kommentare)
4. Erstelle das Ausgabeverzeichnis `docs/security-audit/` falls es nicht existiert
5. Schreibe die befuellte HTML-Datei nach `docs/security-audit/[projektname]-security-audit-YYYY-MM-DD.html` (YYYY-MM-DD = aktuelles Datum)
6. Konvertiere via Chrome headless zu PDF:
   ```bash
   "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
     --headless --disable-gpu --no-sandbox \
     --print-to-pdf="docs/security-audit/[projektname]-security-audit-YYYY-MM-DD.pdf" \
     --print-to-pdf-no-header \
     "docs/security-audit/[projektname]-security-audit-YYYY-MM-DD.html"
   ```
7. Loesche die temporaere HTML-Datei

### 3.2 Report-Inhalt

Der Report muss enthalten:

1. **Titelseite** – Projektname, Audit-Datum, Auditor (Claude Code), Gesamt-Rating
2. **Executive Summary** – 3-5 Saetze Zusammenfassung fuer Management
3. **Scoring** – Gesamt-Score als Rating (A/B+/B/C/D) basierend auf:
   - A: Keine kritischen/hohen Findings, max 2 mittlere
   - B+: Keine kritischen, max 2 hohe, wenige mittlere
   - B: Keine kritischen, mehrere hohe
   - C: 1-2 kritische oder viele hohe
   - D: Mehrere kritische Findings
4. **Findings-Tabelle** – Alle Findings mit ID, Schweregrad, Titel, OWASP/CWE
5. **Detaillierte Findings** – Pro Finding: Beschreibung, betroffener Code, Empfehlung
6. **Positiv-Findings** – Was bereits gut umgesetzt ist
7. **Risikomatrix** – Wahrscheinlichkeit vs. Impact Grid
8. **Quellen** – OWASP, CWE, NIST-Referenzen (aus references.md)

### 3.3 Scoring-Ring

Berechne den Score als Prozentwert:

```
Score = 100 - (Kritisch * 20) - (Hoch * 10) - (Mittel * 4) - (Niedrig * 1)
Score = max(0, min(100, Score))
```

Zuordnung:
- 90-100: A (dunkelgruen)
- 75-89: B+ (gruen)
- 60-74: B (gelb)
- 40-59: C (orange)
- 0-39: D (rot)

---

## Ausgabe

Am Ende des Audits zeige eine Zusammenfassung:

```
Security Audit abgeschlossen.

Ergebnis: [Rating] ([Score]/100)
- Kritisch: [n] Findings
- Hoch: [n] Findings
- Mittel: [n] Findings
- Niedrig: [n] Findings
- Positiv: [n] Findings

Erstellte Dateien:
- docs/epics/epic-security-critical.md (falls Findings vorhanden)
- docs/epics/epic-security-high.md (falls Findings vorhanden)
- docs/epics/epic-security-medium.md (falls Findings vorhanden)
- docs/epics/epic-security-low.md (falls Findings vorhanden)
- docs/security-audit/[projektname]-security-audit-YYYY-MM-DD.pdf
```

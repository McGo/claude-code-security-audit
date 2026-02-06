# Security Reference Catalog

Referenzkatalog fuer haeufige Security-Findings. Wird vom Security-Audit-Skill gelesen und im PDF-Report als Quellen-Sektion eingebaut.

---

## Container & Docker

### Container als Root ausfuehren
- **OWASP:** Nicht direkt gelistet (Infrastruktur)
- **CWE:** CWE-250 – Execution with Unnecessary Privileges
- **Referenzen:**
  - https://owasp.org/www-project-docker-security/
  - https://cwe.mitre.org/data/definitions/250.html
  - https://docs.docker.com/engine/security/#linux-kernel-capabilities

### Fehlende Container-Haertung (read_only, no-new-privileges, cap_drop)
- **OWASP:** Nicht direkt gelistet (Infrastruktur)
- **CWE:** CWE-269 – Improper Privilege Management
- **Referenzen:**
  - https://docs.docker.com/engine/security/
  - https://cwe.mitre.org/data/definitions/269.html
  - https://cheatsheetseries.owasp.org/cheatsheets/Docker_Security_Cheat_Sheet.html

### DevDependencies im Produktions-Image
- **OWASP:** A06:2021 – Vulnerable and Outdated Components
- **CWE:** CWE-1104 – Use of Unmaintained Third-Party Components
- **Referenzen:**
  - https://owasp.org/Top10/A06_2021-Vulnerable_and_Outdated_Components/
  - https://docs.docker.com/build/building/best-practices/#apt-get

---

## Injection & Input Validation

### Server-Side Request Forgery (SSRF)
- **OWASP:** A10:2021 – Server-Side Request Forgery
- **CWE:** CWE-918 – Server-Side Request Forgery
- **Referenzen:**
  - https://owasp.org/Top10/A10_2021-Server-Side_Request_Forgery_%28SSRF%29/
  - https://cwe.mitre.org/data/definitions/918.html
  - https://cheatsheetseries.owasp.org/cheatsheets/Server_Side_Request_Forgery_Prevention_Cheat_Sheet.html

### SQL Injection
- **OWASP:** A03:2021 – Injection
- **CWE:** CWE-89 – Improper Neutralization of Special Elements used in an SQL Command
- **Referenzen:**
  - https://owasp.org/Top10/A03_2021-Injection/
  - https://cwe.mitre.org/data/definitions/89.html
  - https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html

### Command Injection
- **OWASP:** A03:2021 – Injection
- **CWE:** CWE-78 – Improper Neutralization of Special Elements used in an OS Command
- **Referenzen:**
  - https://owasp.org/Top10/A03_2021-Injection/
  - https://cwe.mitre.org/data/definitions/78.html
  - https://cheatsheetseries.owasp.org/cheatsheets/OS_Command_Injection_Defense_Cheat_Sheet.html

### Cross-Site Scripting (XSS)
- **OWASP:** A03:2021 – Injection
- **CWE:** CWE-79 – Improper Neutralization of Input During Web Page Generation
- **Referenzen:**
  - https://owasp.org/Top10/A03_2021-Injection/
  - https://cwe.mitre.org/data/definitions/79.html
  - https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html

### Fehlende Input-Validierung / Laengenbegrenzung
- **OWASP:** A03:2021 – Injection
- **CWE:** CWE-20 – Improper Input Validation
- **Referenzen:**
  - https://cwe.mitre.org/data/definitions/20.html
  - https://cheatsheetseries.owasp.org/cheatsheets/Input_Validation_Cheat_Sheet.html

### Unsichere Deserialisierung
- **OWASP:** A08:2021 – Software and Data Integrity Failures
- **CWE:** CWE-502 – Deserialization of Untrusted Data
- **Referenzen:**
  - https://owasp.org/Top10/A08_2021-Software_and_Data_Integrity_Failures/
  - https://cwe.mitre.org/data/definitions/502.html
  - https://cheatsheetseries.owasp.org/cheatsheets/Deserialization_Cheat_Sheet.html

### Path Traversal
- **OWASP:** A01:2021 – Broken Access Control
- **CWE:** CWE-22 – Improper Limitation of a Pathname to a Restricted Directory
- **Referenzen:**
  - https://owasp.org/Top10/A01_2021-Broken_Access_Control/
  - https://cwe.mitre.org/data/definitions/22.html
  - https://cheatsheetseries.owasp.org/cheatsheets/File_Upload_Cheat_Sheet.html

---

## Authentifizierung & Autorisierung

### Hartcodierte Credentials
- **OWASP:** A07:2021 – Identification and Authentication Failures
- **CWE:** CWE-798 – Use of Hard-coded Credentials
- **Referenzen:**
  - https://owasp.org/Top10/A07_2021-Identification_and_Authentication_Failures/
  - https://cwe.mitre.org/data/definitions/798.html

### Fehlende Authentifizierung
- **OWASP:** A07:2021 – Identification and Authentication Failures
- **CWE:** CWE-306 – Missing Authentication for Critical Function
- **Referenzen:**
  - https://owasp.org/Top10/A07_2021-Identification_and_Authentication_Failures/
  - https://cwe.mitre.org/data/definitions/306.html

### Token-Leakage in Logs
- **OWASP:** A09:2021 – Security Logging and Monitoring Failures
- **CWE:** CWE-532 – Insertion of Sensitive Information into Log File
- **Referenzen:**
  - https://owasp.org/Top10/A09_2021-Security_Logging_and_Monitoring_Failures/
  - https://cwe.mitre.org/data/definitions/532.html
  - https://cheatsheetseries.owasp.org/cheatsheets/Logging_Cheat_Sheet.html

### Unsichere Token-Uebertragung (Cleartext)
- **OWASP:** A02:2021 – Cryptographic Failures
- **CWE:** CWE-319 – Cleartext Transmission of Sensitive Information
- **Referenzen:**
  - https://owasp.org/Top10/A02_2021-Cryptographic_Failures/
  - https://cwe.mitre.org/data/definitions/319.html

### Fehlende Token-Format-Validierung
- **OWASP:** A07:2021 – Identification and Authentication Failures
- **CWE:** CWE-287 – Improper Authentication
- **Referenzen:**
  - https://cwe.mitre.org/data/definitions/287.html

### Unsichere Secret-Speicherung (Umgebungsvariablen)
- **OWASP:** A02:2021 – Cryptographic Failures
- **CWE:** CWE-522 – Insufficiently Protected Credentials
- **Referenzen:**
  - https://cwe.mitre.org/data/definitions/522.html
  - https://cheatsheetseries.owasp.org/cheatsheets/Secrets_Management_Cheat_Sheet.html

---

## Netzwerk & Transport

### Fehlende TLS-Erzwingung
- **OWASP:** A02:2021 – Cryptographic Failures
- **CWE:** CWE-311 – Missing Encryption of Sensitive Data
- **Referenzen:**
  - https://owasp.org/Top10/A02_2021-Cryptographic_Failures/
  - https://cwe.mitre.org/data/definitions/311.html
  - https://cheatsheetseries.owasp.org/cheatsheets/Transport_Layer_Security_Cheat_Sheet.html

### Fehlende Rate-Limits
- **OWASP:** Nicht direkt gelistet (DoS/Abuse)
- **CWE:** CWE-770 – Allocation of Resources Without Limits or Throttling
- **Referenzen:**
  - https://cwe.mitre.org/data/definitions/770.html
  - https://cheatsheetseries.owasp.org/cheatsheets/Denial_of_Service_Cheat_Sheet.html

### Fehlende Request-Body-Groessenbegrenzung
- **OWASP:** Nicht direkt gelistet (DoS)
- **CWE:** CWE-770 – Allocation of Resources Without Limits or Throttling
- **Referenzen:**
  - https://cwe.mitre.org/data/definitions/770.html

### Fehlende Request-Timeouts
- **OWASP:** Nicht direkt gelistet (DoS)
- **CWE:** CWE-400 – Uncontrolled Resource Consumption
- **Referenzen:**
  - https://cwe.mitre.org/data/definitions/400.html

### Offene CORS-Policy (Access-Control-Allow-Origin: *)
- **OWASP:** A01:2021 – Broken Access Control
- **CWE:** CWE-942 – Permissive Cross-domain Policy with Untrusted Domains
- **Referenzen:**
  - https://owasp.org/Top10/A01_2021-Broken_Access_Control/
  - https://cwe.mitre.org/data/definitions/942.html
  - https://cheatsheetseries.owasp.org/cheatsheets/HTML5_Security_Cheat_Sheet.html#cross-origin-resource-sharing

### Fehlende Security-Header
- **OWASP:** A05:2021 – Security Misconfiguration
- **CWE:** CWE-693 – Protection Mechanism Failure
- **Referenzen:**
  - https://owasp.org/Top10/A05_2021-Security_Misconfiguration/
  - https://cwe.mitre.org/data/definitions/693.html
  - https://cheatsheetseries.owasp.org/cheatsheets/HTTP_Headers_Cheat_Sheet.html

### DNS-Rebinding
- **OWASP:** A10:2021 – Server-Side Request Forgery
- **CWE:** CWE-350 – Reliance on Reverse DNS Resolution for a Security-Critical Action
- **Referenzen:**
  - https://cwe.mitre.org/data/definitions/350.html

---

## Konfiguration & Deployment

### Unsichere Defaults (Bind 0.0.0.0, Debug-Mode)
- **OWASP:** A05:2021 – Security Misconfiguration
- **CWE:** CWE-1188 – Initialization with an Insecure Default
- **Referenzen:**
  - https://owasp.org/Top10/A05_2021-Security_Misconfiguration/
  - https://cwe.mitre.org/data/definitions/1188.html

### Fehlende Graceful-Shutdown-Behandlung
- **OWASP:** Nicht direkt gelistet (Availability)
- **CWE:** CWE-404 – Improper Resource Shutdown or Release
- **Referenzen:**
  - https://cwe.mitre.org/data/definitions/404.html

### Fehlendes Structured Logging
- **OWASP:** A09:2021 – Security Logging and Monitoring Failures
- **CWE:** CWE-778 – Insufficient Logging
- **Referenzen:**
  - https://owasp.org/Top10/A09_2021-Security_Logging_and_Monitoring_Failures/
  - https://cwe.mitre.org/data/definitions/778.html

---

## Dependencies

### Bekannte CVEs in Dependencies
- **OWASP:** A06:2021 – Vulnerable and Outdated Components
- **CWE:** CWE-1035 – Cross-Cutting Concerns
- **Referenzen:**
  - https://owasp.org/Top10/A06_2021-Vulnerable_and_Outdated_Components/
  - https://nvd.nist.gov/
  - https://www.npmjs.com/advisories (npm)
  - https://github.com/advisories (GitHub Advisory Database)

### Veraltete Dependencies
- **OWASP:** A06:2021 – Vulnerable and Outdated Components
- **CWE:** CWE-1104 – Use of Unmaintained Third-Party Components
- **Referenzen:**
  - https://owasp.org/Top10/A06_2021-Vulnerable_and_Outdated_Components/
  - https://cwe.mitre.org/data/definitions/1104.html

### Ueberfluessige Dependencies (Angriffsflaeche)
- **OWASP:** A06:2021 – Vulnerable and Outdated Components
- **CWE:** CWE-1104 – Use of Unmaintained Third-Party Components
- **Referenzen:**
  - https://owasp.org/Top10/A06_2021-Vulnerable_and_Outdated_Components/

---

## CI/CD Pipeline

### Secret-Exposure in CI/CD-Logs
- **OWASP:** A02:2021 – Cryptographic Failures
- **CWE:** CWE-214 – Invocation of Process Using Visible Sensitive Information
- **Referenzen:**
  - https://cwe.mitre.org/data/definitions/214.html

### Fehlende Image-Scans in Pipeline
- **OWASP:** A06:2021 – Vulnerable and Outdated Components
- **CWE:** CWE-1035 – Cross-Cutting Concerns
- **Referenzen:**
  - https://docs.gitlab.com/user/application_security/container_scanning/
  - https://docs.github.com/en/code-security/supply-chain-security

### Fehlende SAST/DAST in Pipeline
- **OWASP:** A06:2021 – Vulnerable and Outdated Components
- **CWE:** CWE-1035 – Cross-Cutting Concerns
- **Referenzen:**
  - https://owasp.org/www-project-devsecops-guideline/
  - https://docs.gitlab.com/user/application_security/sast/

---

## Allgemeine Referenzen

- **OWASP Top 10:2021:** https://owasp.org/Top10/
- **OWASP Cheat Sheet Series:** https://cheatsheetseries.owasp.org/
- **CWE (Common Weakness Enumeration):** https://cwe.mitre.org/
- **NIST NVD (National Vulnerability Database):** https://nvd.nist.gov/
- **Docker Security Best Practices:** https://docs.docker.com/engine/security/
- **Node.js Security Best Practices:** https://nodejs.org/en/learn/getting-started/security-best-practices
- **OWASP Docker Security Cheat Sheet:** https://cheatsheetseries.owasp.org/cheatsheets/Docker_Security_Cheat_Sheet.html
- **OWASP REST Security Cheat Sheet:** https://cheatsheetseries.owasp.org/cheatsheets/REST_Security_Cheat_Sheet.html

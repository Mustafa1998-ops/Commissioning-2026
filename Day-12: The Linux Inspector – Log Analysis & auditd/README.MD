# 🕵️‍♂️ Day 12: The Linux Inspector – Log Analysis & auditd

## 📝 Overview
Day 12 focuses on Linux-based system forensics, kernel telemetry, audit sub-systems, and web infrastructure triage. The core objective of this phase is to dissect a Linux infrastructure compromise by tracing authentication footprints in `auth.log`, configuring granular system behavior monitoring via `auditd`, and investigating web application attacks using raw access logs and visualization tools.

---

## 🛠️ Core Concepts Covered
*   **Linux File Cabinet Architecture:** Understanding the structure and role of core system directories under `/var/log`.
*   **Authentication Telemetry:** Identifying fingerprints of automated SSH dictionary and brute-force attacks.
*   **Kernel and Subsystem Auditing:** Implementing explicit system watch rules on sensitive configuration items to maintain accountability.
*   **Web Server Evasion and Triage:** Parsing server request trails to filter automated scanning applications, path traversals, and SQL injection payloads.

---

## 🗄️ Core Linux Log Sources & Telemetry Reference

| Log Pathway | Core Purpose | Forensic Significance / Detection Value |
| :--- | :--- | :--- |
| `/var/log/auth.log` | Records all authentication events (SSH sessions, `sudo` elevations, account creations). | Essential for verifying initial access vectors, failed credentials, or elevation attempts. |
| `/var/log/syslog` | General-purpose engine log containing system daemons, background tasks, and general service shifts. | Serves as a baseline operational catch-all when auditing unclassified service behaviors. |
| `/var/log/kern.log` | Low-level kernel events, hardware triggers, and hardware driver alerts. | Useful for validating physical modifications or validating system failures vs. attacks. |
| `/var/log/apache2/access.log` | Logs every inbound HTTP connection, request parameter, status code, and browser agent string. | Captures application-layer attacks such as directories enumerations, fuzzing, and code injections. |
| `/var/log/mysql/error.log` | Captures engine failures, memory aborts, database access issues, and query drops. | Flags service corruption, blind injection aftermaths, or underlying persistence tables modifications. |

---

## 🔬 Lab Investigation Steps & Achievements

### 🧩 Task 49 & 50: SSH Brute Force Mitigation & Log Reporting
*   **Attack Visualization:** Triaged a simulated automated Hydra brute-force campaign targeted directly at administrative network entities.
*   **Fingerprint Isolation:** Evaluated the unmistakable progression within `/var/log/auth.log`, tracking an aggressive cycle of **Failed password** lines across multiple users culminating in a single **Accepted password** from an external adversary entity (`[REDACTED IP]`).
*   **Reporting:** Compiled a definitive *Failed Logins Report* summarizing parameters such as total failure windows, unique source indicators, and recommended remediation plays (e.g., implementing strict rate limiting tools like `fail2ban` and mandatory certificate-based authentications).

### 💻 Task 51 & 52 + AT51: Hardening with auditd (System Auditor)
*   **Watch Implementation:** Configured custom execution watch parameters using the system monitor subsystem (`auditctl`) to trace dynamic changes across crucial authorization records:
    ```bash
    sudo auditctl -w /etc/passwd -p wa -k passwd_changes
    sudo auditctl -w /etc/crontab -p wa -k crontab_change
    ```
*   **Event Correlation:** Validated telemetry tracking output lines by executing testing configurations (`useradd svc_backup`), generating verifiable audit messages containing explicit context identifiers (`comm="useradd"`, `exe="/usr/sbin/useradd"`).
*   **Forensic Retrieval:** Extracted tracking artifacts from the data payload using the native search engine utility:
    ```bash
    ausearch -k passwd_changes
    ```

### 🧭 Task 52 & AT52: Web Layer Triage & Dashboard Analytics
*   **Payload Inspection:** Filtered raw production server indicators to identify web application vulnerabilities. Discovered severe application targeting vectors including:
    *   **SQL Injection (SQLi):** `GET /login.php?id=1' OR 1=1--` matching anomalous user-agent markers (`sqlmap/1.7`).
    *   **Configuration Discovery Traversal:** Scanner paths (`GET /.env` or `GET /backup.sql`) matching fingerprint automation utilities (`Nikto/2.5.0`).
*   **Data Aggregation:** Leveraged the automated visualization framework `goaccess` to translate thousands of raw server strings into clean operational metrics, organizing top inbound connections, 404 response errors, and malicious engine strings.

---

## 🏁 Forensic Quick Reference Command Matrix

| Analytical Command | Intended Analytical Action |
| :--- | :--- |
| `grep "Failed password" /var/log/auth.log` | Rapidly isolates failed SSH login attempts, timestamps, and usernames. |
| `auditctl -w <path> -p wa -k <key>` | Sets a watch rule on a file for writes (`w`) and attribute changes (`a`), tagged with a searchable key. |
| `auditctl -l` | Lists all currently active and operational audit rules running on the core kernel engine. |
| `ausearch -k <key>` | Queries the system audit log trail to pull entries matching a specific rule key label. |
| `goaccess access.log` | Compiles raw web activity files into an interactive terminal-based tracking dashboard. |

---

**🏆 Verified Flag:** `CTF{4u51t_tr41l_n3v3r_l13s}`

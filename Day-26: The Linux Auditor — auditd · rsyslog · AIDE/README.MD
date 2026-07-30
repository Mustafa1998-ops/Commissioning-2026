# Day 26: The Linux Auditor — auditd · rsyslog · AIDE

## 📝 Overview
Linux auditing provides crucial visibility into everything that happens on a system, tracking exactly who changed what, when, and how. This module focuses on establishing a robust Linux auditing environment by configuring kernel-level monitoring, centralizing logs, and implementing cryptographic file integrity checks.

*Note: Target IP addresses and sensitive identifiers have been redacted from configurations (e.g., `[REDACTED_IP]`) to adhere to strict operational security guidelines.*

---

## 🎯 Objectives Completed
* **auditd Rules (Task 105):** Built custom `auditd` rules to monitor critical files (like `/etc/passwd` and `/etc/shadow`) and track system calls such as `execve()` for command execution.
* **Log Hunting with ausearch (Task 106):** Searched through audit logs for specific events using custom keys, timestamps, and user filters to turn raw logs into actionable intelligence.
* **Centralized Logging (Tasks 107 & 108):** Configured `rsyslog` server and client architectures to aggregate logs from multiple systems into a central server via TCP/UDP port 514.
* **osquery SQL Hunting (AT77):** Utilized `osquery` to query system information—including processes, users, and file metadata—using standard SQL syntax.
* **File Integrity Monitoring (AT78):** Initialized and ran AIDE (Advanced Intrusion Detection Environment) to build a baseline database and detect unauthorized changes to critical system files.

---

## 🧠 What I Learned
During this hands-on lab, I reinforced several core Linux auditing concepts:

* **auditd:** The Linux Auditing System allows for kernel-level monitoring of system calls, file accesses, and user activity.
* **rsyslog:** Acts as a centralized logging server, aggregating logs from multiple Linux hosts to enable correlation and broader analysis.
* **AIDE (File Integrity Monitoring):** Detects unauthorized modifications to critical files by comparing current cryptographic checksums against a known-good database.
* **osquery:** Extends system auditing by allowing defenders to interrogate the operating system like a relational database.

---

## 🛠️ Toolset & Command Reference

| Component / Command | Purpose |
| :--- | :--- |
| **`auditctl -w /etc/passwd -p wa -k passwd_changes`** | Sets a watch on `/etc/passwd` for write/attribute changes. |
| **`auditctl -a always,exit -S execve -k process_exec`** | Monitors all command executions via the `execve` syscall. |
| **`ausearch -k passwd_changes -ts today`** | Searches the audit log for specific key events occurring today. |
| **`$ModLoad imtcp` / `$InputTCPServerRun 514`** | Configures the `rsyslog` server to load the TCP module and listen on port 514. |
| **`*.* @@[REDACTED_IP]:514`** | Configures the `rsyslog` client to forward all logs to the central server. |
| **`aide --init` & `aide --check`** | Initializes the AIDE database and subsequently checks for file modifications. |
| **`SELECT * FROM file WHERE path LIKE '/etc/%'`** | An `osquery` command to list file details within the `/etc/` directory. |

---

## 🔍 Key Findings & Analysis
* **User Accountability:** Utilizing `ausearch`, I successfully tracked and identified specific modifications to `/etc/passwd` made by the `root` and `student` users.
* **Log Aggregation:** The `rsyslog` server successfully received and processed remote logs, capturing activities such as SSH logins, cron job executions, and failed authentication attempts.
* **Integrity Breaches Detected:** The AIDE FIM successfully detected simulated attacks, explicitly flagging MD5 hash changes in both `/etc/passwd` and `/etc/shadow`, as well as unauthorized permission changes (from `644` to `640`) on `/etc/sudoers`.
* **System Promotion:** Completing the Linux Auditing Mastery track resulted in a promotion to the rank of **CSM (Command Sergeant Major)**.

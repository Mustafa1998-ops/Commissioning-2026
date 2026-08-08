# Day 41: The Detection — Blue Team Monitoring

## 📝 Overview
The attackers are inside; now the hunt begins. Every alert is a clue, and every log tells a story. Day 41 focuses on Blue Team operations, specifically the triage and investigation of security alerts, mapping the attack flow through process ancestry, and executing immediate containment and eradication procedures.

---

## 🎯 Objectives Completed
* **Alert Review & Triage (Task 163):** Actively monitored the SIEM dashboard, successfully investigating and correlating alerts spanning multiple sources including Suricata (Network), Sysmon (Endpoint), and Wazuh (EDR).
* **Process Tree Investigation:** Mapped the attacker's execution flow by analyzing parent-child process relationships, confirming that `cmd.exe` spawned an obfuscated `powershell.exe`, which subsequently dropped and executed `mimikatz.exe`.
* **Incident Assessment (Task 164):** Drafted a formal Incident Assessment report documenting the "What" (Mimikatz execution), "When" (Timestamp), "Where" (affected systems), and current operational status.
* **Response Actions (Task 165):** Tracked and confirmed the execution of standard Incident Response procedures: Detection Confirmation, Investigation Status, Containment (Host Isolation), and Eradication (Process termination and file removal).
* **YARA Hunt (AT104):** Executed a targeted YARA scan across the environment to detect further compromises, successfully identifying the presence of `mimikatz.exe`, `payload.exe`, and a `shell.php` web shell across multiple endpoints.

---

## 🧠 What I Learned
* **Alert Correlation:** A single alert rarely tells the whole story. Correlating a Suricata network alert (SMB Enumeration) with a Sysmon endpoint alert (Process Injection) is required to understand the full scope of a compromise.
* **Process Ancestry Analysis:** Examining the process tree is one of the most effective ways to trace an attack chain and identify the root execution vector (e.g., tracing a malicious payload back to an initial command shell).
* **Incident Response Phases:** Effective response requires strict adherence to IR phases: confirm the detection, investigate the scope, contain the threat (e.g., isolate the host), and eradicate the attacker's presence.

---

## 🛠️ Toolset & Command Reference

| Tool / Concept | Purpose |
| :--- | :--- |
| **Suricata** | Used to detect network-level attacks (e.g., SMB Enumeration, EternalBlue). |
| **Sysmon & Wazuh** | Used for endpoint logging, process tracking, and EDR alerting. |
| **Process Tree Analysis** | Visualizing parent-child process relationships to map the attack chain. |
| **YARA** | Executed hunts across multiple endpoints to detect known malware patterns. |

---

## 🔍 Key Findings & Analysis
* **Critical Alerts Identified:** Analysis of the SIEM dashboard revealed 4 critical alerts, including an EternalBlue exploit attempt and Mimikatz execution (PID: 1002).
* **Process Chain Confirmed:** The investigation verified that a suspicious `cmd.exe` (PID: 1000) initiated the attack sequence, spawning an encoded PowerShell command that resulted in process injection and credential dumping.
* **Containment Achieved:** The affected host (`192.168.56.105`) was successfully isolated, the malicious processes were eradicated, and all response actions were marked as complete.

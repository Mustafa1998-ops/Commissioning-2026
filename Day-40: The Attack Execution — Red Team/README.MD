# Day 40: The Attack Execution — Red Team

## 📝 Overview
With the campaign planned, the attack begins. This module simulates Day 1 of Red Team operations, focusing on securing initial access through phishing and web exploitation, establishing Command and Control (C2) persistence, and conducting initial host reconnaissance while maintaining a strict command log.

---

## 🎯 Objectives Completed
* **Phishing Attack Simulation (Task 160):** Launched a Gophish campaign ("Security Alert") targeting 50 users, successfully capturing credentials (`jdoe@company.com`) when a simulated victim clicked the malicious link.
* **Web Exploitation (Task 160):** Scanned a DVWA instance, identified an unrestricted file upload vulnerability, and successfully uploaded a PHP web shell (`shell.php`) to trigger a reverse shell connection.
* **C2 Establishment (Task 160 & 161):** Started a Sliver HTTPS listener on port 443, executed the payload on the victim machine (`[REDACTED_IP]`), and received the callback to open a Meterpreter session.
* **Host Reconnaissance (Task 161):** Enumerated the compromised host using commands like `whoami`, `ipconfig`, `netstat`, and `tasklist`, identifying running processes like `mimikatz.exe`.
* **Command Logging (Task 161):** Actively recorded all executed commands and their outputs in a centralized log to ensure accountability and provide a timeline for the Blue Team's after-action review.
* **Evasion Execution (AT103):** Implemented OpSec techniques including a 60-second sleep timer with 20% jitter and CDN domain fronting, successfully evading EDR detection.

---

## 🧠 What I Learned
* **Initial Access Vectors:** Gaining a foothold usually relies on exploiting human vulnerability (phishing) or technical misconfigurations (unrestricted file uploads in web applications).
* **The Importance of Logging:** In professional Red Teaming, every action must be deliberate and recorded. Command logs (tracking time, command, and output) are essential for deconfliction and helping the Blue Team improve their detections post-engagement.
* **Effective Evasion:** Combining sleep/jitter with domain fronting successfully obfuscates C2 traffic, making malicious beaconing appear as legitimate, randomized web traffic.

---

## 🛠️ Toolset & Command Reference

| Tool / Command | Purpose |
| :--- | :--- |
| **Gophish** | Framework utilized to simulate the initial phishing campaign and harvest credentials. |
| **DVWA** | The target web application exploited via an unrestricted file upload vulnerability. |
| **Sliver C2** | Command and Control framework used to establish the HTTPS listener and manage the active session. |
| **`whoami` / `ipconfig`** | Standard reconnaissance commands used to enumerate user context and network configuration. |
| **Command Log** | The formal record of all Red Team activities executed during the engagement. |

---

## 🔍 Key Findings & Analysis
* **Access Achieved:** Initial access was successfully established via two vectors: compromised credentials from phishing and a reverse shell triggered via a web vulnerability.
* **C2 Session Active:** The Sliver payload executed successfully, establishing an active `windows/amd64` session from the target to the C2 server over port 443.
* **Evasion Confirmed:** The implemented sleep jitter and domain fronting techniques proved effective, as the simulated EDR failed to detect the active beaconing activity.

# Defensive Security Commissioning Portfolio (45-Day Program)

## 👨‍💻 About Me & Objective
I am an IT professional with a strong foundation in technical troubleshooting, endpoint support, and banking operations. I am currently undertaking a rigorous 45-day defensive security commissioning program to bridge the gap between theoretical knowledge and hands-on operational capability. 

This repository serves as my active portfolio and evidence locker. It documents the daily construction of my Blue Team lab environment and the automated tools, scripts, and log analysis techniques I am developing for Security Operations Center (SOC) workflows.

## 📜 Certifications
*   **CompTIA Security+** (Earned April 2026)
*   **CompTIA Network+**  (Earned June 2026)
*   **Google Cybersecurity Professional Certificate** (Earned March 2026)

## 🛠️ Core Capabilities & Technology Stack
*   **Environments:** Oracle VirtualBox, VMware, Kali Linux, Windows 11
*   **Scripting & Automation:** Bash, PowerShell
*   **Security Operations:** Log Analysis (SIEM fundamentals), File Integrity Monitoring (FIM), Access Control (IAM)
*   **Endpoint Defense:** Process/Service investigation, Windows Event Viewer, `/var/log` interrogation

--- 

## 📅 Mission Log: 45-Day Tracker

*Below is the chronological log of my operational tasks, scripts written, and environments deployed. Click into the daily folders above for detailed documentation, code, and visual proof of execution.*

### ✅ Day 1 & Day 2: Blue Team Foundation Setup
*   **Status:** Completed
*   **Summary:** Provisioned a Windows 11 Blue Team Virtual Machine (4 GB RAM, 2 Cores) to serve as a secure baseline testing environment. Documented foundational research covering SOC structures, SIEM log correlation, and Red vs. Blue team objectives. Initialized this Git repository for version control.


### ✅ Day 3: Operation Sentinel Gaze (Linux Intelligence)
*   **Status:** Completed
*   **Summary:** Deployed a Kali Linux VM for system intelligence gathering. Navigated the filesystem, executed local user/group administration, and established baseline hashes for File Integrity Monitoring (FIM). 
*   **Scripting Highlight:** Engineered `log_analyzer.sh` (Bash) to automatically parse `/var/log/auth.log`, extract IP addresses exhibiting brute-force behavior, and export a summarized incident report.

### ✅ Day 4: Operation Shadow Hunt (Windows Intelligence)
*   **Status:** Completed
*   **Summary:** Deployed a Windows 11 endpoint via VirtualBox to execute system reconnaissance and secure local administrator accounts. Mitigated attack surfaces by investigating and disabling unnecessary running services.
*   **Scripting Highlight:** Engineered `event_collector.ps1` (PowerShell) to automatically interrogate the Windows Security log, extract Event IDs 4624 (Success) and 4625 (Failure), and output the forensic data to a structured CSV file for rapid analysis.

### 🔄 Days 5 - 45: Active / In Progress
*   *Further missions will be documented here as they are completed.*

---
---
> *"Certifications built my theoretical foundation. Every completed mission in this repository serves as my practical proof of execution."*

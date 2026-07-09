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

Below is the chronological log of my operational tasks, scripts written, and environments deployed. Click into the daily folders for detailed documentation, code, and visual proof of execution.

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

### ✅ Day 5: Network Traffic Analysis & Reconnaissance
*   **Status:** Completed
*   **Summary:** Executed network topology discovery using `nmap` and `ss` to identify live hosts and listening services across the local environment. Captured and analyzed core networking protocols (ICMP, TCP, UDP) using `tcpdump`, including a deep dive into the TCP three-way handshake. Simulated a malicious beacon connection via PowerShell and successfully detected the anomalous traffic using `netstat` and packet capture tools.
*   **Scripting Highlight:** Engineered `network_mapper.sh` (Bash) to automate network discovery, executing ping sweeps and service fingerprinting (`nmap -sV`), and exporting the intelligence into a standardized operational report.

### ✅ Day 6: Passive Reconnaissance & Active Network Mapping
*   **Status:** Completed
*   **Summary:** Executed passive open-source intelligence (OSINT) gathering using WHOIS, DNS enumeration, and `theHarvester` to safely map target footprints. Transitioned to active network mapping using Nmap to identify live hosts, open ports, and vulnerable services on a controlled local VM environment, operating under strict OPSEC guidelines.

### ✅ Day 7: Advanced Nmap & Evasion Techniques
*   **Status:** Completed
*   **Summary:** Analyzed advanced scanning methodologies including decoy (`-D`) and fragmented (`-f`) packet techniques to understand evasion tactics against Intrusion Detection Systems (IDS). Evaluated network traffic footprints to propose SOC defense strategies (like enforcing TCP stack normalization).
*   **Scripting Highlight:** Developed `auto_recon.sh` (Bash) to automate repetitive Nmap scanning tasks and standardize output formats for efficient vulnerability reporting.

### ✅ Day 8: Threat Intelligence & Adversary Frameworks
*   **Status:** Completed
*   **Summary:** Transitioned from offensive tool execution to defensive analysis by mapping attacker behavior to industry frameworks. Mapped Nmap active scanning techniques and the EternalBlue exploit to the MITRE ATT&CK framework and Lockheed Martin Cyber Kill Chain. Conducted a Detection Gap Analysis and generated a visual coverage heatmap to prioritize future SIEM rule development.

### 🔄 Days 9 - 45: Active / In Progress
Further missions will be documented here as they are completed.

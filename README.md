# Defensive Security Commissioning Portfolio (45-Day Program)

## 👨‍💻 About Me & Objective
I am an IT professional with a strong foundation in technical troubleshooting, endpoint support, and banking operations. I am currently undertaking a rigorous 45-day defensive security commissioning program to bridge the gap between theoretical knowledge and hands-on operational capability. I am actively seeking opportunities as an **L1 SOC Analyst** or **Cybersecurity Analyst**. 

All my custom scripts, playbooks, and operational lab documentation are fully detailed on my **GitHub**: [Mustafa1998-ops/Commissioning-2026](https://github.com/Mustafa1998-ops/Commissioning-2026).

## 📜 Certifications
*   **CompTIA Security+** (Earned April 2026)
*   **CompTIA Network+**  (Earned June 2026)
*   **Google Cybersecurity Professional Certificate** (Earned March 2026)

## 🛠️ Core Capabilities & Technology Stack
*   **Environments:** Oracle VirtualBox, VMware, Kali Linux, Windows 11
*   **Scripting & Automation:** Bash, PowerShell
*   **Security Operations:** Log Analysis, SIEM Fundamentals, Threat Intelligence (MISP), Incident Response Playbooks
*   **Endpoint Defense:** Process/Service investigation, Windows Event Viewer, Sysmon, Linux `auditd`, File Integrity Monitoring (FIM), EDR (Wazuh)
*   **Network & Packet Analysis:** Wireshark, TShark, Suricata IDS, RITA
*   **Incident Response & Forensics:** Volatility, Memory Acquisition (`Dumplt.exe`, LiME), Live Response
*   **Detection Engineering & Purple Teaming:** Sigma, Splunk SPL, KQL, Atomic Red Team, ModSecurity WAF
*   **Malware & Phishing Analysis:** Gophish, YARA, Static/Dynamic Analysis (FLARE VM, REMnux, Procmon), UPX unpacking
*   **Offensive Security Context:** Metasploit, Nmap, OpenVAS, Hydra, Hashcat, Privilege Escalation, Lateral Movement, Sliver C2, sqlmap

--- 

## 📅 Mission Log: 45-Day Tracker

Below is the chronological log of my operational tasks, scripts written, and environments deployed. Click into the daily folders for detailed documentation, code, and visual proof of execution.

### ✅ Day 1 & Day 2: Blue Team Foundation Setup
*   **Status:** Completed
*   **Summary:** Provisioned a Windows 11 Blue Team Virtual Machine (4 GB RAM, 2 Cores) to serve as a secure baseline testing environment. Documented foundational research covering SOC structures, SIEM log correlation, and Red vs. Blue team objectives. Initialized this Git repository for version control.

### ✅ Day 3: Operation Sentinel Gaze (Linux Intelligence)
*   **Status:** Completed
*   **Summary:** Deployed a Kali Linux VM for system intelligence gathering. Navigated the filesystem, executed local user/group administration, and established baseline hashes for File Integrity Monitoring (FIM).

### ✅ Day 4: Operation Shadow Hunt (Windows Intelligence)
*   **Status:** Completed
*   **Summary:** Deployed a Windows 11 endpoint via VirtualBox to execute system reconnaissance and secure local administrator accounts. Mitigated attack surfaces by investigating and disabling unnecessary running services.

### ✅ Day 5: Network Traffic Analysis & Reconnaissance
*   **Status:** Completed
*   **Summary:** Executed network topology discovery using `nmap` and `ss` to identify live hosts and listening services across the local environment. Captured and analyzed core networking protocols (ICMP, TCP, UDP) using `tcpdump`.

### ✅ Day 6: Passive Reconnaissance & Active Network Mapping
*   **Status:** Completed
*   **Summary:** Executed passive open-source intelligence (OSINT) gathering using WHOIS, DNS enumeration, and `theHarvester`. Transitioned to active network mapping using Nmap to identify live hosts, open ports, and vulnerable services.

### ✅ Day 7: Advanced Nmap & Evasion Techniques
*   **Status:** Completed
*   **Summary:** Analyzed advanced scanning methodologies including decoy (`-D`) and fragmented (`-f`) packet techniques to understand evasion tactics against Intrusion Detection Systems (IDS). 

### ✅ Day 8: Threat Intelligence & Adversary Frameworks
*   **Status:** Completed
*   **Summary:** Mapped Nmap active scanning techniques and the EternalBlue exploit to the MITRE ATT&CK framework and Lockheed Martin Cyber Kill Chain. Conducted a Detection Gap Analysis.

### ✅ Day 9: Defensive Operations & Signature Writing
*   **Status:** Completed
*   **Summary:** Deployed and configured Suricata to establish a baseline for normal network traffic. Drafted custom Intrusion Detection System (IDS) signatures to identify and flag anomalous behaviors.

### ✅ Day 10: The Attack Simulator — Offense-to-Detection Kill Chain
*   **Status:** Completed
*   **Summary:** Executed a full kill-chain utilizing `nmap`, `hydra`, and `msfconsole` to weaponize the EternalBlue (MS17-010) vulnerability. Correlated network actions with Suricata alerts and Windows Event Logs to reconstruct the attacker's timeline.

### ✅ Day 11: The Forensic Investigator — Windows Event Logs & Sysmon
*   **Status:** Completed
*   **Summary:** Analyzed Windows endpoint telemetry to reconstruct an attacker's timeline and decode obfuscated payloads. Queried the Windows Security Log using `Get-WinEvent` and reviewed Sysmon high-resolution telemetry.

### ✅ Day 12: The Linux Inspector — Log Analysis & auditd
*   **Status:** Completed
*   **Summary:** Parsed system, authentication, and web server logs to track malicious activity on Linux. Configured `auditd` watch rules to monitor sensitive files for unauthorized modifications.

### ✅ Day 13: The Intelligence Analyst — Threat Intel & MISP
*   **Status:** Completed
*   **Summary:** Processed raw threat intelligence and correlated Indicators of Compromise (IoCs) with internal logs. Created and published a structured threat event in the Malware Information Sharing Platform (MISP).

### ✅ Day 14: The SOC Commander — Building a SOC Playbook
*   **Status:** Completed
*   **Summary:** Authored comprehensive SOC playbooks for "RDP Brute Force" and "Malware Download" scenarios. Detailed exact procedures for Detection, Triage, Analysis, Containment, Eradication, and Recovery. 

### ✅ Day 15: The Stealth Operator — Advanced Nmap & Evasion
*   **Status:** Completed
*   **Summary:** Mastered advanced scan evasion techniques designed to bypass legacy IDS/IPS systems. Transitioned to defense by writing custom Suricata rules to successfully detect and drop evasive fragmented traffic.

### ✅ Day 16: The Web Scout — Web Application Reconnaissance
*   **Status:** Completed
*   **Summary:** Deployed Damn Vulnerable Web App (DVWA) and conducted comprehensive web reconnaissance. Utilized `gobuster`, `WhatWeb`, and `ffuf` for hidden directory brute-forcing and parameter fuzzing. 

### ✅ Day 17: The Vulnerability Assessor — OpenVAS / Nessus
*   **Status:** Completed
*   **Summary:** Deployed Greenbone Vulnerability Management (OpenVAS) to execute both unauthenticated and credentialed network vulnerability scans. Triaged findings based on CVSS scores.

### ✅ Day 18: The Exploiter — Metasploit & Manual Exploitation
*   **Status:** Completed
*   **Summary:** Executed full system compromise using the Metasploit Framework. Weaponized the MS17-010 exploit, established stealthy in-memory Meterpreter sessions, and extracted NTLM hashes.

### ✅ Day 19: The Password Cracker — Hydra, John the Ripper, & Hashcat
*   **Status:** Completed
*   **Summary:** Explored the mechanics of credential compromise. Executed online brute-force attacks and high-speed offline hash cracking using `John the Ripper` and GPU-accelerated `Hashcat`. 

### ✅ Day 20: The Elevator — Privilege Escalation (Linux & Windows)
*   **Status:** Completed
*   **Summary:** Escalated privileges to `SYSTEM` and `root` across cross-platform environments. Exploited Windows unquoted service paths and abused SUID binaries on Linux.

### ✅ Day 21: The Backdoor — Persistence Mechanisms
*   **Status:** Completed
*   **Summary:** Established covert, persistent access using Windows Registry Run keys, Scheduled Tasks, and WMI Event Subscriptions. Actively monitored the environment utilizing Sysmon to detect the injections.

### ✅ Day 22: The Infiltrator — Lateral Movement
*   **Status:** Completed
*   **Summary:** Navigated laterally across the environment using Pass-the-Hash (`impacket-psexec`), WMI remote execution, and SSH hopping. Analyzed Windows Event Logs to actively hunt for lateral movement artifacts.

### ✅ Day 23: The Data Thief — Exfiltration Techniques
*   **Status:** Completed
*   **Summary:** Explored data exfiltration methodologies hiding in plain sight using standard network protocols. Engineered custom Suricata IDS signatures to actively monitor and detect exfiltration anomalies.

### ✅ Day 24: The Rule Writer — Custom Suricata Rules
*   **Status:** Completed
*   **Summary:** Focused on Detection Engineering by writing, testing, and optimizing custom Suricata IDS rules to detect PowerShell encoded commands, DNS tunneling, and Mimikatz credential dumping activity.

### ✅ Day 25: The Log Master — PowerShell & Sysmon Logging
*   **Status:** Completed
*   **Summary:** Modified the Windows Registry to enable Script Block Logging and Transcription. Built and deployed custom Sysmon XML configurations to filter default log noise and pinpoint highly specific execution activity. 

### ✅ Day 26: The Linux Auditor — auditd · rsyslog · AIDE
*   **Status:** Completed
*   **Summary:** Established a comprehensive Linux auditing environment. Built custom `auditd` rules, configured `rsyslog` to aggregate logs, and initialized the AIDE FIM to detect simulated attacks.

### ✅ Day 27: The Packet Analyst — Wireshark & TShark
*   **Status:** Completed
*   **Summary:** Captured and analyzed live network traffic using Wireshark and TShark. Filtered traffic using display filters, followed TCP streams to rebuild entire conversations, and extracted transferred files directly from HTTP object data.

### ✅ Day 28: The EDR Operator — Endpoint Detection & Response
*   **Status:** Completed
*   **Summary:** Deployed the open-source Wazuh EDR Manager on Kali Linux and Agents on Windows. Executed Mimikatz to verify the detection pipeline, and tested advanced evasion tactics by utilizing SysWhispers3 to generate direct kernel system calls.

### ✅ Day 29: The Threat Hunter — Threat Hunting Fundamentals
*   **Status:** Completed
*   **Summary:** Explored proactive threat hunting fundamentals using the Hypothesis ➔ Collect ➔ Investigate ➔ Act methodology. Formulated hypotheses focused on WMI persistence and Living Off the Land techniques.

### ✅ Day 30: The Chain Hunter — Multi-Stage Execution
*   **Status:** Completed
*   **Summary:** Hunted multi-stage execution attack chains. Simulated an attack sequence from an initial download cradle to payload staging, execution, and objective completion. Leveraged DeepBlueCLI to automate detection.

### ✅ Day 31: The Persistence Hunter — Persistence & Exfiltration
*   **Status:** Completed
*   **Summary:** Hunted for persistence mechanisms across scheduled tasks, Windows services, and Registry Run keys. Analyzed outbound network traffic and DNS queries to identify data exfiltration and tunneling.

### ✅ Day 32: The Incident Responder — IR & Forensic Basics
*   **Status:** Completed
*   **Summary:** Executed live response procedures to capture volatile data. Simulated physical memory dumps utilizing `Dumplt.exe` and `LiME`, and leveraged the Volatility framework to analyze memory dumps to uncover hidden processes and injected payloads.

### ✅ Day 33: The Malware Analyst — Static & Dynamic Analysis
*   **Status:** Completed
*   **Summary:** Conducted static analysis on malware samples using `strings` and `pestudio` to examine metadata and PE structures. Executed dynamic analysis in a controlled FLARE VM sandbox to monitor behavioral changes with Procmon. Successfully unpacked UPX-compressed executables and developed custom YARA rules to detect the payloads.

### ✅ Day 34: The Phishing Analyst — Email Analysis & Simulation
*   **Status:** Completed
*   **Summary:** Examined email headers to verify SPF, DKIM, and DMARC authentication status and detect spoofing indicators. Configured and launched simulated phishing campaigns using the Gophish framework. Authored custom YARA rules specifically targeted at detecting malicious, macro-enabled Office documents.

### ✅ Day 35: The WAF Bypasser — Web Application Firewall & Bypass
*   **Status:** Completed
*   **Summary:** Deployed the ModSecurity Web Application Firewall (WAF) integrated with the OWASP Core Rule Set (CRS). Analyzed blocked SQL injection attempts and systematically tested obfuscation techniques, leveraging `sqlmap` tamper scripts to successfully evade WAF protections and extract database credentials.

### ✅ Day 36: The Red Team Commander — Red Team Methodology
*   **Status:** Completed
*   **Summary:** Established Command and Control (C2) infrastructure using the Sliver framework. Emulated APT29 (Cozy Bear) tactics mapped to MITRE ATT&CK, successfully applying Operational Security (OpSec) techniques like beacon sleep/jitter and domain fronting (CDN) to hide C2 traffic.

### ✅ Day 37: The Detection Engineer — Blue Team Strategy
*   **Status:** Completed
*   **Summary:** Authored universal detection logic using Sigma rules and converted them into environment-specific SIEM queries for Splunk SPL and Azure KQL. Constructed visualization dashboards and actively fine-tuned noisy alerts via path whitelisting and advanced risk-based scoring to optimize the SOC's signal-to-noise ratio.

### ✅ Day 38: The Purple Team Lead — Continuous Improvement
*   **Status:** Completed
*   **Summary:** Bridged offensive and defensive operations by executing focused MITRE ATT&CK techniques using Atomic Red Team. Verified detection coverage within the SIEM, constructed visual coverage heatmaps to highlight security gaps, and documented actionable recommendations in post-exercise reports.

### 🔄 Days 39 - 45: Active / In Progress
*Further missions will be documented here as they are completed.*

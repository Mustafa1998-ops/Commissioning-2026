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
*   **Security Operations:** Log Analysis, SIEM Fundamentals, Threat Intelligence (MISP), Incident Response Playbooks
*   **Endpoint Defense:** Process/Service investigation, Windows Event Viewer, Sysmon, Linux `auditd`, File Integrity Monitoring (FIM)
*   **Offensive Security Context:** Metasploit, Nmap, OpenVAS, Hydra, Hashcat, Privilege Escalation, Lateral Movement

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

### ✅ Day 9: Defensive Operations & Signature Writing
*   **Status:** Completed
*   **Summary:** Deployed and configured Suricata to establish a baseline for normal network traffic. Drafted custom Intrusion Detection System (IDS) signatures to identify and flag anomalous behaviors—such as brute-force attempts and share enumeration—and classify their threat priorities.

### ✅ Day 10: The Attack Simulator — Offense-to-Detection Kill Chain
*   **Status:** Completed
*   **Summary:** Executed a full kill-chain against a sandboxed target (`[REDACTED_IP]`), utilizing `nmap` for SMB reconnaissance, `hydra` for RDP brute-forcing, and `msfconsole` to weaponize the EternalBlue (MS17-010) vulnerability. Generated custom `reverse_tcp` meterpreter payloads using `msfvenom` to bypass inbound filtering.
*   **Blue Team Highlight:** Shifted to defensive analysis by correlating network actions with Suricata 6.0 alerts and Windows Event Logs (tracking Logon Failure ID `4625` to Logon Success ID `4624`), effectively reconstructing the attacker's timeline and triaging critical threats from early recon noise.

### ✅ Day 11: The Forensic Investigator — Windows Event Logs & Sysmon
*   **Status:** Completed
*   **Summary:** Analyzed Windows endpoint telemetry to reconstruct an attacker's timeline and decode obfuscated payloads. Queried the Windows Security Log using `Get-WinEvent` to identify a massive spike in Event ID 4625 (Logon Failure), indicating a brute-force attack. Correlated the rapid failed logons with Event ID 4624 (Logon Success) and Event ID 4688 (Process Creation) to confirm the attacker gained access. Analyzed Event ID 4104 (Script Block Logging) to capture and decode a Base64-encoded PowerShell payload. Reviewed Sysmon high-resolution telemetry, mapping events to MITRE ATT&CK techniques.

### ✅ Day 12: The Linux Inspector — Log Analysis & auditd
*   **Status:** Completed
*   **Summary:** Parsed system, authentication, and web server logs to track malicious activity on Linux. Analyzed `/var/log/auth.log` to trace a simulated SSH brute-force attack. Configured `auditd` watch rules to monitor sensitive files for unauthorized modifications. Filtered Apache access logs to identify SQL Injection attempts and 404 error patterns indicative of automated scanning. Generated an interactive, graphical web log summary using `goaccess` to rapidly identify top attacker IPs.

### ✅ Day 13: The Intelligence Analyst — Threat Intel & MISP
*   **Status:** Completed
*   **Summary:** Processed raw threat intelligence and correlated Indicators of Compromise (IoCs) with internal logs. Ingested and parsed raw threat feeds to extract malicious IP addresses, domains, and hashes. Cross-referenced parsed IoCs against internal SOC alerts. Drafted a structured Threat Intelligence (TI) report detailing the threat actor's tactics mapped to the MITRE ATT&CK framework. Created and published a structured threat event in the Malware Information Sharing Platform (MISP), tagging attributes with the correct Traffic Light Protocol (TLP:AMBER).

### ✅ Day 14: The SOC Commander — Building a SOC Playbook
*   **Status:** Completed
*   **Summary:** Established consistent, repeatable Incident Response (IR) procedures. Authored comprehensive SOC playbooks for "RDP Brute Force" and "Malware Download" scenarios. Detailed exact procedures for Detection, Triage, Analysis, Containment, Eradication, and Recovery. Conducted a simulated peer review to identify operational gaps. Mapped the finalized playbook steps to Security Orchestration, Automation, and Response (SOAR) workflows. Earned the rank of CORPORAL.

### ✅ Day 15: The Stealth Operator — Advanced Nmap & Evasion
*   **Status:** Completed
*   **Summary:** Mastered advanced scan evasion techniques designed to bypass legacy IDS/IPS systems. Executed Decoy scans, IP Fragmentation, and Idle/Zombie scans. Transitioned to defense by writing custom Suricata rules (`fragbits:M`) to successfully detect and drop evasive fragmented traffic.

### ✅ Day 16: The Web Scout — Web Application Reconnaissance
*   **Status:** Completed
*   **Summary:** Deployed Damn Vulnerable Web App (DVWA) and conducted comprehensive web reconnaissance. Utilized `gobuster` for hidden directory brute-forcing, `WhatWeb` for tech stack fingerprinting, and `ffuf` for parameter fuzzing. Leveraged automated tools like Nikto and WPScan to identify misconfigurations and vulnerable plugins.

### ✅ Day 17: The Vulnerability Assessor — OpenVAS / Nessus
*   **Status:** Completed
*   **Summary:** Deployed Greenbone Vulnerability Management (OpenVAS) to execute both unauthenticated and credentialed network vulnerability scans. Triaged findings based on CVSS scores, prioritizing Critical (9.0+) CVEs for immediate remediation, and authored custom NASL (Nessus Attack Scripting Language) detection scripts.

### ✅ Day 18: The Exploiter — Metasploit & Manual Exploitation
*   **Status:** Completed
*   **Summary:** Executed full system compromise using the Metasploit Framework. Weaponized the MS17-010 exploit, established stealthy in-memory Meterpreter sessions, and migrated processes to evade detection. Extracted NTLM hashes, generated obfuscated payloads via MSFVenom, and executed manual web shell attacks.

### ✅ Day 19: The Password Cracker — Hydra, John the Ripper, & Hashcat
*   **Status:** Completed
*   **Summary:** Explored the mechanics of credential compromise. Executed online brute-force attacks against RDP and SSH using `hydra`. Performed high-speed offline hash cracking against NTLM and shadow files using CPU-based `John the Ripper` and GPU-accelerated `Hashcat`. Dynamically generated targeted attack wordlists using `CeWL`.

### ✅ Day 20: The Elevator — Privilege Escalation (Linux & Windows)
*   **Status:** Completed
*   **Summary:** Escalated privileges to `SYSTEM` and `root` across cross-platform environments. Exploited Windows unquoted service paths via `PowerUp.ps1` and abused COM objects using `JuicyPotato`. On Linux, abused SUID binaries, misconfigured sudo rights, and compiled raw kernel exploits (CVE-2021-3156) directly on the target machine.

### ✅ Day 21: The Backdoor — Persistence Mechanisms
*   **Status:** Completed
*   **Summary:** Established covert, persistent access using Windows Registry Run keys, Scheduled Tasks, WMI Event Subscriptions, Linux Cron jobs, and systemd services. 
*   **Blue Team Highlight:** Actively monitored the environment utilizing **Sysmon** and **auditd** telemetry to detect the injected persistence mechanisms in real-time, followed by a full remediation and eradication operation.

### ✅ Day 22: The Infiltrator — Lateral Movement
*   **Status:** Completed
*   **Summary:** Navigated laterally across the environment using Pass-the-Hash (`impacket-psexec`), WMI remote execution, PSExec, and SSH hopping. Conducted credential spraying with `crackmapexec`. 
*   **Blue Team Highlight:** Analyzed Windows Event Logs to actively hunt for lateral movement artifacts, specifically tracking Event IDs `4624` (Network Logon), `4688` (Process Creation), and `7045` (Service Creation).

### ✅ Day 23: The Data Thief — Exfiltration Techniques
*   **Status:** Completed
*   **Summary:** Explored data exfiltration methodologies hiding in plain sight using standard network protocols. Weaponized HTTP POST requests, DNS queries (`dnscat2`), and ICMP pings (`xxd`, `ping`) to covertly transmit encoded data past standard outbound firewall restrictions.
*   **Blue Team Highlight:** Engineered custom Suricata IDS signatures and utilized `tcpdump` to actively monitor and detect exfiltration anomalies. Successfully flagged suspicious traffic patterns, including massive HTTP POST bodies, abnormally long DNS queries (>200 characters), and unusually large ICMP payloads containing printable ASCII.

### ✅ Day 24: The Rule Writer — Custom Suricata Rules
*   **Status:** Completed
*   **Summary:** Focused on Detection Engineering by writing, testing, and optimizing custom Suricata IDS rules. Engineered specific signatures to detect PowerShell encoded commands, DNS tunneling via unusually long queries (>200 characters), and Mimikatz credential dumping activity across the network.
*   **Blue Team Highlight:** Validated custom rules against sample traffic and optimized rule thresholds (`threshold type limit, track by_src`) to reduce alert fatigue. Successfully updated the core Suricata ruleset (`suricata-update`) while preserving custom defensive signatures, earning the rank of SFC and completing Phase 3.

### 🔄 Days 25 - 45: Active / In Progress
*Further missions will be documented here as they are completed.*

# Day 3: Operation Sentinel Gaze (Linux Intelligence Gathering)

## 🎯 Mission Objective
The primary objective of this mission was to become fluent in Linux security by navigating the filesystem, managing system processes, and identifying malicious activity through system logs[cite: 4]. The operational focus was on gathering Linux intelligence and building automated scripts for SOC (Security Operations Center) analysis[cite: 4].

## 🛠️ Tasks Executed & Skills Demonstrated

### 1. System Reconnaissance
*   Booted a Kali Linux Virtual Machine and executed fundamental system intelligence commands[cite: 4].
*   Utilized commands such as `whoami`, `id`, `uname -a`, and examined core system files like `/etc/os-release`, `/etc/passwd`, and `/etc/group` to understand the operational environment[cite: 4].

### 2. User & Access Management
*   Created a new user account intended for incident response purposes and secured it with a password[cite: 4].
*   Created a dedicated `security_team` group, assigned the new user to this group, and verified that the user was restricted from executing elevated `sudo` commands[cite: 4].

### 3. Process & Service Intelligence
*   Investigated running processes and services to identify potential anomalies[cite: 4].
*   Executed process monitoring commands (like `ps aux` and `ss -tulpn`) to identify the highest CPU-consuming processes and discover which services were actively listening on network ports[cite: 4].

### 4. Threat Hunting & Log Analysis
*   Simulated a brute-force attack by generating multiple failed SSH login attempts[cite: 4].
*   Manually interrogated the `/var/log/auth.log` file using `grep`, `awk`, `sort`, and `uniq` commands to successfully identify and extract the failed password attempts[cite: 4].

### 5. Automated Log Analysis (Bash Scripting)
*   Engineered a custom Bash script (`log_analyzer.sh`) to automate the log review process[cite: 4].
*   Configured the script to ingest an `auth.log` file, extract the top 10 IP addresses associated with failed login attempts, and export the findings into a timestamped summary report for rapid analyst review[cite: 4].

### 6. File Integrity Monitoring (FIM)
*   Established a secure baseline by generating SHA-256 hashes for critical system files (`/etc/passwd`, `/etc/shadow`, `/etc/sudoers`)[cite: 4].
*   Simulated an unauthorized file modification and successfully detected the change by comparing the altered file's hash against the baseline using the `diff` command[cite: 4].

## 📂 Deliverables Included in This Folder
*   `log_analyzer.sh`: The automated Bash script created for log analysis[cite: 4].
*   `Screenshots/`: Visual evidence of command executions, user creation, process investigation, and file integrity checks[cite: 4].

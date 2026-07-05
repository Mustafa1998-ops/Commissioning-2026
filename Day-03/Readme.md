# Day 3: Operation Sentinel Gaze (Linux Intelligence Gathering)

## 🎯 Mission Objective
The primary objective of this mission was to become fluent in Linux security by navigating the filesystem, managing system processes, and identifying malicious activity through system logs. The operational focus was on gathering Linux intelligence and building automated scripts for SOC (Security Operations Center) analysis.

## 🛠️ Tasks Executed & Skills Demonstrated

### 1. System Reconnaissance
*   Booted a Kali Linux Virtual Machine and executed fundamental system intelligence commands.
*   Utilized commands such as `whoami`, `id`, `uname -a`, and examined core system files like `/etc/os-release`, `/etc/passwd`, and `/etc/group` to understand the operational environment.

### 2. User & Access Management
*   Created a new user account intended for incident response purposes and secured it with a password.
*   Created a dedicated `security_team` group, assigned the new user to this group, and verified that the user was restricted from executing elevated `sudo` commands.

### 3. Process & Service Intelligence
*   Investigated running processes and services to identify potential anomalies.
*   Executed process monitoring commands (like `ps aux` and `ss -tulpn`) to identify the highest CPU-consuming processes and discover which services were actively listening on network ports.

### 4. Threat Hunting & Log Analysis
*   Simulated a brute-force attack by generating multiple failed SSH login attempts.
*   Manually interrogated the `/var/log/auth.log` file using `grep`, `awk`, `sort`, and `uniq` commands to successfully identify and extract the failed password attempts.

### 5. Automated Log Analysis (Bash Scripting)
*   Engineered a custom Bash script (`log_analyzer.sh`) to automate the log review process.
*   Configured the script to ingest an `auth.log` file, extract the top 10 IP addresses associated with failed login attempts, and export the findings into a timestamped summary report for rapid analyst review.

### 6. File Integrity Monitoring (FIM)
*   Established a secure baseline by generating SHA-256 hashes for critical system files (`/etc/passwd`, `/etc/shadow`, `/etc/sudoers`).
*   Simulated an unauthorized file modification and successfully detected the change by comparing the altered file's hash against the baseline using the `diff` command.

## 📂 Deliverables Included in This Folder
*   `log_analyzer.sh`: The automated Bash script created for log analysis.
*   `Screenshots/`: Visual evidence of command executions, user creation, process investigation, and file integrity checks.

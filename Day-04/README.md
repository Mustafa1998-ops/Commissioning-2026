# Day 4: Operation Shadow Hunt (Windows Intelligence Gathering)

## 🎯 Mission Objective
The primary objective of this mission was to become fluent in the Windows command line and PowerShell to manage systems and identify security events. The operational focus was on deploying a secure Windows environment, managing local users, inspecting processes, and automating the collection and interpretation of Windows Event Logs for SOC analysis.

## 🛠️ Tasks Executed & Skills Demonstrated

### 1. Environment Setup & System Reconnaissance
*   Installed Oracle VirtualBox and successfully deployed a Windows 11 Virtual Machine to serve as an isolated Blue Team lab environment.
*   Booted the Windows 11 VM and utilized PowerShell as an Administrator to execute core system enumeration commands.
*   Gathered system intelligence using `whoami`, `systeminfo`, and retrieved local user and group information to understand the endpoint's baseline configuration.

### 2. User Account Management
*   Securely created a new local user account ("charlie") using encrypted secure string passwords.
*   Managed access controls by adding the new user to the local "Administrators" group and verified the group membership changes.

### 3. Process & Service Intelligence
*   Investigated running processes and services to identify resource consumption and potential security risks.
*   Filtered processes to isolate the top 5 CPU-consuming applications and secured the environment by stopping and disabling the Print Spooler service to reduce the system's attack surface.

### 4. Windows Event Log Analysis
*   Interrogated the Windows Security log to track authentication events.
*   Filtered logs to identify recent successful logons (Event ID 4624) and failed logons (Event ID 4625), documenting critical forensic details such as Account Name, Logon Type, and Source Network Address.

### 5. Automated Event Collection (PowerShell Scripting)
*   Engineered a custom PowerShell script (`event_collector.ps1`) within the Windows 11 environment to automate the extraction of security logs.
*   Configured the script to gather the last 10 success and failure authentication events, calculate a summary count, and export the structured data into a timestamped CSV file for rapid analyst review.

### 6. Custom Event Generation
*   Generated a custom application event (Event ID 9999) using `Write-EventLog` to test the system's logging and monitoring capabilities.
*   Verified the successful creation of the custom event within the Windows Event Viewer.

## 📂 Deliverables Included in This Folder
*   `event_collector.ps1`: The automated PowerShell script created for extracting and exporting security events.
*   `Screenshots/`: Visual evidence documenting the VirtualBox Windows 11 deployment, system reconnaissance, user creation, process management, event log analysis, and script execution.

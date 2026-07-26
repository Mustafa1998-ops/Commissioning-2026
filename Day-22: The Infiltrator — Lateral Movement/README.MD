# Day 22: The Infiltrator — Lateral Movement

## 📝 Overview
This project explores the critical phase of lateral movement, demonstrating how attackers spread from an initially compromised host to other systems across a network. The assessment covers advanced techniques for escalating access and navigating through environments using stolen credentials and hashes, alongside the defensive strategies needed to detect these activities.

*Note: Target IP addresses, hashes, and specific credentials have been completely redacted in adherence to a security-first mindset.*

## 🎯 Objectives Completed
*   **Pass-the-Hash (PtH):** Executed a Pass-the-Hash attack using `impacket-psexec`, authenticating directly with a stolen NTLM hash rather than a plaintext password to gain system access.
*   **WMI Lateral Movement:** Utilized Windows Management Instrumentation (WMI) and PowerShell's `Invoke-Command` to achieve stealthy, diskless remote command execution across the network.
*   **PSExec Simulation:** Deployed the classic Sysinternals tool `psexec` to execute commands remotely by copying and starting a service binary in the `ADMIN$` share.
*   **SSH Hopping & Credential Spraying:** Moved laterally across Linux systems using SSH jump hosts (`-J` flag) and leveraged `crackmapexec` to spray credentials across an SMB network range.
*   **Lateral Movement Detection:** Analyzed Windows Event Logs to actively detect lateral movement, specifically hunting for Event ID 4624 (Logon Type 3 for network authentication), Event ID 4688 (Process Creation), Event ID 7045 (Service Creation), and Sysmon Event 3 (Network Connections).

## 🧠 What I Learned
During this hands-on lab, I reinforced several critical offensive and defensive security concepts:
*   **Hash-Based Authentication:** I learned that Windows accepts valid NTLM hashes for authentication, making password cracking unnecessary if the hash is already compromised.
*   **Stealth vs. Noise:** I observed the differences in operational security between tools; while `psexec` creates a highly visible service (Event ID 7045), WMI allows for much quieter remote execution.
*   **Credential Spraying:** I gained practical experience using automated tools like `crackmapexec` to quickly identify hosts where compromised credentials have been reused.
*   **Event Log Analysis:** I developed a strong understanding of which specific Windows Event IDs correlate to remote network logins and lateral movement tool execution, essential for SOC monitoring.

## 🛠️ Tools & Technologies
*   **Impacket (`impacket-psexec`):** Used for Pass-the-Hash authentication and lateral movement.
*   **WMI & PowerShell:** Leveraged for remote command execution.
*   **Sysinternals PSExec:** A classic lateral movement utility.
*   **CrackMapExec / NetExec:** Used for SMB credential spraying and network enumeration.
*   **Windows Event Viewer (`wevtutil`):** Utilized to query security logs for detection.

## 🔍 Key Findings & Analysis
*   **Authentication Abuse:** The network allowed for direct NTLM hash authentication via SMB, leading to a complete compromise of a target machine as the Administrator.
*   **High-Fidelity Alerts:** Remote execution attempts successfully generated distinct artifacts in the logs, such as `cmd.exe` spawned by `services.exe` (PSExec) and `powershell.exe` spawned by `wmiprvse.exe` (WMI).
*   **System Promotion:** Successfully mastering these lateral movement and detection techniques resulted in a rank promotion to STAFF SERGEANT, completing Phase 3 of the training program.

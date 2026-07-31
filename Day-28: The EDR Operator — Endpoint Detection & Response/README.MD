# Day 28: The EDR Operator — Endpoint Detection & Response

## 📝 Overview
As attackers develop more sophisticated evasion techniques, Endpoint Detection and Response (EDR) platforms serve as the critical line of defense. This module explores deploying the open-source Wazuh EDR, analyzing behavior-based alerts, and actively testing the platform's limits through advanced evasion techniques like direct system calls.

---

## 🎯 Objectives Completed
* **Wazuh Deployment (Tasks 113 & 114):** Installed the Wazuh Manager on a Kali Linux instance and deployed the Wazuh Agent onto a Windows endpoint, establishing a complete monitoring architecture.
* **Threat Detection Simulation (Task 115):** Executed the Mimikatz credential dumping tool on the monitored endpoint to verify the EDR's detection pipeline, successfully tracing the alert from Sysmon logs up to the Wazuh Dashboard.
* **EDR Evasion & Direct Syscalls (Task 116 & AT81):** Researched and executed evasion tactics by utilizing SysWhispers3 to generate direct syscalls (such as `NtOpenProcess`), effectively bypassing user-mode EDR hooks.
* **Advanced C2 Simulation (AT82):** Generated active HTTP implants utilizing the Sliver Command and Control (C2) framework to test the endpoint's detection capabilities against modern adversary tools.

---

## 🧠 What I Learned
During this hands-on lab, I reinforced several core endpoint security concepts:
* **Behavior Analysis vs. Signatures:** I compared traditional Antivirus (which relies on signatures) to EDR platforms (which detect anomalies based on behavior patterns and memory scanning).
* **Telemetry Collection:** I learned how agents continuously collect telemetry—spanning processes, network connections, and the file system—and forward it to a centralized manager for correlation.
* **Evasion Mechanics:** I gained practical insight into how malware bypasses EDR platforms by bypassing standard API hooks using direct kernel system calls.

---

## 🛠️ Toolset & Command Reference

| Tool / Command | Purpose |
| :--- | :--- |
| **`systemctl start wazuh-manager`** | Starts the Wazuh Manager service on the Linux host. |
| **`.\wazuh-agent.msi /q`** | Silently installs the Wazuh Agent on the Windows endpoint. |
| **`.\mimikatz.exe "privilege::debug" "sekurlsa::logonpasswords"`** | Executes Mimikatz to extract credentials and trigger EDR alerts. |
| **`python3 syswhispers3.py -f NtOpenProcess -o syscalls`** | Generates direct syscall wrappers in C/ASM to evade EDR hooks. |
| **`sliver-server`** | Initializes the Sliver C2 server to generate and manage implants. |

---

## 🔍 Key Findings & Analysis
* **High-Fidelity Alerts:** Running Mimikatz generated distinct Sysmon events (Event ID 10 for `lsass.exe` access and Event ID 1 for process creation), which Wazuh correlated into a Level 12 Critical Alert.
* **Successful Hook Bypass:** The SysWhispers3 implementation successfully executed the `NtOpenProcess` function via direct syscall, completely evading detection by the active EDR solution.
* **System Promotion:** Successfully mastering EDR deployment, simulated detection, and advanced evasion techniques resulted in a promotion to the rank of **MASTER SERGEANT**.

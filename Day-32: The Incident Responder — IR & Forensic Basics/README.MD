# Day 32: The Incident Responder — IR & Forensic Basics

## 📝 Overview
When the alarm sounds, speed is critical. This module covers the foundational steps of Incident Response (IR) and Memory Forensics, emphasizing the rapid collection of volatile data (processes, memory, network connections) before the attacker disappears or the system reboots.

---

## 🎯 Objectives Completed
* **Live Response (Task 129):** Captured volatile data from a live Windows system by dumping network connections, running processes, loaded services, and exporting registry hives.
* **Memory Acquisition (Task 130):** Simulated physical memory dumps utilizing `Dumplt.exe` for Windows and `LiME` for Linux targets to capture RAM contents for forensic analysis.
* **Volatility Analysis (Task 131):** Utilized the Volatility framework to parse the acquired memory dump, running plugins to extract process lists, network states, and registry hives.
* **Malicious Process Detection (Task 132):** Hunted for process injection and hidden processes within the memory dump.
* **Payload Extraction & File Carving (AT89 & AT90):** Extracted an injected Meterpreter binary directly from memory and carved a deleted file (`mimikatz.exe`) from the raw memory image.

---

## 🧠 What I Learned
* **Volatile vs. Non-Volatile Data:** Volatile data (like RAM, active network connections, and running processes) is lost upon system shutdown and must be acquired first, whereas non-volatile data (registry, files on disk) survives reboots.
* **Process Injection Mechanics:** I learned how to spot malware attempting to hide by injecting its payload into legitimate processes (e.g., `powershell.exe`), a common tactic for tools like Meterpreter.
* **File Carving:** Even when an attacker deletes a file from the disk, it can often be recovered (carved) from physical memory by searching for specific file signatures.

---

## 🛠️ Toolset & Command Reference

| Tool / Command | Purpose |
| :--- | :--- |
| **`netstat -anb`** | Lists active network connections and their associated processes during live response. |
| **`Get-Process`** | Native PowerShell cmdlet to list running processes. |
| **`Dumplt.exe` & LiME** | Tools utilized for Windows and Linux physical memory acquisition, respectively. |
| **`volatility -f dump.img imageinfo`** | Determines the operating system profile of the memory dump. |
| **`volatility [...] pslist` / `netscan` / `malfind`** | Volatility plugins used to list processes, view network connections, and detect injected code. |

---

## 🔍 Key Findings & Analysis
* **Live Response Anomalies:** Identified a suspicious outbound TCP connection to port 4444 originating from `powershell.exe` (PID 1234) connecting to an external address (`[REDACTED_IP]`), alongside the discovery of `mimikatz.exe` running in memory.
* **Memory Forensics Detection:** Using Volatility's `malfind` plugin, I confirmed process injection within `powershell.exe` (PID 1234), revealing a 200,774-byte Meterpreter staging payload.
* **Hidden & Deleted Artifacts:** Successfully compared `pslist` with `psscan` to uncover a hidden process (PID 9999), and carved a deleted instance of `mimikatz.exe` directly from offset `0x20000000`.

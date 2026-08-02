# Day 30: The Chain Hunter — Multi-Stage Execution

## 📝 Overview
Attacks rarely happen in a vacuum; every action triggers the next step in a sequence. This module focuses on hunting the entire attack chain—from the initial download cradle and payload staging, to execution and the final objective. 

---

## 🎯 Objectives Completed
* **Attack Simulation (Task 121):** Initiated a multi-stage attack where `cmd.exe` spawned `powershell.exe` to execute an encoded download cradle.
* **Log Hunting (Task 122):** Tracked the secondary stage where PowerShell downloaded the `mimikatz.exe` payload from a remote server to the public directory.
* **Process Ancestry Tree (Task 123):** Visualized the parent-child process relationships, mapping `cmd.exe` down through to the credential dumping execution of `mimikatz.exe`.
* **Timeline Analysis (Task 124):** Correlated events across time to build a chronological timeline of the attack, identifying exactly when each stage occurred.
* **DeepBlueCLI Detection (AT85):** Ran DeepBlueCLI against Windows event logs to automatically detect the suspicious process chain (`cmd.exe` ➔ `powershell.exe` ➔ `mimikatz.exe`).
* **KQL Query Building (AT86):** Drafted a Kusto Query Language (KQL) script targeting `DeviceProcessEvents` to hunt for multi-stage command-line anomalies in SIEM environments.

---

## 🧠 What I Learned
* **Attack Stages:** A standard attack chain includes a Download Cradle (the initial fetch command), Staging (saving or loading the payload), Execution (running the payload), and the Objective (e.g., credential theft).
* **Process Ancestry:** Analyzing the parent-child relationships between processes is critical for identifying exactly how a malicious executable was launched.
* **Chronological Correlation:** Timeline analysis allows defenders to connect disparate events by their timestamps to reconstruct the attacker's path.

---

## 🛠️ Toolset & Command Reference

| Tool / Technique | Purpose |
| :--- | :--- |
| **Download Cradle** | An initial command (often PowerShell) that fetches and executes a payload. |
| **Process Ancestry** | Visualizing parent-child relationships to map the execution flow. |
| **DeepBlueCLI** | Windows event log analysis tool used to detect process chains and credential dumping. |
| **KQL** | Kusto Query Language, utilized for advanced threat hunting in platforms like Sentinel/Defender. |

---

## 🔍 Key Findings & Analysis
* **Chain Detection:** The process ancestry tree successfully linked the initial `cmd.exe` execution to the final `mimikatz.exe` credential dumping event.
* **Log Correlation:** DeepBlueCLI successfully identified the multi-stage anomaly within the `security.evtx` logs, matching the specific `cmd.exe` ➔ `powershell.exe` ➔ `mimikatz.exe` pattern.

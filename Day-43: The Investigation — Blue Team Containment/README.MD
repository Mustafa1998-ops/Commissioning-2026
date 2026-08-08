# Day 43: The Investigation — Blue Team Containment

## 📝 Overview
The attack is over; now we investigate. Day 43 focuses on the Blue Team's post-incident response actions. This involves building a comprehensive timeline of the attack, isolating compromised hosts, performing Root Cause Analysis (RCA) to understand the initial entry vector, and utilizing memory forensics to uncover hidden artifacts.

---

## 🎯 Objectives Completed
* **Timeline Builder (Task 169):** Correlated logs from Suricata, Sysmon, and Windows Event Logs to build a chronological timeline of the entire incident—from initial SMB enumeration to the final DNS tunneling exfiltration.
* **Containment Operations (Task 170):** Executed critical containment steps: isolating the affected VM (`192.168.56.105`), blocking associated network traffic, capturing memory snapshots, and preserving forensic evidence.
* **Root Cause Analysis (Task 171):** Conducted an RCA, identifying that the initial entry vector was a Phishing email, the control failure was a lack of Multi-Factor Authentication (MFA), and recommended the implementation of MFA and user awareness training.
* **Memory Forensics (AT106):** Analyzed an 8GB memory dump (`memory.dmp`) using the Volatility framework, successfully detecting process injection within `powershell.exe` and extracting the 200KB Meterpreter payload.

---

## 🧠 What I Learned
* **The Importance of Timelines:** A chronological timeline is the foundation of any incident investigation. It allows responders to understand the exact sequence of events, linking initial access to persistence and exfiltration.
* **Effective Containment:** Immediate containment (like VM isolation) is critical to prevent lateral movement. Taking snapshots *before* remediation ensures that volatile evidence is preserved for deep forensic analysis.
* **Root Cause vs. Symptoms:** While detecting malware (the symptom) is important, identifying *how* it got there (the Root Cause, e.g., Phishing + No MFA) is essential to prevent future breaches.

---

## 🛠️ Toolset & Command Reference

| Component / Tool | Purpose |
| :--- | :--- |
| **Timeline Analysis** | Building a chronological view of attack events across multiple log sources. |
| **Containment Procedures** | Actions taken to stop the attack, including VM isolation and network blocking. |
| **Root Cause Analysis (RCA)** | Methodology to identify the underlying vulnerability or control failure that permitted the breach. |
| **Volatility** | The memory forensics framework used to analyze RAM dumps, list processes, and extract injected malware. |

---

## 🔍 Key Findings & Analysis
* **Timeline Reconstructed:** The completed timeline clearly demonstrated the rapid progression of the attack, showing only 6 minutes between the initial PowerShell execution (10:24:02) and the final HTTP POST exfiltration (10:30:22).
* **Forensic Artifacts Recovered:** Volatility analysis confirmed an active network connection (`192.168.56.105:49152 ➔ 192.168.56.102:4444`) and successfully extracted the injected `meterpreter.bin` payload from memory.
* **System Promotion:** Successfully containing the incident, performing the RCA, and completing the memory forensics investigation resulted in a promotion to the rank of **BRIGADIER GENERAL**.

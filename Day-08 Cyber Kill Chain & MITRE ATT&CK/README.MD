# Day 8: Threat Intelligence & Adversary Frameworks 🧠

> **Author:** Mustafa Firojbhai Saherwala

## 🔒 OPSEC Disclaimer
> **Security Mindset Note:** This module focuses on the theoretical mapping and framework application of known adversary tactics. Any references to specific exploits (e.g., EternalBlue MS17-010) are mapped purely for educational SOC defense and detection engineering purposes. No active exploitation was conducted during this phase.

---

## 🎯 Objective
The objective of Day 8 was to transition from offensive tool execution to defensive analysis by mapping attacker behavior to industry-standard frameworks. This structured approach is critical for identifying detection gaps, improving SIEM correlation rules, and strengthening the overall defensive posture of a SOC environment.

## 📝 Task Breakdown & Deliverables

### Task 8.1: Cyber Kill Chain Mapping
Analyzed the Lockheed Martin Cyber Kill Chain by mapping a real-world scenario (Targeted Ransomware Campaign) through all seven phases:
1.  **Reconnaissance:** OSINT and WHOIS lookups targeting company infrastructure.
2.  **Weaponization:** Crafting a malicious VBA macro document.
3.  **Delivery:** Spearphishing email delivery masquerading as an HR document.
4.  **Exploitation:** Target user clicks "Enable Content," triggering the exploit.
5.  **Installation:** Cobalt Strike beacon deployed silently.
6.  **Command & Control (C2):** HTTPS beaconing to an attacker-controlled server over port 443.
7.  **Actions on Objectives:** Lateral movement, credential theft, and Ransomware deployment.

### Task 8.2: MITRE ATT&CK Navigation
Navigated the MITRE ATT&CK Enterprise Matrix to document key techniques utilized in earlier labs.

| Technique ID | Tactic | Technique Name | Detection Method |
| :--- | :--- | :--- | :--- |
| **T1566.001** | Initial Access | Phishing: Spearphishing Attachment | Monitor email gateway logs and endpoint process trees (e.g., Outlook spawning `cmd.exe`). |
| **T1059.001** | Execution | Command and Scripting Interpreter: PowerShell | Enable Script Block Logging (Event ID 4104). Monitor for `-ExecutionPolicy Bypass`. |
| **T1003.001** | Credential Access | OS Credential Dumping: LSASS Memory | Monitor anomalous processes attempting to access `lsass.exe`. |

### Task 8.3: Mapping Tools to Frameworks (Nmap)
Correlated active scanning methodologies executed in Days 6 & 7 to MITRE ATT&CK techniques to understand how defenders categorize this traffic.

| Command Executed | ATT&CK ID | Technique Name |
| :--- | :--- | :--- |
| `nmap -sS [TARGET]` | **T1595.001** | Active Scanning: Scanning IP Blocks |
| `nmap -D RND:5 [TARGET]` | **T1590** | Gather Victim Network Information |
| `nmap -f [TARGET]` | **T1595.001** | Active Scanning (via Defense Evasion) |

### Task 8.4: Exploit Mapping (EternalBlue MS17-010)
Mapped the notorious EternalBlue exploit to the Cyber Kill Chain to understand advanced, wormable threats.
*   *Highlight:* Explored how EternalBlue bypasses the typical "Delivery" phase (like phishing) by sending crafted SMBv1 packets directly over the network to exposed port 445, immediately followed by kernel-level ring-0 installation (DoublePulsar).

### Task 8.5 & 8.6: Detection Gap Analysis & Coverage Heatmap
Conducted an assessment of hypothetical SOC detection capabilities (GraySentinel Environment) based on the mapped tactics, generating a visual heatmap.

**Key Findings:**
*   🔴 **Hardest to Detect (Pre-ATT&CK):** Reconnaissance and Weaponization occur almost entirely on attacker-controlled infrastructure, making them nearly impossible to detect proactively without specialized Threat Intelligence feeds.
*   🔴 **Critical Detection Gap:** Fragmented packet scanning (Defense Evasion) currently lacks robust SIEM alerts in standard configurations.
*   ✅ **Proposed Solution:** Implement stateful packet inspection on internal firewalls and route logs to the SIEM to trigger alerts on abnormal IP fragmentation before payload inspection occurs. 

---

## 🚧 Challenges Faced & Overcome
*   **Translating Raw Data to Frameworks:** Initially, it was challenging to determine exactly which MITRE tactic a specific Nmap command fell under, as many actions (like scanning) overlap multiple tactical goals.
    *   *Solution:* Relied heavily on the MITRE ATT&CK sub-techniques (drilling down into T1595 to find `.001`) to accurately classify the specific nuances of active scanning and ensure accurate SOC mapping.

## 🧠 Lessons Learned
*   **Frameworks Standardize Defense:** MITRE ATT&CK and the Cyber Kill Chain provide a universal language. Instead of vaguely stating "they pinged our server," a SOC analyst can report "the adversary executed T1595.001," instantly aligning the incident response team on the threat level.
*   **Proactive vs. Reactive Security:** By mapping out detection coverage on a heatmap, security teams can proactively build SIEM rules for their blind spots (like Defense Evasion) rather than waiting for a breach to realize the gap exists.

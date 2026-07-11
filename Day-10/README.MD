# 🛡️ Attack & Detection Simulator (CTF Lab)

Welcome to my cybersecurity portfolio! This repository documents my hands-on experience traversing a simulated CTF environment. It serves as a showcase of my day-by-day improvement, highlighting my growing ability to execute offensive tactics (Red Team) and immediately correlate those actions with defensive monitoring (Blue Team).

## 🎯 Objective
The primary goal of this lab was to execute a multi-stage attack kill-chain against a sandboxed target (`<REDACTED_TARGET_IP>`) and analyze the resulting traffic through the lens of an Intrusion Detection System (IDS). 

## 🛠️ Skills & Technologies Demonstrated

### Offensive Operations (Red Team)
* **Reconnaissance:** Enumerated SMB shares on port 445 using `nmap` and NSE scripts (`smb-enum-shares`) to silently gather intelligence.
* **Credential Access:** Conducted RDP brute-force attacks against built-in administrator accounts using `hydra` and the `rockyou.txt` wordlist.
* **Exploitation:** Weaponized the **EternalBlue (MS17-010)** vulnerability using `msfconsole` to trigger a kernel pool overflow.
* **Payload Generation:** Crafted custom `reverse_tcp` meterpreter executables using `msfvenom` to actively bypass inbound firewall filtering.

### Defensive Analysis (Blue Team)
* **IDS Alerting:** Analyzed **Suricata 6.0** network alerts, dissecting rule structures, SIDs (e.g., 2024218 for EternalBlue), classtypes (`attempted-admin`), and threat priorities.
* **Log Correlation:** Correlated network traffic with Windows Event Logs, specifically identifying RDP brute-force breaches by tracking floods of Event ID `4625` (Logon Failure) followed by a single `4624` (Logon Success).
* **Alert Triage:** Reconstructed the attack timeline via a simulated SIEM dashboard to separate early reconnaissance noise from critical exploitation events.

## 🚀 The Kill-Chain Breakdown
1. **Phase 1 - SMB Reconnaissance:** Fingerprinted the target's remote admin and IPC shares without altering system states. Mapped to Suricata's `attempted-recon` classification.
2. **Phase 2 - RDP Brute Force:** Escalated pressure to force entry, leaving distinct defensive footprints in the Windows Security logs.
3. **Phase 3 - EternalBlue:** Delivered a decisive kernel-level exploit via a crafted SMBv1 trans2 packet, granting SYSTEM access without requiring user credentials.
4. **Phase 4 - Correlation Dashboard:** Switched to the analyst perspective to trace the attacker's origin (`<REDACTED_ATTACKER_IP>`) and map the alerts to specific phases of the attack.

## 📚 Beyond the Lab: Security Education
Understanding the technical mechanics of an attack is only half the equation; explaining why it matters is just as crucial. I am highly focused on the importance of cybersecurity in the digital world and how it protects personal data and critical infrastructure. 

To help everyday internet users grasp these concepts, I regularly work on educational content. I recently structured a project titled *Cybersecurity in the Digital Age* into three clear chapters—The Hook, The Definition, and The "Why"—designed specifically to translate complex digital security threats and defenses into accessible, engaging formats.

---
*Continually learning, building, and securing the digital world—one lab at a time.*

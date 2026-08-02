# Day 31: The Persistence Hunter — Persistence & Exfiltration

## 📝 Overview
Attackers leave traces; persistence keeps them in, and exfiltration takes data out. This module focuses on actively hunting for both ends of the attacker lifecycle by examining scheduled tasks, services, registry run keys, and analyzing outbound traffic and DNS anomalies.

---

## 🎯 Objectives Completed
* **Create & Hunt Persistence (Task 125 & 126):** Created and then actively hunted for persistence mechanisms by checking scheduled tasks, Windows services, and Registry Run/RunOnce keys.
* **Exfiltration Hunting (Task 127):** Analyzed outbound traffic and DNS queries to identify large outbound data transfers and indicators of DNS tunneling.
* **Hunt Reporting (Task 128):** Documented all findings into a complete hunt report, detailing hypotheses, persistence findings, exfiltration findings, and actionable recommendations.
* **RITA Hunting Simulation (AT87):** Ran Real Intelligence Threat Analytics (RITA) to analyze PCAP files and detect network anomalies such as beacons, DNS tunnels, and SSL certificate irregularities.
* **YARA Rule Builder (AT88):** Built custom YARA rules to detect malware and suspicious files based on specific strings and persistence patterns.

---

## 🧠 What I Learned
During this hands-on lab, I reinforced several critical threat hunting concepts:
* **Persistence Mechanisms:** Attackers commonly use `HKLM\Software\Microsoft\Windows\CurrentVersion\Run`, scheduled tasks, and rogue services to maintain access after a system reboot.
* **Exfiltration Indicators:** Spikes in outbound bytes to unusual destination IPs or unusually long DNS queries (e.g., >200 characters) are prime indicators of data theft and tunneling.
* **Statistical Analysis:** Visualizing traffic patterns—such as bytes per host and protocol distribution—makes network anomalies stand out clearly from the baseline.

---

## 🛠️ Toolset & Command Reference

| Tool / Command | Purpose |
| :--- | :--- |
| **`schtasks /query`** | Lists scheduled tasks configured on the Windows endpoint. |
| **`Get-Service`** | Lists all Windows services to hunt for rogue executions. |
| **`HKLM\Run`** | Core registry location checked for persistence keys. |
| **RITA** | Real Intelligence Threat Analytics tool used to find beacons and tunnels. |
| **YARA** | A pattern-matching tool utilized to write rules for malware detection. |

---

## 🔍 Key Findings & Analysis
* **Persistence Uncovered:** Identified a suspicious scheduled task (`BackupTask`) executing encoded PowerShell, 2 rogue services running from a temporary directory, and a malicious registry run key (`SystemCheck` pointing to `malware.exe`).
* **Exfiltration Confirmed:** Detected an anomalous 245 MB outbound data transfer to an external IP (`[REDACTED_IP]`), alongside long DNS queries (215 characters) indicating a DNS tunnel.
* **RITA Detections:** Automated analysis with RITA flagged two distinct network beacons communicating with external addresses (`[REDACTED_IP]` and `[REDACTED_IP]`) and a self-signed SSL certificate anomaly.

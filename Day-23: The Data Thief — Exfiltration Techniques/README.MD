# Day 23: The Data Thief — Exfiltration Techniques

## 📝 Overview
Getting data out is the final step of any cyber attack. This project explores how data exfiltration hides in plain sight using standard network protocols: HTTP POSTs, DNS queries, and ICMP pings. Alongside execution, this module covers active detection mechanisms to identify and block these covert channels using network monitoring and Suricata Intrusion Detection Systems (IDS).

---

## 🎯 Objectives Completed
* **HTTP POST Exfiltration (Task 93):** Exfiltrated data using seemingly legitimate HTTP POST requests (via `Invoke-WebRequest`) that blend in with normal web traffic.
* **DNS Tunneling (AT71):** Encoded data within subdomain labels using `dnscat2`, leveraging small, frequent DNS queries to bypass outbound restrictions.
* **ICMP Ping Exfiltration (Tasks 94 & 95):** Hid hex-encoded data within the payload of ICMP echo (ping) packets, utilizing a diagnostic protocol that is often allowed outbound and rarely inspected.
* **Exfiltration Detection (Task 96 & AT72):** Implemented Suricata rules and utilized `tcpdump` to actively monitor and detect exfiltration anomalies, identifying unusual traffic patterns across HTTP, DNS, and ICMP.

---

## 🧠 What I Learned
During this hands-on lab, I reinforced several critical offensive and defensive security concepts:

* **Protocol Abuse:** I learned how standard protocols like HTTP, DNS, and ICMP can be repurposed as covert channels for data theft.
* **Evasion Tactics:** I observed why these methods work—HTTP POSTs mask data within normal web traffic, DNS tunneling exploits typically unmonitored outbound DNS resolution, and ICMP payloads exploit standard network diagnostic tools.
* **Detection Signatures:** I developed an understanding of how to identify anomalies, such as DNS query lengths exceeding normal limits (e.g., >200 characters) or unusually large ICMP payload sizes (e.g., 255 bytes instead of the normal 64).

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
| :--- | :--- |
| **PowerShell (`Invoke-WebRequest`)** | Executed HTTP exfiltration via POST requests. |
| **`dnscat2`** | Deployed as a DNS tunneling server and client for data extraction. |
| **`xxd` & `ping`** | Utilized `xxd` to hex-encode files and `ping` to transmit the hidden payloads. |
| **`tcpdump`** | Captured ICMP network traffic to analyze packet payloads for detection. |
| **Suricata** | Configured as an IDS to apply custom rules (`suricata.yaml`) for identifying exfiltration attempts. |

---

## 🔍 Key Findings & Analysis
* **Covert Channels:** Successfully transmitted sensitive data (e.g., hex-encoded passwords) via ICMP and DNS without triggering basic outbound firewall blocks.
* **High-Fidelity Alerts:** Real-time monitoring with Suricata successfully flagged large HTTP POST bodies (e.g., 2048 bytes to `/upload.php`), DNS length anomalies (queries over 200 characters), and unusual ICMP payloads containing printable ASCII.
* **System Promotion:** Mastering these covert exfiltration techniques and their respective detection rules resulted in unlocking the GUNNERY SERGEANT promotion and successfully completing Phase 3.

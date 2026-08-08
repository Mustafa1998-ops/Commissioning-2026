# Day 42: The Final Act — Persistence & Exfiltration

## 📝 Overview
The mission is almost complete. Day 42 covers the final stages of the Red Team kill chain: establishing robust persistence to survive system reboots, locating the target data (the flag), and utilizing stealthy exfiltration methods (such as DNS tunneling and steganography) to extract the data without detection.

---

## 🎯 Objectives Completed
* **Establish Persistence (Task 166):** Created a scheduled task (`SystemCheck`) running as `SYSTEM` and modified the Windows Registry (`HKLM\Software\Microsoft\Windows\CurrentVersion\Run`) to ensure the payload executed automatically upon system boot.
* **Flag Discovery (Task 167):** Utilized PowerShell (`Get-ChildItem -Recurse -Filter *flag*`) to locate and capture the final objective file (`flag.txt`) hidden on the target's desktop.
* **Data Exfiltration (Task 167 & 168):** Successfully exfiltrated the captured flag utilizing `dnscat2` to encode the data within DNS queries, bypassing standard outbound firewall restrictions.
* **Steganography Exfiltration (AT105):** Employed advanced evasion by utilizing `steghide` to embed the captured flag inside a standard image file (`cat.jpg`) before exfiltrating it via HTTP POST.

---

## 🧠 What I Learned
* **Persistence Mechanisms:** Attackers must ensure their access survives a reboot. Modifying Registry Run keys and creating Scheduled Tasks are reliable, built-in Windows features frequently abused for this purpose.
* **DNS Tunneling:** Because DNS traffic is rarely blocked outbound (as it is required for normal network operation), tools like `dnscat2` are highly effective for stealthy command and control and data exfiltration.
* **Steganography:** Hiding malicious data or exfiltrated information inside benign files (like JPEGs) helps attackers bypass Data Loss Prevention (DLP) systems and deep packet inspection.

---

## 🛠️ Toolset & Command Reference

| Tool / Command | Purpose |
| :--- | :--- |
| **`schtasks /create`** | Command used to establish persistence via a scheduled task. |
| **`reg add HKLM\...\Run`** | Command used to add a registry run key to execute a payload on boot. |
| **`Get-ChildItem -Recurse -Filter *flag*`** | PowerShell cmdlet utilized to search the file system for the target flag. |
| **`dnscat2`** | Tool used to establish a DNS tunnel for covert data exfiltration. |
| **Steganography (`steghide`)** | Technique used to hide the captured data inside an image file. |

---

## 🔍 Key Findings & Analysis
* **Persistence Verified:** Both the scheduled task (`SystemCheck`) and the Registry Run key were successfully verified, guaranteeing persistent payload execution.
* **Exfiltration Success:** The flag (`CTF{r3d_t34m_3x3cut10n_0f_th3_4tt4ck}`) was successfully located, encoded, and exfiltrated to the attacker's infrastructure via a DNS tunnel.
* **System Promotion:** Successfully establishing persistence, discovering the flag, and executing stealthy exfiltration resulted in a promotion to the rank of **COLONEL**.

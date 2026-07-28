# Day 24: The Rule Writer — Custom Suricata Rules

## 📝 Overview
Detection rules are the foundation of any Intrusion Detection/Prevention System (IDS/IPS). This module focuses on Detection Engineering by writing custom Suricata rules to identify specific threats that generic, out-of-the-box rules might miss. 

*Note: In adherence to strict operational security guidelines, specific target IP addresses and MAC addresses have been redacted or generalized using `any` variables in the rule logic.*

---

## 🎯 Objectives Completed
* **PowerShell Detection Rule (Task 97):** Engineered a custom rule to detect PowerShell encoded commands (e.g., `-EncodedCommand`) and suspicious execution patterns.
* **DNS Tunneling Detection Rule (Task 98):** Drafted a signature to identify DNS tunneling by detecting unusually long DNS queries (greater than 200 characters) using Perl Compatible Regular Expressions (PCRE).
* **Mimikatz Detection Rule (Task 99):** Created a TCP rule to detect Mimikatz credential dumping activity in network traffic by searching for specific pattern strings like "mimikatz" and "sekurlsa".
* **Rule Testing & Optimization (Task 100, AT73, AT74):** Validated all custom rules against sample traffic, optimized rule thresholds (e.g., `threshold type limit, track by_src`) to reduce alert fatigue, and updated the core Suricata ruleset (`suricata-update`) while preserving custom signatures.

---

## 🧠 What I Learned
This hands-on lab provided deep insights into the anatomy of network detection signatures:

* **Suricata Rule Anatomy:** Mastered the strict structure of Suricata rules, which consists of the **Action** (alert, drop, pass, reject), **Protocol** (tcp, udp, http, dns, smb), **Source/Destination** IPs and ports, and **Options** (msg, content, pcre, sid).
* **Detection Engineering Best Practices:** 
    * **Be Specific:** Use precise patterns to avoid broad rules that cause false positives.
    * **Test Thoroughly:** Validate rules against known good and bad traffic.
    * **Use Flowbits:** Track state across packets to reduce false positives.
    * **Consider Performance:** Avoid computationally expensive patterns on every packet by utilizing `fast_pattern` when possible.

---

## 🛠️ Toolset & Command Reference

| Component / Command | Description | Example |
| :--- | :--- | :--- |
| **Action** | Specifies what to do when a rule matches. | `alert`, `drop`, `pass` |
| **Protocol** | The network protocol to inspect. | `tcp`, `udp`, `http`, `dns` |
| **Source/Dest** | The IP address and port variables. | `any any -> any any` *(IPs hidden for OPSEC)* |
| **`msg`** | The alert message generated. | `msg:"Mimikatz Detected";` |
| **`content`** | The specific payload pattern to match. | `content:"-EncodedCommand";` |
| **`pcre`** | Matches regex patterns for complex detection. | `pcre:"/^.{200,}/";` |
| **`test all`** | Validates custom rules against sample traffic. | `test all` |
| **`threshold optimize`** | Optimizes thresholds to limit noise. | `threshold optimize` |

---

## 🔍 Key Findings & Analysis
* **Evasion Detection:** Successfully built and tested a rule (`sid:100001`) that caught obfuscated PowerShell payloads attempting to execute base64-encoded commands over HTTP.
* **Data Exfiltration Interception:** The DNS rule (`sid:100002`) successfully alerted on a simulated exfiltration attempt featuring a 215-character query string.
* **System Promotion:** Completing this rule writing and optimization sequence unlocked the **SFC (Sergeant First Class)** promotion and marked the official completion of Phase 3 of the program.

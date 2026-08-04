# Day 35: The WAF Bypasser — Web Application Firewall & Bypass

## 📝 Overview
A Web Application Firewall (WAF) acts as a protective wall for web applications, but walls can be climbed or bypassed. This module focuses on the art of WAF evasion, starting with the installation of ModSecurity and the OWASP Core Rule Set (CRS), analyzing how attacks are blocked, and then leveraging obfuscation techniques and automated tamper scripts to bypass those defenses.

---

## 🎯 Objectives Completed
* **ModSecurity Installation (Task 141):** Deployed the ModSecurity open-source WAF engine and integrated the industry-standard OWASP Core Rule Set (CRS) into an Apache web server.
* **SQLi Detection Simulation (Task 142):** Executed Basic and UNION-based SQL injection payloads to verify the WAF's detection capabilities, confirming active blocking (403 Forbidden) via `libinjection`.
* **WAF Bypass Techniques (Task 143):** Manually tested obfuscation methods to evade active WAF rules, successfully utilizing comment obfuscation, case variation, and URL encoding.
* **Automated sqlmap Tampering (Task 144 & AT96):** Leveraged `sqlmap` with advanced `--tamper` scripts (e.g., `space2comment`, `charencode`, `base64encode`) to automatically transform payloads and successfully bypass the firewall to extract database credentials.
* **Custom ModSecurity Rules (AT95):** Authored custom WAF rules to detect and drop advanced parameter pollution techniques.

---

## 🧠 What I Learned
* **WAF Mechanics:** ModSecurity paired with OWASP CRS provides robust signature and behavior-based filtering, returning 403 Forbidden errors when payloads trigger a rule.
* **Manual Obfuscation:** Attackers evade detection by altering the payload's appearance without changing its execution logic, utilizing techniques like inline comments (`/**/OR/**/1=1`), URL encoding (`%27%20OR`), and alternating casing (`oR`).
* **Automated Evasion:** Advanced exploitation tools like `sqlmap` feature built-in tamper scripts that systematically encode and obfuscate SQL injection attempts to silently slip past strict WAF rulesets.

---

## 🛠️ Toolset & Command Reference

| Tool / Command | Purpose |
| :--- | :--- |
| **ModSecurity & OWASP CRS** | Open-source WAF engine and core rule set for detecting web attacks. |
| **`'/**/OR/**/1=1/**/--`** | SQL injection payload utilizing comment obfuscation to bypass filters. |
| **`%27%20OR%20%271%27%3D%271`** | SQL injection payload obfuscated via standard URL encoding. |
| **`sqlmap --tamper=space2comment`** | Executes `sqlmap` utilizing a specific tamper script to evade WAF detection. |

---

## 🔍 Key Findings & Analysis
* **Detection Confirmed:** Initial SQL injection attempts (`' OR '1'='1' --`) were successfully flagged and blocked by ModSecurity Rule ID 942100.
* **Evasion Success:** By applying combined tamper scripts (`space2comment,charencode,base64encode`) and a randomized User-Agent in `sqlmap`, the WAF was completely bypassed, leading to the extraction of admin credentials (`root:toor123`).

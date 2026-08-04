# Day-34: The Phishing Analyst — Email Analysis & Simulation

## 📝 Overview
Phishing remains the most common initial attack vector. This module covers the end-to-end lifecycle of email-based threats—from examining email headers for spoofing and authentication failures, to simulating active phishing campaigns and writing detections for macro-enabled attachments.

---

## 🎯 Objectives Completed
* **Email Header Analysis (Task 137):** Analyzed email headers to detect spoofing indicators and verify the authentication status of SPF, DKIM, and DMARC records.
* **URL Reputation Checking:** Extracted and analyzed embedded URLs to assess risk scoring and identify malicious phishing domains.
* **Gophish Campaign Simulation (Task 138):** Set up and launched a simulated phishing campaign using the Gophish framework, including configuring sending profiles, landing pages, and email templates.
* **Phishing Detection & Credential Capture (Task 139):** Monitored real-time detection dashboards to identify suspicious domains, malicious URLs, and instances of compromised credentials.
* **YARA for Macros (AT94):** Built a specialized YARA rule targeting malicious Office documents by detecting VBA signatures and OLE structures.

---

## 🧠 What I Learned
* **Email Authentication:** Sender Policy Framework (SPF) verifies if a sending IP is authorized, while DKIM ensures the email was not tampered with in transit; failures in these checks highly suggest spoofing.
* **Simulation for Training:** Open-source frameworks like Gophish are invaluable for simulating real-world phishing attacks to test user awareness and track credential capture metrics.
* **Macro Detection:** Malicious attachments often leverage Visual Basic for Applications (VBA) macros to execute shell commands; pattern-matching via YARA can effectively catch these indicators.

---

## 🛠️ Toolset & Command Reference

| Tool / Concept | Purpose |
| :--- | :--- |
| **SPF / DKIM / DMARC** | Authentication protocols used to verify sender authorization, email integrity, and policy enforcement. |
| **Gophish** | An open-source phishing framework used to coordinate simulated attack campaigns. |
| **URL Reputation** | The process of checking extracted URLs against threat intelligence to determine malicious risk scores. |
| **YARA** | Utilized to write pattern-based detection rules for malicious macro-enabled attachments. |

---

## 🔍 Key Findings & Analysis
* **Spoofed Headers Detected:** Analysis revealed a critical mismatch between the `From:` (`security@microsoft-security.com`) and `Reply-To:` (`attacker@malicious.com`) addresses, alongside complete failures for SPF, DKIM, and DMARC.
* **Malicious Infrastructure:** The email originated from a known malicious IP (`[REDACTED_IP]`) and contained embedded links with a 98/100 risk score.
* **Campaign Metrics:** The simulated Gophish campaign tracked 25 opened emails and successfully captured 5 sets of user credentials from the targeted landing page.
* **Promotion Achieved:** Completing Phase 3 and mastering these investigative skills resulted in the final promotion to **OFFICER CANDIDATE**.

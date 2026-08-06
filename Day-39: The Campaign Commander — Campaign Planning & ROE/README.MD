# Day 39: The Campaign Commander — Campaign Planning & ROE


## 📝 Overview
A successful cyber campaign is won in the planning phase. This module transitions into a command role, focusing on the strategic organization of a full 7-day cybersecurity exercise. It covers defining team roles (Red, Blue, Purple), establishing strict Rules of Engagement (ROE), scheduling the timeline, and verifying technical readiness before operations commence.

---

## 🎯 Objectives Completed
* **Team Formation (Task 157):** Defined and organized the campaign teams: the Red Team (offensive operations), the Blue Team (defensive operations), and the Purple Team (coordination and improvement).
* **Rules of Engagement (ROE) Verification:** Established strict boundaries for the exercise, defining allowed TTPs (e.g., PowerShell, WMI, Credential Dumping) and explicitly prohibiting destructive actions, DoS attacks, and lateral movement into production environments.
* **Campaign Timeline Planning:** Outlined a comprehensive 7-day operational schedule, moving from initial access and Blue Team detection to deep investigation, containment, and the final After-Action Review (AAR).
* **Readiness Checks (Task 158 & 159):** Verified campaign readiness by ensuring Blue Team logging was active, Red Team tools (Sliver, Metasploit, Empire) were configured, network connectivity was established, and baseline VM snapshots were taken.
* **Advanced Preparation (AT103):** Executed advanced pre-campaign checks, confirming the deployment of custom YARA rules, active domain fronting, and configured sleep/jitter settings for evasion.

---

## 🧠 What I Learned
* **The Importance of ROE:** The Rules of Engagement are the absolute law of any exercise. They ensure the assessment provides maximum value without causing operational disruption or damage to the target network.
* **Cross-Functional Coordination:** A successful campaign requires tight coordination. The Red Team attacks, the Blue Team defends, and the Purple Team ensures that findings are actively translated into improved detection engineering.
* **Operational Readiness:** Taking baseline snapshots and verifying logging *before* an engagement starts is critical. If actions aren't logged, the Blue Team cannot improve their detection posture.

---

## 🛠️ Campaign Parameters

| Component | Campaign Specification |
| :--- | :--- |
| **Allowed TTPs** | T1059 (PowerShell), T1047 (WMI), T1136 (Create Account), T1003 (Credential Dumping). |
| **Prohibited Actions** | Destructive payloads, DoS, data exfiltration outside the lab environment. |
| **Red Team Tools** | Sliver C2, Metasploit, PowerShell Empire. |
| **Target Infrastructure** | `[REDACTED_IP]` (Windows VM), `[REDACTED_IP]` (Web Server). |

---

## 🔍 Key Findings & Analysis
* **Preparation Complete:** All readiness checks passed successfully, ensuring logging and toolsets are fully operational for Day 40's initial access operations.
* **Evasion Configured:** Advanced preparation confirmed that OpSec measures, including CDN domain fronting and beacon jitter, are active to challenge the Blue Team's detection capabilities.
* **Promotion Achieved:** Successfully planning and preparing the campaign resulted in a promotion to **CAPTAIN**, marking the beginning of Phase 5.

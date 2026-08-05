# Day 37: The Detection Engineer — Blue Team Strategy

## 📝 Overview
Detection is a continuous engineering process: writing rules, converting them to match specific environments, visualizing the data, and fine-tuning alerts to reduce noise. This module focuses on building universal detection logic with Sigma, translating it into platform-specific SIEM queries (Splunk SPL, Azure KQL, ELK), constructing dashboards, and executing alert tuning for maximum signal-to-noise ratio.

---

## 🎯 Objectives Completed
* **Sigma Rule Generation (Task 149):** Engineered a universal Sigma rule to detect suspicious PowerShell activity (`EventID 4104` with `*EncodedCommand*` patterns) and mapped it directly to MITRE ATT&CK techniques (`T1059.001`).
* **SIEM Query Conversion (Task 150):** Converted the generic Sigma rule into environment-specific queries, generating Splunk SPL, Azure Sentinel KQL, and Elasticsearch (ELK) JSON queries.
* **Dashboard Building (Task 151):** Constructed a detection dashboard to visualize critical metrics, tracking active alert counts, failed logins, event timelines, and top processes.
* **Alert Tuning (Task 152 & AT99):** Tuned a noisy PowerShell detection rule (which initially had a 92% false-positive rate) by applying whitelists for legitimate paths and adjusting thresholds (e.g., triggering only on encoded commands exceeding 1000 characters).
* **Risk-Based Scoring (AT100):** Applied advanced risk-scoring logic to categorize and prioritize alerts based on combined behaviors (e.g., marking EncodedCommand + Suspicious Process + Network Connection as "High Risk").

---

## 🧠 What I Learned
* **Universal Detection:** Sigma serves as the open standard for detection rules. By writing a rule once in YAML, it can be seamlessly translated and deployed across entirely different SIEM platforms.
* **Signal vs. Noise:** Alert fatigue is a critical issue in SOCs. Tuning rules by whitelisting known-safe binaries (like `svchost.exe` or legitimate admin scripts) increases the signal-to-noise ratio.
* **Risk-Based Alerting:** Instead of treating every anomaly equally, applying risk-based scoring suppresses low-level noise and elevates high-risk event chains, allowing analysts to prioritize actual threats.

---

## 🛠️ Toolset & Command Reference

| Component | Purpose |
| :--- | :--- |
| **Sigma Rule** | Open-source, generic signature format for SIEM detection. |
| **Splunk SPL** | Search Processing Language format (e.g., `index=windows EventCode=4104`). |
| **KQL (Azure Sentinel)** | Kusto Query Language (e.g., `DeviceProcessEvents \| where ...`). |
| **Alert Tuning** | The process of refining rules using whitelists and thresholds to reduce false positives. |
| **Risk Scoring** | Prioritizing alerts based on the severity and combination of detected behaviors. |

---

## 🔍 Key Findings & Analysis
* **Successful Tuning:** By applying strict whitelists and size thresholds to a PowerShell detection rule, false positives were reduced from 92% to 5%, improving the signal-to-noise ratio to 95%.
* **Effective Prioritization:** Applying risk-based scoring successfully filtered out 89 low-risk anomalies, isolating 12 critical, high-risk alerts that required immediate investigation.

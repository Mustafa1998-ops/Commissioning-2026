# Day 29: The Threat Hunter — Threat Hunting Fundamentals

## 📝 Overview
Threat hunting is a proactive approach where defenders do not wait for an alert, but actively go looking for the attacker. This module focuses on threat hunting fundamentals, operating on the principle that hunting is a continuous, data-centric, and hypothesis-driven process.

---

## 🎯 Objectives Completed
* **Hypothesis Formation (Task 117):** Formulated an educated guess about attacker behavior based on threat intelligence, specifically focusing on WMI persistence.
* **Data Collection (Task 118):** Collected necessary data to test the hypothesis using PowerShell WMI queries, such as querying `__EventFilter` and `__EventConsumer` classes.
* **Investigation Workflow (Task 119):** Executed the standard hunting loop: forming a Hypothesis, Collecting Data, Investigating findings, and taking Action. 
* **Threat Hunting Report (Task 120):** Documented the investigation by detailing the hypothesis, data sources, findings, and remediation recommendations.
* **Sigma Rule Generation (AT83):** Built a generic Sigma detection rule designed to flag suspicious WMI event subscriptions (`*create*__EventFilter*`).
* **Automated Hunting (AT84):** Executed an automated hunt script across multiple endpoints to rapidly identify indicators of WMI persistence.

---

## 🛠️ Toolset & Command Reference

| Tool / Concept | Purpose |
| :--- | :--- |
| **Hunting Loop** | The methodology of Hypothesis ➔ Collect ➔ Investigate ➔ Act. |
| **`Get-WmiObject`** | PowerShell cmdlet used to query WMI namespaces for event filters and consumers. |
| **Sigma Rules** | A generic detection rule format that can be converted into various SIEM query languages. |
| **Living Off the Land** | The attacker technique of using built-in system tools for malicious purposes. |

---

## 🔍 Key Findings & Analysis
* **Persistence Mechanisms:** Successfully identified suspicious WMI event filters and associated consumers that utilized encoded PowerShell commands for persistence.
* **Automated Scalability:** Running an automated hunt script against multiple endpoints successfully revealed compromised machines containing suspicious WMI filters, consumers, and bindings.

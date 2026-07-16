# Day 13: The Intelligence Analyst – Threat Intel & MISP

## Overview
This project simulates the workflow of a SOC Intelligence Analyst. The primary focus is on gathering raw threat intelligence feeds, correlating them with internal logs to detect real attacks, writing actionable Threat Intelligence (TI) reports, and sharing findings via a Malware Information Sharing Platform (MISP). 

## Key Concepts & Skills Demonstrated
* **Threat Intelligence Feed Parsing:** Extracted and parsed Indicators of Compromise (IoCs), such as malicious IPs, domains, and hashes, from raw feeds like `ipsum.txt`.
* **Alert Correlation:** Built correlation rules to identify chained attacker behaviors, filtering out isolated events and false positives. 
* **Attack Pattern Recognition:** Correlated Event ID 4625 (Failed Logon), Event ID 4624 (Successful Logon), and Event ID 7045 (New Service Installed) originating from the same source IP to confirm a "Possible brute force with persistence" attack.
* **TI Reporting:** Drafted structured intelligence reports using MITRE ATT&CK framework mapping (e.g., T1110 for Brute Force, T1543 for Persistence Service).
* **Intelligence Sharing (MISP):** Created and published threat intelligence events in MISP, utilizing attributes like `ip-dst` and `md5` hashes. 
* **Traffic Light Protocol (TLP):** Applied TLP tagging (such as TLP:AMBER for restricted distribution) to control the dissemination of sensitive threat intelligence.

## Completed Tasks
* **Task 13.2:** Utilized an IoC Feed Visualizer to parse a threat feed and correlate the indicators against the organization's alert log to spot exact matches and ignore look-alikes.
* **Task 13.3:** Constructed a logic chain in a Correlation Rule Builder to trigger a high-fidelity alert based on a specific sequence of Windows Event IDs.
* **Task 13.4:** Generated a TI Report summarizing the threat actor, tactics, indicators, and recommended detection steps.
* **Task 13.5:** Operated a MISP Event Simulator to package the findings into a structured event and publish it to the community.

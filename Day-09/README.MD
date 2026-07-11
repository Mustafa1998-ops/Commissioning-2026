# Suricata IDS Deployment & Custom Signature Engineering

## 🛡️ Project Overview
This project documents the successful deployment, configuration, and testing of the Suricata Intrusion Detection System (IDS). The primary focus was on developing custom detection signatures to identify malicious network behavior and actively tuning those rules to reduce false positives and improve alert fidelity. 

*Note: All IP addresses and sensitive network identifiers have been redacted from this repository to maintain security best practices and prevent potential data exposure.*

---

## 📋 Task Breakdown & Execution

*   **Task 9.1: Suricata Installation:** Successfully installed and initiated the Suricata IDS daemon, verifying the service was actively running and monitoring traffic.
*   **Task 9.2: Configuration Tuning:** Completed the initial configuration and tuning of the Suricata environment to prepare for custom rule implementation.
*   **Task 9.3: Base Rules Validation:** Validated the baseline configurations by successfully triggering and logging alerts for standard ICMP traffic.
*   **Task 9.4: Custom Signature (ICMP):** Developed and tested a custom signature specifically designed to detect ICMP Echo Requests.
*   **Task 9.5: Custom Signature (Nmap):** Engineered and validated a custom rule to detect Nmap SYN scans targeting the network.
*   **Task 9.6: Custom Signature (HTTP):** Wrote and successfully tested a custom signature to identify and alert on HTTP directory brute-forcing attempts.

---

## ⚙️ Custom Signatures & Threat Tuning

Developing the rules required addressing specific technical challenges, primarily moving beyond default configurations to accurately detect threats without overwhelming the system with noise.

### 1. ICMP Ping Flood Detection
*   **Difficulty Faced:** Detecting a single ping is insufficient for identifying malicious activity, presenting a challenge in accurately detecting volumetric attacks like Ping Floods.
*   **Resolution:** I appended a threshold mechanism to the ICMP rule to track the traffic volume by the source IP. 
*   **The Rule:**
    ```suricata
    alert icmp any any -> any any (msg:"ICMP test detected"; sid:1000001; rev:2; threshold: type both, track by_src, count 50, seconds 2;)
    ```
    *(Tuning detail: The rule tracks the source and triggers only if 50 packets are sent within a 2-second window, effectively distinguishing a flood from a benign connectivity check.)*

### 2. Nmap SYN Scan Detection
*   **Difficulty Faced:** The initial rule configuration generated false positives; a threshold count of 10 within 3 seconds was too sensitive and flagged legitimate, burst-like network traffic as an attack.
*   **Resolution:** I re-calibrated the rule to reduce false positives by increasing the threshold to 50 counts over 5 seconds.This ensures that only sustained, aggressive port scanning behavior triggers an alert.
*   **The Rule:**
    ```suricata
    alert tcp any any -> any any (msg:"NMAP SYN scan detected"; flags:S; sid:1000002; rev:2; threshold: type both, track by_src, count 50, seconds 5;)
    ```

### 3. HTTP Directory Brute Force Detection
*   **Objective:** Deployed a rule to monitor for rapid, repeated HTTP requests indicative of web directory enumeration or brute-forcing tools.
*   **The Rule:**
    ```suricata
    alert http any any -> any any (msg:"HTTP Directory Brute Force Attempt Detected"; http.method; content:"GET"; sid:1000003; rev:1; threshold: type both, track by_src, count 30, seconds 10;)
    ```

---

## 📊 Log Management & Analysis

A critical component of this deployment was analyzing the generated alerts, which contained essential data points including the Timestamp, Signature ID (SID), alert message, protocol (e.g., ICMP, TCP), Source Port, and Destination Port.

I utilized two primary log outputs for different security operations:
*   **`fast.log`:** This file is designed for human readability[cite: 1]. It provides a concise, single-line text output that is ideal for quick troubleshooting and monitoring activity in real-time using command-line tools like `tail`.
*   **`eve.json`:** This file is formatted in JSON and is intended for machine ingestion. It contains significantly more detailed metadata, such as flow information, HTTP headers, and TLS details[cite: 1]. This format is specifically designed to be forwarded to a SIEM (Security Information and Event Management) system for advanced parsing, correlation, and dashboarding.

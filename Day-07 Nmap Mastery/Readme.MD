# Day 7: Advanced Nmap & Evasion Techniques 🥷

> **Author:** Mustafa Firojbhai Saherwala

## 🔒 OPSEC Disclaimer
> **Security Mindset Note:** In adherence to strict Operational Security (OPSEC) principles, raw screenshots containing actual target IPs, packet capture data, and live enumeration results have been intentionally omitted. All logs and IP addresses below have been sanitized (e.g., `[TARGET_IP]`, `[DECOY_IP]`) to prevent the exposure of sensitive infrastructure while demonstrating analytical methodology.

---

## 🎯 Objective
The primary goal of Day 7 was to move beyond basic network mapping to analyze advanced scanning methodologies and simulate attacker evasion tactics. This involved executing decoy and fragmented scans, analyzing the resulting network traffic, and developing automation scripts to streamline reconnaissance for SOC operations.

## 📝 Task Breakdown & Deliverables

### Task 7.1 & 7.2: Decoy & Fragmented Scanning Execution
Simulated evasion techniques to obscure the true source of the scan and attempt to bypass rudimentary Intrusion Detection Systems (IDS).

**Sanitized Command - Decoy Scan:**
```bash
# Executing a scan using 5 random decoy IP addresses alongside the real IP to mask the origin
$ nmap -D RND:5 -p 22,80,443,445 [TARGET_IP]
```
*   **Traffic Analysis:** Captured the traffic via Wireshark. The scan successfully generated traffic from 6 unique source IPs (5 decoys + 1 actual attacker IP), successfully masking the true origin in a flood of noise.

**Sanitized Command - Fragmented Scan:**
```bash
# Fragmenting packets into 8-byte blocks to evade packet inspection engines
$ nmap -f -sS -p- [TARGET_IP]
```
*   **Traffic Analysis:** Observed a significant increase in total packet counts compared to a standard SYN scan. The TCP headers were successfully split across multiple IP fragments.

### Task 7.3: Evasion Techniques & Detection Strategy
Evaluated the effectiveness of the evasion techniques from a defender's perspective to improve SOC detection logic.
*   **Decoy Effectiveness:** Highly effective against manual log review, but easily flagged by automated SIEMs looking for rapid, identical port-hit signatures from multiple IPs simultaneously. 
*   **Fragmentation Effectiveness:** Successfully bypasses older, stateless firewalls that do not reassemble packets before inspection. 
*   **Defender Strategy:** To detect fragmented scans, the SOC must configure the IDS/IPS engines to enforce strict TCP/IP stack normalization (reassembling all fragmented packets *before* analyzing the payload for malicious signatures).

### Task 7.4: Nmap Automation Script
Developed a Bash script to automate repetitive scanning tasks, reduce manual syntax errors, and standardize output formats for reporting.

**Sanitized Code Snippet (`auto_recon.sh`):**
```bash
#!/bin/bash
# Simple automated reconnaissance script for standardized output
TARGET=$1

if [ -z "$TARGET" ]; then
  echo "Usage: ./auto_recon.sh [TARGET_IP]"
  exit 1
fi

echo "[*] Initiating automated recon against $TARGET..."
nmap -sS -sV -O -oN basic_scan_$TARGET.txt $TARGET
echo "[+] Basic scan complete. Results saved to basic_scan_$TARGET.txt"
```

### Task 7.5: Comparison Report
Compiled a comparative analysis of standard SYN scans versus advanced evasive scans. Identified that while evasive scans (like UDP and Fragmented) can bypass rudimentary filters, they drastically increase scan time and generate behavioral anomalies that modern EDR and network monitoring tools can flag.

---

## 🚧 Challenges Faced & Overcome
*   **Wireshark Noise:** Capturing traffic during the decoy scan resulted in thousands of packets, making it difficult to isolate the scan data.
    *   *Solution:* Applied strict Wireshark display filters (e.g., `ip.dst == [TARGET_IP] && tcp.flags.syn == 1`) to filter out background noise and isolate the specific Nmap behavior.
*   **UDP Scan Slowness:** The UDP scan (`-sU`) was taking an unreasonably long time to complete against the target VM.
    *   *Solution:* Investigated and learned that UDP scanning is inherently slow due to ICMP rate-limiting by the target OS (limiting ICMP Port Unreachable responses). Optimized the scan by targeting only top ports (`--top-ports 100`).

## 🧠 Lessons Learned
*   **Evasion is a Double-Edged Sword:** While evasion techniques hide specific signatures, they often generate behavioral anomalies (like massive packet fragmentation) that are easily caught by modern security appliances.
*   **Automation is Key:** Scripting repetitive Nmap commands not only saves time but ensures consistency in the methodology, which is critical for accurate vulnerability assessments and incident response operations.

# Day 27: The Packet Analyst — Wireshark & TShark.

## 📝 Overview
Every attack leaves a trail on the wire, and this module focuses on capturing and analyzing live network traffic using Wireshark and TShark[cite: 5]. The exercises cover identifying the signal in the noise through display filters, rebuilding entire conversations by following TCP streams, and automating analysis from the command line.

---

## 🎯 Objectives Completed
* **Packet Capture & Filtering (Task 109):** Captured live network traffic in promiscuous mode to collect packets across the network segment.
* **HTTP Object Extraction (Task 110):** Isolated HTTP requests using the `http.request` filter and utilized the Export Objects feature to successfully extract a transferred file (`malware.exe`) from the traffic.
* **Command Line Analysis (Task 111):** Utilized TShark, the command-line counterpart to Wireshark, to automate PCAP filtering and extract specific fields at scale.
* **Advanced Traffic Detection (Task 112 & AT79-80):** Identified malicious Meterpreter sessions by analyzing non-standard ports (like port 4444) and evaluating JA3 fingerprints within TLS handshakes.

---

## 🧠 What I Learned
During this hands-on lab, I reinforced several critical packet analysis concepts:
* **Display Filters:** I learned to reduce noise and focus on active threats by applying targeted filters, such as `tcp.port==80` and `dns`.
* **Stream Reconstruction:** I practiced following TCP streams to reconstruct entire network conversations, revealing the raw data exchanged between hosts.
* **Command-Line Proficiency:** I gained experience using TShark syntax (e.g., `tshark -r capture.pcap -Y "http.request"`) to quickly parse large capture files and extract key indicators.

---

## 🛠️ Toolset & Command Reference

| Tool / Filter | Purpose |
| :--- | :--- |
| **`http.request`** | Display filter to show only HTTP requests. |
| **`tcp.stream eq 0`** | Display filter used to follow a specific TCP stream. |
| **`tshark -r file.pcap -Y "filter"`** | Reads a PCAP file and applies a specified display filter via CLI. |
| **`tshark -T fields -e http.host`** | Extracts specific fields from the capture for automated analysis. |
| **Export Objects** | A feature used to extract files transferred over HTTP or SMB. |

---

## 🔍 Key Findings & Analysis
* **Payload Extraction:** Successfully isolated and extracted a 245 KB file named `malware.exe`, subsequently analyzing its MD5/SHA256 hashes to confirm a Trojan.Downloader signature.
* **C2 Detection:** Identified a Meterpreter reverse shell session established over port 4444.
* **Encrypted Traffic Analysis:** Decrypted TLS traffic using an available session key log to reveal hidden GET requests and binary payload transfers.

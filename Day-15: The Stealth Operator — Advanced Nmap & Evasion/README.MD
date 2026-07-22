## 📅 Day 15: The Stealth Operator — Advanced Nmap & Evasion

### 📌 Overview
Day 15 focused on performing network reconnaissance without triggering Intrusion Detection/Prevention Systems (IDS/IPS). I explored low-level packet manipulation, IP spoofing, IP fragment handling, and writing custom Suricata IDS rules.

### 🔬 Technical Deep-Dive & Lab Execution
* **Decoy Scans (`-D`)**: Obscured the origin IP by blending the real scan probe with traffic from multiple spoofed source IPs (`<DECOY_IP_1>`, `<DECOY_IP_2>`). Target log analysis confirmed that all source IPs appeared identical in event logs, rendering source attribution ambiguous without external flow logs.
* **IP Fragmentation (`-f`)**: Split probe packets into small 8-byte chunks to bypass legacy IDS devices that inspect individual frames without performing full IP reassembly.
* **Data Length Padding (`--data-length`)**: Appended random byte payloads to standard probe frames to break static packet-length signatures used by basic security scanners.
* **Idle (Zombie) Scan (`-sI`)**: Used a quiet third-party host (`<ZOMBIE_IP>`) as a side-channel oracle. By observing jumps in the zombie host's IP ID counter after sending spoofed SYN packets to the target, open target ports were identified without sending a single packet from the real host IP.
* **Suricata Defensive Rule Authoring**: Written a detection signature (`fragbits:M`) to alert on fragmented probe vectors.

### 🛠️ Key Commands Executed
| Technique | Exact Command | Purpose |
| :--- | :--- | :--- |
| **Decoy Scan** | `nmap -D <DECOY_IP_1>,<DECOY_IP_2>,ME <TARGET_IP>` | Hides scan traffic inside background noise. |
| **Fragmented Probes** | `nmap -f <TARGET_IP>` | Splits TCP headers across 8-byte datagrams. |
| **Data Padding** | `nmap --data-length 50 <TARGET_IP>` | Adds 50 random bytes to bypass length signatures. |
| **Idle / Zombie Scan** | `nmap -sI <ZOMBIE_IP> <TARGET_IP>` | Bounces scan off an idle side-channel host. |

### 🏆 Badges & Verification
* **Checkpoints Completed**: Task 61 (*Ghost Source*), Task 62 (*Log Hunter*), Task 63 (*Fragmenter*), Task 64 (*Comparative Analyst*), AT55 (*Packet Padder*), AT56 (*Rule Smith*).

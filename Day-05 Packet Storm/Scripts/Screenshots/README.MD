# Operation Packet Storm: Day 5 - Network Traffic Analysis & Automation

## Project Overview
This project focuses on translating theoretical networking principles into practical, hands-on Security Operations Center (SOC) capabilities. The objective was to analyze raw network traffic to detect anomalies, understand protocol behaviors on the wire, and map internal network topologies using automated reconnaissance tools.

## Mission Objectives Achieved
*   **Network Topology Discovery:** Mapped live hosts and identified listening services using `nmap` and `ss` utilities.
*   **Packet Capture & Handshake Analysis:** Utilized `tcpdump` to intercept and analyze the TCP three-way handshake (SYN, SYN-ACK, ACK) and protocol interactions between a Kali Linux attack machine and a Windows target.
*   **Suspicious Connection Detection:** Simulated and successfully captured an unauthorized outbound C2 beacon connecting over a non-standard port.
*   **Service Fingerprinting:** Conducted deep-level version detection on active endpoints to identify high-risk exposed services (e.g., SMB/Port 445, RDP/Port 3389).
*   **Automation:** Engineered a custom Bash script (`network_mapper.sh`) to automate ICMP sweeps and service version detection across internal subnets.

## Challenges Faced & Resolved

**Challenge:** 
During the initial network discovery and TCP handshake capture phases, I encountered a 100% packet loss error and connection refusals when attempting to ping and connect to the Windows 11 target VM from the Kali Linux attack machine.

**Resolution:** 
I isolated the issue to virtual network configurations and host-based firewall restrictions. I performed the following remediation steps to successfully establish the connection:
1. Validated the VirtualBox Host-Only network adapter settings to ensure both VMs were operating on the same subnet (`192.168.56.0/24`).
2. Identified that SMB (Port 445) was disabled on the Windows 11 target and manually enabled the service.
3. Adjusted the Windows Defender Firewall rules to explicitly allow inbound ICMP echo requests and TCP traffic over port 445. 
*Result:* These adjustments restored full connectivity, allowing for accurate packet capture and vulnerability simulation.

## Key Artifacts
*   **`network_mapper.sh`**: Automated network discovery Bash script.
*   **`Day5_Submission_Report.docx`**: Comprehensive documentation of network topology, protocol characteristics, and service fingerprinting matrices.
*   **`Screenshots/`**: Visual evidence of packet captures, command execution, and automated script outputs.

## Security Takeaways
Understanding network traffic at the packet level is critical for effective incident response. While attackers can manipulate endpoint logs, raw PCAP data provides an immutable record of network activity. By identifying baseline protocol characteristics, I can accurately detect data exfiltration attempts (e.g., oversized ICMP payloads, DNS tunneling) and internal reconnaissance scanning.

# Day 6: Passive Reconnaissance & Active Network Mapping 🔍

> **Author:** Mustafa Firojbhai Saherwala

## 🔒 OPSEC Disclaimer
> **Security Mindset Note:** In adherence to strict Operational Security (OPSEC) principles and best practices, raw screenshots containing actual target IPs, internal network configurations, and live enumeration data have been intentionally omitted from this public repository. All logs, IP addresses, and command outputs below have been sanitized (e.g., using `[TARGET_IP]` or `[DOMAIN]`) to prevent the exposure of sensitive infrastructure while still demonstrating technical methodology.

---

## 🎯 Objective
The primary goal of Day 6 was to establish target visibility by simulating the initial phases of a cyber engagement. This involved gathering open-source intelligence (OSINT) without touching the target, utilizing OSINT tools like `theHarvester`, and subsequently shifting to active scanning methodologies to enumerate a live environment. 

## 📝 Task Breakdown & Deliverables

### Task 6.1: WHOIS/DNS Passive Reconnaissance
Established an initial footprint of the target domain without generating alertable traffic on the target's infrastructure.
*   **WHOIS:** Extracted domain registrar information, creation/expiry dates, and administrative contact details.
*   **DNS Enumeration:** Utilized `nslookup` and `dig` to map out Mail Exchange (MX) records and authoritative name servers to understand the target's external routing.

### Task 6.2: Network Mapping Outputs
Transitioned from passive OSINT to active scanning against a controlled local Windows VM target to identify live hosts and open ports.

**Sanitized Nmap Command & Output:**
```bash
# Executing a stealth SYN scan with service enumeration and OS detection across all ports
$ nmap -sS -sV -O -p- -T4 [TARGET_VM_IP]

Starting Nmap 7.93 ( [https://nmap.org](https://nmap.org) ) 
Nmap scan report for [TARGET_VM_IP]
Host is up (0.0012s latency).
Not shown: 65531 closed tcp ports (reset)

PORT     STATE SERVICE       VERSION
135/tcp  open  msrpc         Microsoft Windows RPC
139/tcp  open  netbios-ssn   Microsoft Windows netbios-ssn
445/tcp  open  microsoft-ds  Microsoft Windows Server 2008 R2 - 2012 microsoft-ds
3389/tcp open  ms-wbt-server Microsoft Terminal Services

MAC Address: [SANITIZED_MAC] (Oracle VirtualBox virtual NIC)
Device type: general purpose
Running: Microsoft Windows 10
OS CPE: cpe:/o:microsoft:windows_10
OS details: Microsoft Windows 10 1709 - 1909
Network Distance: 1 hop

### Task 6.3: Service Enumeration Report
Interpreted the raw Nmap data to identify potential attack vectors and vulnerabilities based on the exposed services.

| Port / Protocol | Service Name | State | Security Implication / Analyst Note |
| :--- | :--- | :--- | :--- |
| **135 / TCP** | MS-RPC | Open | Often targeted for lateral movement or endpoint enumeration. |
| **139 / TCP** | NetBIOS-SSN | Open | Used for file/printer sharing; can leak system information. |
| **445 / TCP** | SMB | Open | Highly vulnerable if unpatched (e.g., EternalBlue). Key target for ransomware propagation. |
| **3389 / TCP** | RDP (Terminal) | Open | Allows remote desktop access. Should be monitored for brute-force attempts or restricted via VPN. |

### Task 6.4: theHarvester Output
Deployed `theHarvester` to scrape public sources (search engines, LinkedIn, Shodan) for exposed email addresses, subdomains, and employee names. 

**Sanitized Command & Output:**
```bash
$ theHarvester -d [TARGET_DOMAIN].com -b google,linkedin

[*] Target: [TARGET_DOMAIN].com
[*] Searching Google...
[*] Searching LinkedIn...

[*] Emails found:
    admin@[TARGET_DOMAIN].com
    hr@[TARGET_DOMAIN].com
    it_support@[TARGET_DOMAIN].com

[*] Hosts found:
    vpn.[TARGET_DOMAIN].com: [SANITIZED_IP]
    mail.[TARGET_DOMAIN].com: [SANITIZED_IP]

### Task 6.5: Complete Reconnaissance Report
Compiled all findings from the passive (WHOIS, DNS, `theHarvester`) and active (Nmap) phases into a structured professional report. The analysis concluded that the target environment possesses significant external footprint exposure alongside internal network attack surfaces primarily centered around Windows file sharing and remote management protocols.

## 🚧 Challenges Faced & Overcome
*   **VM Performance Bottlenecks:** Initially, the scanning tools and hypervisor were lagging due to disk I/O limitations. 
    *   *Solution:* Migrated the Virtual Machines to a faster storage drive, optimizing lab performance and drastically reducing Nmap scan times.
*   **Target Reachability:** Initial attempts to scan the target resulted in failed routing between the attacking machine and the Windows VM.
    *   *Solution:* Troubleshot VirtualBox network adapter settings, ensuring both machines were properly bridged/NAT-networked to allow direct communication.
*   **Firewall Interference:** Standard Nmap scans initially returned host errors despite the target running locally.
    *   *Solution:* Identified that the Windows Defender Firewall was dropping standard ICMP echo requests. Adapted the scanning strategy using the `-Pn` flag (treat all hosts as online) to successfully bypass the block and map the services.

## 🧠 Lessons Learned
*   **The Line Between Passive and Active:** Gained a practical understanding of how passive recon leaves zero footprint on the target's logs, whereas active scanning is highly noisy and requires careful execution to avoid immediate detection by a SOC.
*   **Infrastructure is Foundational:** Security tools are only as good as the infrastructure they run on. Troubleshooting VM networking and storage performance is a critical skill for any security analyst.
*   **Interpreting "Failure":** A failed ping or a dropped packet isn't an error; it's intelligence. It indicates how the target's firewall is configured, requiring the analyst to adapt their methodology.
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Nmap done: 1 IP address (1 host up) scanned in 24.45 seconds

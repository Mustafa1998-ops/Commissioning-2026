# Day 20: The Elevator — Privilege Escalation (Linux & Windows)

## 📝 Overview
This project covers cross-platform privilege escalation techniques, transitioning from initial low-level access to full system compromise (SYSTEM on Windows, `root` on Linux). The assessment explores multiple misconfigurations, including vulnerable services, improper file permissions, and unpatched kernel vulnerabilities like CVE-2021-3156 (Baron Samedit).

*Note: Target IP addresses and specific credentials have been completely redacted in adherence to a security-first mindset.*

## 🎯 Objectives Completed
*   **Windows Escalation (PowerUp):** Utilized `PowerUp.ps1` to automate the discovery of local Windows misconfigurations. Identified and exploited an Unquoted Service Path (`C:\Program Files\MyApp\My Service.exe`) to create a new service and achieve `NT AUTHORITY\SYSTEM` access.
*   **Windows Escalation (JuicyPotato):** Exploited COM (Component Object Model) abuse using `JuicyPotato.exe` to escalate from a standard service account to full `SYSTEM` privileges.
*   **Linux Escalation (SUID & Sudo):** Enumerated Linux systems for SUID misconfigurations and discovered a vulnerable `/usr/bin/find` binary. Leveraged a `sudo -l` misconfiguration (NOPASSWD) to spawn a root shell via the `find` executable.
*   **Linux Kernel Exploitation:** Identified an outdated Ubuntu kernel (5.4.0-91) vulnerable to CVE-2021-3156 (Baron Samedit). Downloaded the C-based exploit, compiled it using `gcc`, and executed it to trigger a sudo heap overflow, granting root access.
*   **Escalation Documentation:** Documented the exact commands, timestamps, and findings for both Windows and Linux escalation paths to simulate professional penetration testing reporting standards.

## 🧠 What I Learned
During this hands-on lab, I reinforced several critical post-exploitation concepts:
*   **Windows Service Weaknesses:** I learned how spaces in file paths without surrounding quotes (Unquoted Service Paths) can allow attackers to hijack service execution flows and run malicious executables with system-level privileges.
*   **Linux Binary Abuse:** I gained practical experience abusing SUID bits and overly permissive `sudo` rights on native binaries (like `find`), emphasizing the principle of least privilege.
*   **Kernel Exploit Mechanics:** I learned how to move beyond simple misconfigurations by identifying missing patches, downloading raw exploit code, and compiling it directly on the target machine for local privilege escalation.
*   **The Value of Documentation:** I recognized that successfully compromising a machine is only half the job; meticulously documenting the exact steps and timeline is critical for remediation and reporting.

## 🛠️ Tools & Technologies
*   **PowerUp.ps1:** PowerShell script for Windows privilege escalation enumeration.
*   **JuicyPotato:** Exploit tool for Windows token privileges and COM abuse.
*   **Native Linux Binaries:** Leveraged `find` and `sudo` for living-off-the-land (LotL) escalation.
*   **GCC (GNU Compiler Collection):** Used for compiling raw exploit code (`CVE-2021-3156`) directly on the target.

## 🔍 Key Findings & Analysis
*   **Unquoted Service Path:** The presence of spaces in the `MyApp` service binary path combined with writable directory permissions allowed for arbitrary executable injection on the Windows target.
*   **Excessive Sudo Permissions:** The Linux target allowed the standard user to execute `/usr/bin/find` as root without a password, directly leading to an unrestricted root shell.
*   **Missing Critical Patches:** The Linux target remained vulnerable to a high-severity sudo heap overflow flaw (CVE-2021-3156), allowing reliable privilege escalation without requiring existing sudo rights.
*   **System Promotion:** Successfully completing these local privilege escalation tasks resulted in a rank promotion to GUNNERY SERGEANT, marking a high level of proficiency across both operating systems.

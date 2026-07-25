# Day 21: The Backdoor — Persistence Mechanisms

## 📝 Overview
This project focuses on the art of maintaining access to compromised systems through various persistence mechanisms across both Windows and Linux environments. It also covers the critical defensive skills needed to detect these backdoors using logging tools like Sysmon and auditd, as well as the remediation steps required to completely remove them.

*Note: Target IP addresses and specific credentials have been completely redacted in adherence to a security-first mindset.*

## 🎯 Objectives Completed
*   **Windows Persistence:** Simulated attacker behavior by creating a Registry Run key (`HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run`), setting up a scheduled task (`schtasks`), and creating a WMI Event Subscription to persistently execute a malicious payload (`C:\malware.exe`).
*   **Linux Persistence:** Established persistent access on Linux by adding a malicious entry to `/etc/crontab`, appending a new SSH key to `~/.ssh/authorized_keys`, and creating a persistent systemd service (`backdoor.service`).
*   **Active Detection:** Monitored the environment using a Detection Dashboard, successfully identifying Windows persistence via Sysmon (Event ID 13 for registry modifications and Event ID 1 for scheduled tasks/WMI) and Linux persistence via auditd alerts (syscall 2 for file modifications).
*   **Persistence Remediation:** Executed a full cleanup operation by identifying and removing all injected persistence mechanisms, including deleting the registry keys, removing the scheduled tasks, and wiping the malicious cron and SSH entries.

## 🧠 What I Learned
During this hands-on lab, I reinforced several critical offensive and defensive security concepts:
*   **Windows Autostart Execution:** I learned how attackers abuse native Windows features—like the Registry, Task Scheduler, and WMI—to ensure their malware survives system reboots and remains hidden.
*   **Linux "Set It and Forget It" Backdoors:** I gained practical experience with Linux persistence, understanding how cron jobs, systemd services, and SSH keys act as reliable, low-noise backdoors for threat actors.
*   **Telemetry and Detection:** I learned the immense value of endpoint telemetry. I saw firsthand how tools like Sysmon and auditd function as the "eyes and ears" of a defender, capturing exactly when and where a persistence mechanism is planted.
*   **Thorough Eradication:** I recognized that kicking an attacker out once is not enough; true remediation requires hunting down and destroying every backdoor they left behind to prevent re-entry.

## 🛠️ Tools & Technologies
*   **Windows Native Tools:** PowerShell, Task Scheduler (`schtasks`), Windows Management Instrumentation (WMI), and Registry Editor.
*   **Linux Native Tools:** `cron`, `systemd`, and SSH.
*   **Sysmon:** Advanced Windows system monitor used for endpoint detection.
*   **auditd:** Linux auditing framework used to monitor file and system call changes.

## 🔍 Key Findings & Analysis
*   **Silent Execution:** The assessment demonstrated that without proper logging tools like Sysmon or auditd, sophisticated persistence mechanisms (especially WMI subscriptions and systemd services) can remain completely invisible to standard users.
*   **System Promotion:** Successfully completing Phase 3 (Days 19-21) by mastering cross-platform persistence, detection, and remediation resulted in a rank promotion to MASTER SERGEANT.

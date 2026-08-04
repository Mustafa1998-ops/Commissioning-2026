# Day 36: The Red Team Commander — Red Team Methodology

## 📝 Overview
A Red Team thinks like the enemy—planning, executing, and adapting. This module shifts focus to advanced adversary simulation, covering the setup of Command & Control (C2) infrastructure using Sliver, generating stealthy payloads, emulating specific Advanced Persistent Threats (APTs), and applying Operational Security (OpSec) evasion techniques.

*Note: Target IP addresses and sensitive identifiers have been redacted from configurations (e.g., `[REDACTED_IP]`) to adhere to strict operational security guidelines.*

---

## 🎯 Objectives Completed
* **Sliver C2 Setup (Task 145):** Installed and configured the Sliver C2 framework, establishing an active HTTPS listener on port 443 to receive remote callbacks.
* **Payload Generation (Task 146):** Generated a Windows x64 HTTP beacon payload (`payload.exe`), executed it on the target system, and successfully captured the remote session callback.
* **OpSec: Sleep & Jitter (Task 147):** Configured beacon check-in intervals with sleep commands and randomized jitter (20%) to blend malicious traffic with normal network noise and evade detection.
* **APT Emulation (Task 148):** Successfully emulated techniques utilized by APT29 (Cozy Bear), specifically executing T1059 (PowerShell), T1047 (WMI), T1071 (C2 Channels), and T1003 (Credential Dumping).
* **Domain Fronting (AT97):** Configured C2 traffic to route through a legitimate CDN domain (`cdn.cloudfront.net`) to obfuscate the true destination of the callbacks.

---

## 🧠 What I Learned
* **C2 Infrastructure:** Frameworks like Sliver manage compromised hosts via beacons—payloads that execute on the target and periodically "check in" for new instructions.
* **Operational Security (OpSec):** Static beacon intervals are easily flagged by network defenders. Introducing sleep timers and jitter randomizes the callback frequency, making the traffic appear organic.
* **Domain Fronting:** By leveraging high-reputation Content Delivery Networks (CDNs), attackers can hide their C2 traffic, tricking defenders into seeing connections to trusted services rather than malicious infrastructure.
* **Threat Emulation:** Utilizing the MITRE ATT&CK framework allows Red Teams to accurately map and replicate the Tactics, Techniques, and Procedures (TTPs) of specific threat actors like APT29.

---

## 🛠️ Toolset & Command Reference

| Tool / Command | Purpose |
| :--- | :--- |
| **`sliver-server`** | Initializes the Sliver Command & Control (C2) server. |
| **`generate --http`** | Generates an HTTP-based payload to establish a C2 session. |
| **`beacon --sleep 60 --jitter 20`** | Configures the active beacon to sleep for 60 seconds with a 20% timing variance. |
| **MITRE ATT&CK T1059 / T1047** | Framework IDs corresponding to PowerShell execution and Windows Management Instrumentation (WMI). |
| **Domain Fronting** | Routing C2 traffic through trusted CDNs to mask the true destination. |

---

## 🔍 Key Findings & Analysis
* **Successful Compromise:** The generated 245 KB payload executed successfully, providing a reverse callback from `[REDACTED_IP]` and opening an active `windows/amd64` session.
* **Evasion Verified:** Implementing a 60-second sleep with 20% jitter and routing traffic via `cdn.cloudfront.net` effectively masked the C2 connection, disguising the callback as standard HTTPS web traffic.
* **System Promotion:** Successfully establishing C2 infrastructure, emulating APT29, and executing advanced OpSec techniques resulted in a promotion to the rank of **MAJOR**.

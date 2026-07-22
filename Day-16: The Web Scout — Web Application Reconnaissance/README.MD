## 📅 Day 16: The Web Scout — Web Application Reconnaissance

### 📌 Overview
Day 16 covered structured web application mapping prior to exploitation—focusing on directory brute-forcing, technology stack fingerprinting, parameter fuzzing, and specialized CMS enumeration.

### 🔬 Technical Deep-Dive & Lab Execution
* **Target Environment Setup**: Configured a local instance of **Damn Vulnerable Web App (DVWA)** running on Apache2, MySQL, and PHP 7.4 on Ubuntu.
* **Directory Busting**: Used **Gobuster** to discover unlinked directories, locating critical directories like `/admin/`, `/config/`, `/includes/`, and `/images/`.
* **Technology Fingerprinting**: Employed **WhatWeb** to parse response headers, identifying Apache 2.4.41, PHP 7.4.3, and underlying operating system signatures.
* **Parameter Fuzzing (`ffuf`)**: Sent wordlists against request parameters (`?FUZZ=id`) to identify hidden or poorly validated input vectors based on HTTP response length anomalies.
* **CMS & Vulnerability Scanning**: Ran **Nikto** for general HTTP server misconfigurations (e.g., directory indexing enabled, missing security headers) and **WPScan** to audit WordPress installations for known plugin vulnerabilities.
* **Robots.txt Analysis**: Extracted disallowed paths including sensitive endpoints such as `/.git/` and `/backup/`.

### 🛠️ Key Commands Executed
| Tool | Exact Command | Purpose |
| :--- | :--- | :--- |
| **Gobuster** | `gobuster dir -u http://<DVWA_IP>/DVWA/ -w directory-list-2.3-small.txt` | Brute-forces hidden web paths and files. |
| **WhatWeb** | `whatweb http://<DVWA_IP>/DVWA` | Fingerprints web server technologies and versions. |
| **ffuf** | `ffuf -u http://<DVWA_IP>/DVWA/vulnerabilities/exec/?FUZZ=id -w params.txt` | Fuzzes HTTP parameters for anomalies. |
| **Nikto** | `nikto -h http://<DVWA_IP>/DVWA` | Audits web server configurations & known vulnerabilities. |
| **WPScan** | `wpscan --url http://<WP_IP>/wordpress` | Enumerates WordPress plugins, themes, and users. |

### 🏆 Badges & Verification
* **Checkpoints Completed**: Task 65 (*Range Builder*), Task 66 (*Directory Scout*), Task 67 (*Tech Detective*), Task 68 (*Fuzz Master*), AT57 (*Vuln Sweeper*), AT58 (*CMS Hunter*).

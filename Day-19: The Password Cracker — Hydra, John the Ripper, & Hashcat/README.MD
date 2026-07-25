# Day 19: The Password Cracker — Hydra, John the Ripper, & Hashcat

## 📝 Overview
This project explores various password cracking techniques, including online brute-forcing, offline hash cracking, GPU-accelerated cracking, and custom wordlist generation. The assessment demonstrates how attackers compromise credentials across different services and highlights the importance of strong password policies and modern hashing algorithms.

*Note: Target IP addresses and specific credentials have been completely redacted in adherence to a security-first mindset.*

## 🎯 Objectives Completed
*   **Online Brute Force (Hydra):** Executed online dictionary attacks against live RDP and SSH services on a target (`[REDACTED IP]`) using the `rockyou.txt` wordlist to successfully discover valid administrative credentials.
*   **Offline Hash Cracking (John the Ripper):** Cracked NTLM and Linux shadow password hashes offline using John the Ripper, demonstrating CPU-based wordlist attacks against extracted credential files.
*   **GPU-Accelerated Cracking (Hashcat):** Utilized Hashcat to leverage GPU parallel processing (simulated NVIDIA CUDA) for high-speed offline cracking of NTLM hashes, drastically reducing the time required compared to CPU-only methods.
*   **Custom Wordlist Generation (CeWL):** Spidered a target web application (DVWA at `[REDACTED IP]`) to scrape text and dynamically generate a highly targeted wordlist of 20 words for use in customized dictionary attacks.

## 🧠 What I Learned
During this hands-on lab, I reinforced several critical offensive security and identity concepts:
*   **Attack Vectors:** I learned to differentiate between online attacks (which are rate-limited, noisy, and target live services like RDP/SSH) and offline attacks (which are stealthy, target extracted hash files, and are limited only by hardware speed).
*   **Hardware Impact:** I observed the massive speed advantage of GPU acceleration (Hashcat operating at billions of attempts per second) over traditional CPU cracking (John the Ripper) for offline hash cracking.
*   **Wordlist Relevance:** I learned that while massive, generic lists like `rockyou.txt` are effective against default or common passwords, custom-generated wordlists (using CeWL) are essential for highly specific, targeted attacks against organizations.
*   **Cryptography Weaknesses:** I gained practical experience recognizing and cracking standard hash formats (NTLM, SHA512crypt), reinforcing why fast hashing algorithms without proper salting are vulnerable.

## 🛠️ Tools & Technologies
*   **Hydra:** A fast, parallelized network logon cracker for online brute-forcing.
*   **John the Ripper:** An offline, CPU-based password cracking software tool.
*   **Hashcat:** An advanced, highly optimized, GPU-accelerated password recovery utility.
*   **CeWL:** A Custom Word List generator that spiders websites to extract relevant terms.

## 🔍 Key Findings & Analysis
*   **Weak Service Credentials:** Both RDP and SSH services were successfully breached using standard dictionary lists, highlighting the severe risk of leaving weak, common passwords on exposed administrative interfaces.
*   **Hash Vulnerability:** Extracted NTLM and shadow hashes were rapidly reversed to plaintext (`[REDACTED PASSWORD]`) using both CPU and GPU resources.
*   **System Promotion:** Successfully completing these password cracking and wordlist generation tasks resulted in a rank promotion to STAFF SERGEANT, equipping me for the upcoming Phase 3 modules focused on Privilege Escalation, Lateral Movement, and Advanced Persistence.

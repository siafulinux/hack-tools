# Offensive Tools Installation Script

### Overview

This script is designed to automate the installation of essential "offensive tools" for penetration testing, ethical hacking, password cracking, blue teaming, red teaming, and related activities. It has been tested on Debian 12 but should work on similar Debian-based distributions.

Additionally, the script sets up a monthly cron job to keep installed tools updated automatically.

<img src='https://github.com/siafulinux/hack-tools/blob/main/Hack%20Tools.png'></img>

### Disclaimer

By using this script, you acknowledge that you are fully responsible for any potential damage, failures, or issues that may arise from using or installing the tools. I am not responsible for any data loss, system instability, or other adverse effects caused by running this script. Use at your own risk.

### Requirements

  * Debian 12 (tested, but other Debian-based distributions may work)
  * Root privileges for installation and cron job setup

### Installation
    git clone https://github.com/siafulinux/hack-tools.git
    cd hack-tools
    chmod +x install_hack_tools.sh
    sudo ./install_hack_tools.sh


<img src='https://github.com/siafulinux/hack-tools/blob/main/Hack%20Tools%202.png'></img>

## Applications installed:

### PRIVACY

  * Proxychains
  * TOR
  
### SCANNING

  * nmap

### EXPLOITING

  * MetaSploit
  * Nikto
  * GoBuster

### PASSWORD CRACKING

  * Hashid
  * Hashcat
  * John the Ripper

### WEB HACKING

  * BurpSuite
  * SQLmap
  * Hydra

### WIFI / PACKET SNIFFING

  * Wireshark
  * TShark
  * Bettercap
  * Aircrack-ng
  * Wifite

### OSINT

  * Sherlock
  * theHarvester
  * Recon-ng

### SOCIAL ENGINEERING

  * Penetration Tool Kit

# Wordlists

  * SecLists
  * DirBuster
  * usernames.txt
  * rockyou.txt



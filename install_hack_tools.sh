#!/bin/bash

clear
echo -e "\e[1;31m  _    _            _      _______          _     \e[0m"
echo -e "\e[1;32m | |  | |          | |    |__   __|        | |    \e[0m"
echo -e "\e[1;33m | |__| | __ _  ___| | __    | | ___   ___ | |___ \e[0m"
echo -e "\e[1;34m |  __  |/ _\` |/ __| |/ /    | |/ _ \ / _ \| / __|\e[0m"
echo -e "\e[1;35m | |  | | (_| | (__|   <     | | (_) | (_) | \__ \\e[0m"
echo -e "\e[1;36m |_|  |_|\__,_|\___|_|\_\    |_|\___/ \___/|_|___/\e[0m"



echo -e "\n"
echo "This script is designed to automate the installation of essential \"offensive tools\" for penetration testing, ethical hacking, password cracking, blue teaming, red teaming, and related activities. It has been tested on Debian 12 but should work on similar Debian-based distributions.

Additionally, the script sets up a monthly cron job to keep installed tools updated automatically.

Disclaimer

By using this script, you acknowledge that you are fully responsible for any potential damage, failures, or issues that may arise from using or installing the tools. I am not responsible for any data loss, system instability, or other adverse effects caused by running this script. Use at your own risk."
echo -e "\n"

read -rp "Press Enter to continue..."

# SET ORIGINAL DIRECTORY TO GO BACK TO FOR CLEANUP AFTER
original_directory=$(pwd)






# Run as root
clear
echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Checking${RESET} if you are running as root."
sleep 2

if [[ ${EUID} -ne 0 ]]; then
        echo -e ' '${RED}'[!]'${RESET}" This script must be ${RED}run as root${RESET}..." 1>&2
        sudo su -
        #exit 1
else
    echo -e " ${BLUE}[*]${RESET} ${BOLD}Tools post fresh install ${RESET}"
fi


# Update and upgrade the system
echo "Updating and upgrading the system..."
clear
#echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Updating and upgrading${RESET} the system."
#sleep 2

echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Updating system...${RESET}"
apt -y -qq update || echo -e ' '${RED}'[!] Issue with apt'${RESET} 1>&2
sleep 2

echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Upgrading system...${RESET}"
apt -y -qq dist-upgrade || echo -e ' '${RED}'[!] Issue with apt'${RESET} 1>&2
sleep 2



# INSTALL NECESSARY FILES
#sudo apt install \
#vim tmux zsh nmap masscan onesixtyone htop ca-certificates network-manager-openvpn network-manager-pptp \
#network-manager-vpnc network-manager-openconnect gobuster network-manager-iodine hashid cewl bsdgames proxychains \
#sshuttle apt-file apt-show-versions sqlmap sqlite3 ssldump fcrackzip john hydra cewl crunch hashid \
#nasm wfuzz dmitry nfs-common hping3 ncat dnsenum binwalk smbmap gparted \
#enum4linux wireshark joomscan rubygems commix nikto exploitdb wfuzz hashcat \
#smtp-user-enum websploit amap ssldump whois socat nishang traceroute dnsutils dnsrecon







################################################
## ESSENTIAL PACKAGES
################################################


clear
echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Installing${RESET} essential packages."
sleep 2

sudo apt-get install -y curl wget apt-transport-https gnupg







################################################
## SCANNING
################################################

# nmap
AppName="nmap"
clear
if which $AppName > /dev/null; then
    echo -e "\n nmap is already installed. Skipping."
else
    echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Installing${RESET} $AppName."
    sleep 2
    sudo apt install $AppName -y || echo -e ' '${RED}'[!] Issue with apt'${RESET} 1>&2
fi



################################################
## EXPLOITING
################################################


# Metasploit
AppName="msfconsole"
clear
if which $AppName > /dev/null; then
    echo -e "\n Metasploit is already installed. Skipping."
    sleep 1
else
    echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Installing${RESET} MetaSploit"
    sleep 2

    curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
    chmod 755 msfinstall
    ./msfinstall
    rm msfinstall
    # echo -e "\n${YELLOW} [i]${RESET} Configuring ${GREEN}Metasploit-framework${RESET}..."
    msfdb init
fi


# Nikto
AppName="nikto"
clear
if which $AppName > /dev/null; then
    echo -e "\n Nikto is already installed. Skipping."
    sleep 1
else
    echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Installing${RESET} Nikto."
    sleep 2
    sudo apt install $AppName -y || echo -e ' '${RED}'[!] Issue with apt'${RESET} 1>&2
fi




# GoBuster
AppName="gobuster"
clear
if which $AppName > /dev/null; then
    echo -e "\n GoBuster is already installed. Skipping."
    sleep 1
else
    echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Installing${RESET} GoBuster."
    sleep 2
    sudo apt install $AppName -y || echo -e ' '${RED}'[!] Issue with apt'${RESET} 1>&2
fi





################################################
## PASSWORD CRACKING
################################################

# Hashcat
AppName="hashcat"
clear
if which $AppName > /dev/null; then
    echo -e "\n Hashcat is already installed. Skipping."
    sleep 1
else
    echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Installing${RESET} Hashcat."
    sleep 2
    sudo apt install $AppName -y || echo -e ' '${RED}'[!] Issue with apt'${RESET} 1>&2
fi


# John The Ripper
AppName="john"
clear
if which $AppName > /dev/null; then
    echo -e "\n John the Ripper is already installed. Skipping."
    sleep 1
else
    echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Installing${RESET} John The Ripper."
    sleep 2
    sudo apt install $AppName -y || echo -e ' '${RED}'[!] Issue with apt'${RESET} 1>&2
fi





################################################
## WEB HACKING
################################################


# BurpSuite
AppName="BurpSuiteCommunity"
clear
if which $AppName > /dev/null; then
    echo -e "\n Burpsuite is already installed. Skipping."
    sleep 1
else
    echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Installing${RESET} BurpSuite."
    sleep 2

    curl -L "https://portswigger-cdn.net/burp/releases/download?product=community&version=2025.1&type=Linux" -o burpsuite_community_2025.1_linux.tar
    chmod +x burpsuite_community*.tar
    rm -r ./burpsuite_community*.tar
fi


# SQLmap
AppName="sqlmap"
clear
if which $AppName > /dev/null; then
    echo -e "\n SQLmap is already installed. Skipping."
    sleep 1
else
    echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Installing${RESET} SQLmap."
    sleep 2
    sudo apt install $AppName -y || echo -e ' '${RED}'[!] Issue with apt'${RESET} 1>&2
fi


# Hydra
AppName="hydra"
clear
if which $AppName > /dev/null; then
    echo -e "\n Hydra is already installed. Skipping."
    sleep 1
else
    echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Installing${RESET} Hydra."
    sleep 2
    sudo apt install $AppName -y || echo -e ' '${RED}'[!] Issue with apt'${RESET} 1>&2
fi






################################################
## WIFI / PACKET SNIFFING
################################################


# Wireshark
AppName="wireshark"
clear
if which $AppName > /dev/null; then
    echo -e "\n Wireshark is already installed. Skipping."
    sleep 1
else
    echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Installing${RESET} Wireshark."
    sleep 2

    sudo apt install $AppName -y || echo -e ' '${RED}'[!] Issue with apt'${RESET} 1>&2
    #sudo usermod -aG $AppName $(whoami)
fi


# TShark
AppName="tshark"
clear
if which $AppName > /dev/null; then
    echo -e "\n TShark is already installed. Skipping."
    sleep 1
else
    echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Installing${RESET} TShark"
    sleep 2

    sudo apt install $AppName -y || echo -e ' '${RED}'[!] Issue with apt'${RESET} 1>&2
    #sudo usermod -aG $AppName $(whoami)
fi


# Bettercrap
AppName="bettercap"
clear
if which $AppName > /dev/null; then
    echo -e "\n Bettercap is already installed. Skipping."
    sleep 1
else
    echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Installing${RESET} Bettercap."
    sleep 2
    sudo apt install $AppName -y || echo -e ' '${RED}'[!] Issue with apt'${RESET} 1>&2
fi


# Aircrack-ng
AppName="aircrack-ng"
clear
if which $AppName > /dev/null; then
    echo -e "\n Aircrack-ng is already installed. Skipping."
    sleep 1
else
    echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Installing${RESET} Aircrack-ng."
    sleep 2
    sudo apt install $AppName -y || echo -e ' '${RED}'[!] Issue with apt'${RESET} 1>&2
fi



# Wireshark
AppName="wifite"
clear
if which $AppName > /dev/null; then
    echo -e "\n Wifite is already installed. Skipping."
    sleep 1
else
    echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Installing${RESET} Wifite."
    sleep 2

    sudo apt install $AppName -y || echo -e ' '${RED}'[!] Issue with apt'${RESET} 1>&2
    sudo usermod -aG $AppName $(whoami)
fi




################################################
## OSINT
################################################

# Sherlock
AppName="sherlock"
clear
if which $AppName > /dev/null; then
    echo -e "\n Sherlock is already installed. Skipping."
    sleep 1
else
    echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Installing${RESET} Sherlock."
    sleep 2
    sudo apt install $AppName -y || echo -e ' '${RED}'[!] Issue with apt'${RESET} 1>&2
fi



# theHarvester
clear
if [ -e "/etc/theHarvester/theHarvester.py" ]; then
    echo -e "\n theHarvester is already installed. Skipping."
    sleep 1
else
    clear
    echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Installing${RESET} theHarvester."
    sleep 2

    git clone -q https://github.com/laramies/theHarvester
    cd theHarvester
    python3 -m venv myenv
    source myenv/bin/activate
    python3 -m pip install -r requirements/base.txt
    cd ..
    mv theHarvester /etc/theHarvester
    echo 'export PATH="$PATH:/etc/theHarvester"' >> ~/.bashrc
    source ~/.bashrc
fi


# Recon-ng
AppName="recon-ng"
clear
if which $AppName > /dev/null; then
    echo -e "\n Recon-ng is already installed. Skipping."
    sleep 1
else
    echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Installing${RESET} Recon-ng."
    sleep 2
    sudo apt install $AppName -y || echo -e ' '${RED}'[!] Issue with apt'${RESET} 1>&2
fi








################################################
## WORDLISTS
################################################

echo -e "\n Installing ${GREEN}wordlists${RESET}; this might take a while!"




# SecLists
clear
if [ -e "/usr/share/wordlists/SecLists" ]; then
    echo -e "\n SecList wordlist is already installed. Skipping."
    sleep 1
else
    echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Installing${RESET} SecLists wordlist."
    sleep 2

    wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O /usr/share/wordlists/SecList.zip
    cd /usr/share/wordlists/
    unzip -o /usr/share/wordlists/SecList.zip
    mv SecLists-master SecLists
    rm -f /usr/share/wordlists/SecList.zip
    cd ~
fi



# wordlists from dirbuster
clear
if [ -d "/usr/share/wordlists/dirbuster" ]; then
    echo -e "\n DirBuster wordlist is already installed. Skipping."
    sleep 1
else
    echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Installing${RESET} DirBuster wordlists."
    sleep 2

    mkdir -p /usr/share/wordlists/dirbuster
    git clone -q https://github.com/daviddias/node-dirbuster /usr/share/wordlists/dirbuster-git
    mv /usr/share/wordlists/dirbuster-git/lists/* /usr/share/wordlists/dirbuster
    rm -rf /usr/share/wordlists/dirbuster-git

    git clone -q https://github.com/digination/dirbuster-ng /usr/share/wordlists/dirbuster-git
    mkdir -p /usr/share/wordlists/dirbuster
    mv /usr/share/wordlists/dirbuster-git/wordlists/* /usr/share/wordlists/dirbuster/
    rm -rf /usr/share/wordlists/dirbuster-git
fi



# usernames.txt
clear
if [ -e "/usr/share/wordlists/usernames.txt" ]; then
    echo -e "\n usernames.txt wordlist is already installed. Skipping."
    sleep 1
else
    echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Installing${RESET} usernames wordlist."
    sleep 2

    cd /usr/share/wordlists/
    wget -c "https://raw.githubusercontent.com/jeanphorn/wordlist/master/usernames.txt"
    sed -ie "s/\r//g" usernames.txt
fi



# rockyou
clear
if [ -e "/usr/share/wordlists/rockyou.txt" ]; then
    echo -e "\n rockyou.txt wordlist is already installed. Skipping."
    sleep 1
else
    echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Installing${RESET} rockyou.txt wordlist."
    sleep 2

    wget -qc https://github.com/praetorian-code/Hob0Rules/raw/master/wordlists/rockyou.txt.gz -O /usr/share/wordlists/rockyou.txt.gz
    gzip -dc < /usr/share/wordlists/rockyou.txt.gz > /usr/share/wordlists/rockyou.txt
    rm -rf /usr/share/wordlists/rockyou.txt.gz
fi



# SET WORDLIST PERMISSIONS
clear
echo -e -e "\n ${GREEN}[+]${RESET} ${GREEN}Setting${RESET} wordlist permissions."
sleep 2

find /usr/share/wordlists/ -exec chown -v -R ${user}:${user} {} +
find ${optdir}/impacket -exec chown -v -R ${user}:${user} {} \;
find ${optdir}/pspy -exec chown -v -R ${user}:${user} {} \;





################################################
## CLEAN THE SYSTEM
################################################
clear
echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Cleaning${RESET} left over files after install."
sleep 2

cd "$original_directory"
sudo apt autoclean
rm burpsuite_community*.tar
rm -rf theHarvester
#apt-get -y -qq purge $(dpkg -l | tail -n +6 | egrep -v '^(h|i)i' | awk '{print $2}')   # Purged packages
#--- Update slocate database
#sudo updatedb
#--- Reset folder location
cd ~




################################################
## SET UP MONTHLY UPDATES
################################################
clear
echo -e "\n ${GREEN}[+]${RESET} ${GREEN}Setting up cron job${RESET} for monthly system upgrades."
sleep 2

# Set up monthly system upgrade cron job
CRON_JOB="0 3 1 * * /usr/bin/apt update && /usr/bin/apt upgrade -y"
(crontab -l; echo "$CRON_JOB") | sort - | uniq - | crontab -
sleep 2






################################################
## DISPLAY INSTALLATION COMPLETE MESSAGE
################################################
clear
sleep 2
echo -e "\n\n Setup completed successfully! Thank you for using this script! \n\n"

#!/bin/bash
#
# Twitter.com/EidolonHost
# EidolonHost is at https://eidolonhost.com

# Pretty Colors
OK='\e[1;32m'
OK2='\e[1;36m'
OK3='\e[1;33m'
WARNING='\e[1;31m'
FAIL='\e[2;30m'
ENDC='\033[0m'

# Am I root?
if [ "x$(id -u)" != 'x0' ]; then
    echo -e "$WARNING Error: this script can only be executed by root $ENDC"
    exit 1
fi

# Check supported arch.
if [ "$(arch)" != 'x86_64' ]; then
    arch='i386'
else
    arch="amd64"
fi

# Sets up showMenu stuff.

showMenu () {
clear
echo "";
echo "[+]-----------------------------------------------------------------------------[+]"
echo -e "$OK  _|_|_| _|_|_|_| _|_|_|     _|_|  _|       _|_|  _|_|_|   $ENDC ";
echo -e "$OK  _|        _|    _|   _|  _|   _| _|     _|   _| _|       $ENDC ";
echo -e "$OK  _|_|_|    _|    _|    _| _|   _| _|     _|   _| _|_|_|   $ENDC ";
echo -e "$OK  _|        _|    _|   _|  _|   _| _|     _|   _|      _|  $ENDC ";
echo -e "$OK  _|_|_| _|_|_|_| _|_|_|    _|_|   _|_|_|  _|_|   _|_|_|   $ENDC ";
echo -e "$OK                                                           $ENDC ";
echo "[+]-----------------------------------------------------------------------------[+]"
echo " ";
echo " Welcome to EidolosScript";
echo " build 0.2 on April 17th 2015";
echo " eidolonhost.com - systems@eidolonhost.com";
echo -e "$WARNING GNU General Public License -- GPL v2 1991 — See included LICENSE. $ENDC"
echo "Current time: $(date)";
echo -e "$OK2 You are running on: $(arch), on $OS $ENDC";
echo " ";
echo -e "$OK3 InterWorx Install: $ENDC ";
echo " interworx -------------- Install latest InterWorx."
echo -e "$OK3 cPanel Install: $ENDC";
echo " cpanel -------------- Install latest cPanel."
echo " cpdnsonly ----------- Install cPanel DNSOnly."
echo " updates ------------ Updates OS, updates cPanel if applicable."
echo " ";
echo -e "$OK3 Alternative Control Panels: $ENDC ";
echo " webmin -------------- Install latest Webmin"
echo " vestacp -------------- Install latest VestaCP for Linux."
echo " ehcp -------------- Install latest EHCP for Linux."
echo " ezee -------------- Install latest Ezeelogin."
echo " ";
echo -e "$OK3 SSL Tools: $ENDC ";
echo " sslcheck -------------- Checks SSL certificates installed and helps resolve SSL installs."
echo " ";
echo -e "$OK3 CloudLinux Install: $ENDC ";
echo " regcloudlinux ------- Register with CloudLinux Network."
echo " cloudlinux ---------- Install CloudLinux on your system (License and Reboot required)."
echo " ";
echo -e "$OK3 Plugins - Addons and Secure: $ENDC ";
echo " addsec ---------- Additional Scripts for Security and Addons"
echo " exit ---------- Leave"
echo " ";
echo -n "Enter your desired function: "
}

# Does some more showMenu stuff. Not sure what this does?

while :
do
showMenu
read -r yourch
case $yourch in

# The rest of Eidolos Script!

interworx ) date
cd /home || exit
yum -y install wget perl curl
sh <((curl -sL interworx.com/inst.sh))
showMenu
;;

vestacp ) date
wget http://vestacp.com/pub/vst-install.sh
chmod +x vst-install.sh
sh vst-install.sh
showMenu
;;

ehcp ) date
wget -O ehcp.tgz www.ehcp.net/ehcp_2004.tgz
tar -zxvf ehcp.tgz
cd ehcp || exit
./install.sh
showMenu
;;

sslcheck ) date
wget https://github.com/zakjan/cert-chain-resolver/blob/master/src/cert-chain-resolver.sh
chmod +x cert-chain-resolver.sh
./cert-chain-resolver.sh
showMenu
;;

addsec ) date
sh addon.sh
showMenu
;;

cpanel ) date
cd /home || exit
yum -y install wget perl curl
sh <((curl -sL httpupdate.cpanel.net/latest))
showMenu
;;

cpdnsonly ) date
cd /home || exit
yum -y install wget perl curl
sh <((curl -sL httpupdate.cpanel.net/latest-dnsonly))
showMenu
;;

# Let's try handling updating the OSes by way of auto-detect what OS then use yum/apt accordingly.

updates ) date
if [ "$OS" == "CentOS" ]
  then
    yum update -y
/scripts/upcp --force
	else
  apt-get update -y
fi
showMenu
;;

cloudlinux ) echo -e "Installing CloudLinux. License will be activated automatically. Stand by..."
wget https://repo.cloudlinux.com/cloudlinux/sources/cln/cldeploy
sh cldeploy -i
uname -r; cat /etc/os-release
echo "Initiating reboot."
sleep 4
reboot
showMenu
;;

regcloudlinux ) echo -e "Please enter your CloudLinux key: "
read -r clkey
echo "Key entered: $clkey"
yum install rhn-setup
rhnreg_ks --activationkey="$clkey" --force
echo "Successfully Registered Your Server to CloudLinux Network (CLN)!"
sleep 5
showMenu
;;

exit ) exit
showMenu
;;

*) echo -e "$FAIL ERROR! $ENDC";
echo "Press Enter to continue..." ;
read -r ;;
esac
done

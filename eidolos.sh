#!/bin/bash
#
# Twitter.com/EidolonHost
# EidolonHost is at https://eidolonhost.com

# Pretty Colors
OK='\033[92m'
WARNING='\033[93m'
FAIL='\033[91m'
ENDC='\033[0m'

showMenu () {
clear
echo "";
echo "[+]-----------------------------------------------------------------------------[+]"
echo -e "$OK  _|_|_| _|_|_|_| _|_|_|     _|_|  _|       _|_|  _|_|_|          $ENDC ";
echo -e $OK2 "  _|        _|    _|   _|  _|   _| _|     _|   _| _|           "; $ENDC
echo -e $OK2 "  _|_|_|    _|    _|    _| _|   _| _|     _|   _| _|_|_|       "; $ENDC
echo -e $OK2 "  _|        _|    _|   _|  _|   _| _|     _|   _|      _|      "; $ENDC
echo -e $OK2 "  _|_|_| _|_|_|_| _|_|_|    _|_|   _|_|_|  _|_|   _|_|_|       "; $ENDC
echo -e $OK2 "                                                               "; $ENDC
echo "[+]-----------------------------------------------------------------------------[+]"
echo " ";
echo " Welcome to EidolosScript";
echo " build 0.1 on March 28th 2015";
echo " GNU General Public License -- GPL v2 1991"
echo " eidolonhost.com - systems@eidolonhost.com";
echo " `date`";
echo -e $OK "Updating $OS packages..." $ENDC
echo " ";
echo -e $OK "InterWorx Install:"; $ENDC
echo " interworx -------------- Install latest InterWorx."
echo -e $OK "cPanel Install:"; $ENDC
echo " cpanel -------------- Install latest cPanel." 
echo " cpdnsonly ----------- Install cPanel DNSOnly." 
echo " updates ------------ Updates OS, updates cPanel if applicable." 
echo " ";
echo -e $OK "non-cPanel and InterWorx Install:"; $ENDC
echo " webmin -------------- Install latest Webmin"
echo " vestacp -------------- Install latest VestaCP for Linux."
echo " panilux -------------- Install latest Panilux for Linux."
echo " ehcp -------------- Install latest EHCP for Linux."
echo " ipanel -------------- Install latest iPanel."
echo " ezeelogin -------------- Install latest Ezeelogin."
echo " ";
echo -e $OK "non-cPanel and InterWorx Install:"; $ENDC
echo " sslcheck -------------- Checks SSL certificates installed and helps resolve SSL installs."
echo " ";
echo -e $OK "CloudLinux Install:"; $ENDC
echo " regcloudlinux ------- Register with CloudLinux Network." 
echo " cloudlinux ---------- Install CloudLinux on your system (License and Reboot required)." 
echo " ";
echo -e $OK "Plugins - Addons and Secure:"; $ENDC
echo " addsec ---------- Additional Scripts for Security and Addons"
echo " exit ---------- Leave" 
echo " ";
echo -n "Enter your desired function: "
}


while :
do
showMenu
read yourch
case $yourch in

# Determine Distribution
if [ -f /etc/debian_version ]
  then
    ver=`cat /etc/*release | grep ^ID= | cut -d "=" -f 2`
    if [ $ver == "ubuntu" ]
      then OS="ubuntu"
    elif [ $ver == 'debian' ]
      then OS="debian"
    else
      echo -e $FAIL "Your System is Not Supported" $ENDC
      exit 1
    fi
elif [ -f /etc/redhat-release ]
  then OS="centos"
else
  echo -e $FAIL "Your System is Not Supported" $ENDC
  exit 1
fi


interworx ) date
cd /home
yum -y install wget perl 
wget -N http://interworx.com/stuff
sh latest
showMenu
;;

addsec ) date
sh addon.sh
;;

cpanel ) date
cd /home
yum -y install wget perl 
wget -N http://httpupdate.cpanel.net/latest
sh latest
showMenu
;;

cpdnsonly ) date
cd /home
wget -N http://httpupdate.cpanel.net/latest-dnsonly
sh latest-dnsonly
showMenu
;;

updates ) date
if [ $OS == "centos" ]
  then
    yum update -y
/scripts/upcp --force
	else
  apt-get update -y
fi
showMenu
;;

cloudlinux ) echo -e "Please enter your CloudLinux key: "
read clkey
echo "Key entered: $clkey"
wget http://repo.cloudlinux.com/cloudlinux/sources/cln/cpanel2cl
sh cpanel2cl -k $clkey
echo "Successfully Installed Cloudlinux, now your system is about to reboot. Rebooting in 12 seconds!"
echo "Once you have rebooted, run: /scripts/easyapache --build "
sleep 8
echo "Once done, you are running CloudLinux kernel with LVE enabled!"
sleep 4
reboot
showMenu
;;

regcloudlinux ) echo -e "Please enter your CloudLinux key: "
read clkey
echo "Key entered: $clkey"
yum install rhn-setup
rhnreg_ks --activationkey=$clkey --force
echo "Successfully Registered Your Server to CloudLinux Network (CLN)!"
sleep 5
showMenu
;;

exit ) exit
showMenu
;;

*) echo -e $FAIL "ERROR!"; $ENDC
echo "Press Enter to continue..." ; read ;;
esac
done

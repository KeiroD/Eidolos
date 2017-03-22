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

# Sets up showMenu.

showMenu () {
clear
echo "";
echo "[+]-----------------------------------------------------------------------------[+]"
echo -e "$OK  _|_|_| _|_|_|_| _|_|_|     _|_|  _|       _|_|  _|_|_|       $ENDC ";
echo -e "$OK  _|        _|    _|   _|  _|   _| _|     _|   _| _|           $ENDC ";
echo -e "$OK  _|_|_|    _|    _|    _| _|   _| _|     _|   _| _|_|_|       $ENDC ";
echo -e "$OK  _|        _|    _|   _|  _|   _| _|     _|   _|      _|      $ENDC ";
echo -e "$OK  _|_|_| _|_|_|_| _|_|_|    _|_|   _|_|_|  _|_|   _|_|_|       $ENDC ";
echo -e "$OK                                                               $ENDC ";
echo "[+]-----------------------------------------------------------------------------[+]"
echo " ";
echo " Welcome to EidolosScript Addons";
echo " build 0.2 on April 17th 2015";
echo " eidolonhost.com - systems@eidolonhost.com";
echo -e "$WARNING GNU General Public License -- GPL v2 1991 — See included LICENSE. $ENDC"
echo "Current time: $(date)";
echo -e "$OK2 Don't forget, you're on $(arch) $ENDC";
echo -e "$OK3 Plugins - Addons and Secure: $ENDC ";
echo " csf ------------ Install CSF Firewall for cPanel."
echo " htopsetup ----------- Install htop Process Viewer."
echo " logview ------------- Install logview plugin."
echo " chkrootkit ---------- Install CHKRootKit."
echo " maldetect ----------- Install Linux Malware Detect."
echo " whmsonic ------------ Install WHMSonic Plugin"
echo " fantastico ---------- Install Fantastico Plugin"
echo " softaculous --------- Install Softaculous Plugin"
echo " litespeedcp ----------- Install LiteSpeed Plugin"
echo " cleanbackup --------- Install Clean Backup Plugin."
echo " prminstall ---------- Install Process Resource Monitor."
echo " siminstall ---------- Install System Integrity Monitor."
echo " bfdetect ------------ Install Brute Force Detection."
echo " dnscheck ------------ Install Account DNS Check Plugin."
echo " ruby ---------------- Install Ruby on Rails."
echo " ffmpeg -------------- Install FFMPEG."
echo " cpnginx ------------- Install cPnginx Admin Plugin."
echo " allconfigserver ----- Install All Plugins from ConfigServer.com (without CSF)"
echo " remcpnginx ---------- Remove cPnginx Admin Plugin."
echo " ffmpegremove -------- Remove FFMPEG from your system."
echo " compileon ----------- Disable Compilers. cPanel only."
echo " compileoff ---------- Enable Compilers. cPanel only."
echo " port ---------------- Change SSH port."
echo " selinux ------------- Disable SELinux permanently."
echo " update -------------- Fully update your system."
echo " securetmp ----------- Secure your /tmp partition. cPanel only."
echo " securetmpv ---------- Secure your /tmp partition on Virtuozzo VPS for cPanel."
echo " fixsuphp ------------ Fix permission issue for suPHP (Advanced users only)."
echo " ";
echo -e "$OK3 main ------------Return to Main Menu. $ENDC "
echo " exit ---------- Leave"
echo " ";
echo -n "Enter your desired function: "
}

# More showMenu stuff.

while :
do
showMenu
read -r yourch
case $yourch in

# This is where the real fun starts!

main ) date
./eidolos.sh
sleep 1
;;

litespeedcp ) date
cd /usr/src || exit; wget http://www.litespeedtech.com/packages/cpanel/lsws_whm_plugin_install.sh; chmod 700 lsws_whm_plugin_install.sh; ./lsws_whm_plugin_install.sh; rm -f lsws_whm_plugin_install.sh
echo "LiteSpeed successfully installed!"
echo "Login to WHM and click the ‘LiteSpeed Web Server’ button."
echo "Click ‘Install LiteSpeed’ and let it run through the installation procedure, this is completely automated."
sleep 9
showMenu
;;

logview ) date
wget http://www.logview.org/logview-install
chmod +x logview-install
./logview-install
rm -f logview-install
cd .. || exit
echo "logview plugin successfully installed!"
echo "Logview is available in WHM under Plugins."
sleep 4
showMenu
;;

csf ) date
wget https://download.configserver.com/csf.tgz
tar -xzf csf.tgz
cd csf || exit
sh install.sh
cd .. || exit
rm -Rf csf.tgz
echo "CSF successfully installed!"
echo -e "$WARNING Edit your CSF configuration after installation! $ENDC"
sleep 4
showMenu
;;

htopsetup ) date
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -Uvh epel-release*.rpm
yum install htop -y
echo -e "htop successfully installed! Now you can use htop on your server!"
sleep 4
showMenu
;;

bfdetect ) date
cd /root || exit
wget http://www.rfxnetworks.com/downloads/bfd-current.tar.gz
tar -xvzf bfd-current.tar.gz
cd bfd-* || exit
./install.sh
echo -e "Please enter your email:"
read -r email
echo "You entered: $email"
echo "ALERT_USR=\"1"\" >>  /usr/local/bfd/conf.bfd
echo "EMAIL_USR=\"$email"\" >>  /usr/local/bfd/conf.bfd
echo "Brute Force Detection has been installed!"
echo "Email would be sent to $email"
/usr/local/sbin/bfd -s
sleep 4
showMenu
;;

port ) echo -e "Please enter a new SSH port: "
read -r sshport
echo "You entered: $sshport"
echo "Port $sshport" >>  /etc/ssh/sshd_config
service sshd reload
echo "SSH port successfully changed!"
echo "Make sure to update your port in CSF and test before leaving your session!"
sleep 5
showMenu
;;

selinux ) sed -i 's/^SELINUX=/#SELINUX=/g' /etc/selinux/config
echo 'SELINUX=disabled' >> /etc/selinux/config
setenforce 0
echo "SELinux successfully disabled! But you really should learn how to configuer SELinux."
sleep 4
showMenu
;;

maldetect ) date
wget http://www.rfxn.com/downloads/maldetect-current.tar.gz
tar -xzvf maldetect-current.tar.gz
cd maldetect-* || exit
sh install.sh
cd .. || exit
rm -Rf maldetect-current.tar.gz
echo "Linux Malware Detect has been installed!"
sleep 4
showMenu
;;

chkrootkit ) date
cd /usr/src || exit
wget ftp://ftp.pangeia.com.br/pub/seg/pac/chkrootkit.tar.gz
tar -xvzf chkrootkit.tar.gz
cd chkrootkit-*/ || exit
make sense
./chkrootkit
cd ..
echo "CHRootKit has been installed!"
sleep 4
showMenu
;;

compileon ) date
chmod 755 /usr/bin/perlcc
chmod 755 /usr/bin/byacc
chmod 755 /usr/bin/yacc
chmod 755 /usr/bin/bcc
chmod 755 /usr/bin/kgcc
chmod 755 /usr/bin/cc
chmod 755 /usr/bin/gcc
chmod 755 /usr/bin/i386*cc
chmod 755 /usr/bin/*c++
chmod 755 /usr/bin/*g++
chmod 755 /usr/lib/bcc /usr/lib/bcc/bcc-cc1
chmod 755 /usr/i386-glibc21-linux/lib/gcc-lib/i386-redhat-linux/2.96/cc1
echo "Compiler has been enabled, don't forget to disabled them after update."
sleep 4
showMenu
;;

compileoff ) date
chmod 000 /usr/bin/perlcc
chmod 000 /usr/bin/byacc
chmod 000 /usr/bin/yacc
chmod 000 /usr/bin/bcc
chmod 000 /usr/bin/kgcc
chmod 000 /usr/bin/cc
chmod 000 /usr/bin/gcc
chmod 000 /usr/bin/i386*cc
chmod 000 /usr/bin/*c++
chmod 000 /usr/bin/*g++
chmod 000 /usr/lib/bcc /usr/lib/bcc/bcc-cc1
chmod 000 /usr/i386-glibc21-linux/lib/gcc-lib/i386-redhat-linux/2.96/cc1
echo "Compiler has been disabled, don't forget to enabled them to do update."
sleep 4
showMenu
;;

securetmp ) date
/scripts/securetmp
echo "tmp partition has been mounted to a temporary file for extra security."
sleep 4
showMenu
;;

securetmpv ) date
none /tmp tmpfs nodev,nosuid,noexec 0 0
echo "tmp partition has been mounted to a temporary file for extra security."
sleep 4
showMenu
;;

allconfigserver ) date
mkdir configserver
cd configserver || exit
wget https://download.configserver.com/cmq.tgz
tar -xzf cmq.tgz
cd cmq/ || exit
sh install.sh
cd .. || exit
rm -Rf cmq.tgz
wget https://download.configserver.com/cmm.tgz
tar -xzf cmm.tgz
cd cmm/ || exit
sh install.sh
cd .. || exit
rm -Rf cmm.tgz
wget https://download.configserver.com/cse.tgz
tar -xzf cse.tgz
cd cse || exit
sh install.sh
cd .. || exit
rm -Rf cse.tgz
wget https://download.configserver.com/cmc.tgz
tar -xzf cmc.tgz
cd cmc/ || exit
sh install.sh
cd .. || exit
rm -Rf cmc.tgz
echo "All Plugins from ConfigServer.com without CSF has been successfully installed!"
echo "Plugins available via WHM plugin tab"
sleep 4
showMenu
;;

whmsonic ) date
cd /root || exit; wget http://www.whmsonic.com/setupr/installr.sh; chmod +x installr.sh; ./installr.sh
echo "WHMSonic successfully installed!"
sleep 5
showMenu
;;

softaculous ) date
cd /usr/local/cpanel/whostmgr/docroot/cgi || exit
wget -N http://www.softaculous.com/ins/addon_softaculous.php
chmod 755 addon_softaculous.php
echo "Go to WHM, login as root and click on Tweak Settings, then you should ensure that both the Ioncube loader is selected for the backend copy of PHP. Save changes."
echo "Go to WHM, Plugins > Softaculous - Instant Installs - webpage will open if the installation was successful."
sleep 8
showMenu
;;

fantastico ) date
cd /usr/local/cpanel/whostmgr/docroot/cgi || exit
wget -N http://files.betaservant.com/files/free/fantastico_whm_admin.tgz
tar -xzpf fantastico_whm_admin.tgz 
rm -rf fantastico_whm_admin.tgz
echo "Go to WHM, login as root and click on Tweak Settings, then you should ensure that both the Ioncube loader is selected for the backend copy of PHP. Save changes."
echo "Go to WHM, Plugins > Fantastico - you will be able to complete installation from there."
sleep 8
showMenu
;;

cleanbackup ) date
cd /home || exit
rm -f latest-cleanbackups
wget http://www.ndchost.com/cpanel-whm/plugins/cleanbackups/download.php
sh latest-cleanbackups
echo "Clean Backup Plugin successfully installed!"
sleep 4
showMenu
;;

dnscheck ) date
cd /home || exit
rm -f latest-accountdnscheck
wget http://www.ndchost.com/cpanel-whm/plugins/accountdnscheck/download.php
sh latest-accountdnscheck
echo "Account DNS Check plugin successfully installed!"
sleep 4
showMenu
;;

ffmpeg ) date
wget http://mirror.ffmpeginstaller.com/old/scripts/ffmpeg7/ffmpeginstaller.7.1.tar.gz
tar xf ffmpeginstaller.7.1.tar.gz
cd ffmpeginstaller.7.1 || exit
./install
echo "FFMPEG successfully installed!"
sleep 4
showMenu
;;

ffmpegremove ) date
rm -Rf /usr/local/cpffmpeg
echo "FFMPEG successfully removed!"
sleep 4
showMenu
;;

cpnginx ) date
cd /usr/local/src || exit
wget http://nginxcp.com/latest/nginxadmin.tar
tar xf nginxadmin.tar
cd publicnginx || exit
./nginxinstaller install
echo "cPnginx Admin Plugin successfully installed!"
sleep 4
showMenu
;;

remcpnginx ) date
cd /usr/local/src || exit
wget http://nginxcp.com/latest/nginxadmin.tar 
tar xf nginxadmin.tar 
cd publicnginx || exit
echo "cPnginx Admin Plugin successfully removed from your system!"
sleep 4
showMenu
;;

ruby ) date
/scripts/installruby
gem install rails
gem install mongrel
gem install fastthread
echo "Ruby on Rails successfully installed!"
echo "Open ports 3000 and 12001 if you’re running a firewall to ensure correct operation."
sleep 8
showMenu
;;

fixsuphp ) echo -e "Please enter username you want to fix: "
read -r user
echo "Update are done on: $user"
cd /home/"$user"/public_html || exit
chown -R "$user:$user" ./*
find . -type d -exec chmod 755 {} \;
find . -type f -exec chmod 644 {} \;
echo "Permission has been modified to 644 on files and 755 for folders!"
echo "All files and folders have had their ownership changed to user: $user!"
sleep 6
showMenu
;;

prminstall ) date
wget http://www.rfxnetworks.com/downloads/prm-current.tar.gz
tar xvfz prm-current.tar.gz
cd prm-*/ || exit
./install.sh
echo "Process Resource Monitor successfully installed!"
sleep 4
showMenu
;;

siminstall ) date
wget http://www.rfxn.com/downloads/sim-current.tar.gz
tar xvfz sim-current.tar.gz
cd sim-*/ || exit
./install.sh
echo "System Integrity Monitor successfully installed!"
sleep 4
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

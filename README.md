# Eidolos
Eidodlos Script is a shell script that helps us install various services on a given server.

# How to Download?

Well, you have two options. Either download the entire thing as a [zip](https://github.com/EidolonHost/Eidolos/archive/master.zip)... or from the `terminal`, use the following commands:


`wget https://raw.githubusercontent.com/EidolonHost/Eidolos/master/eidolos.sh`

`wget https://raw.githubusercontent.com/EidolonHost/Eidolos/master/addon.sh`

Then from your `terminal`,

`chmod +x eidolos.sh; chmod +x addon.sh`

Finally,

`./eidolos.sh` or `./addon.sh` as needed. Type in the function you want to run exactly as described in the usage description below. e.g., if you want to install cPanel, simply type `cpanel` whilst at the `Enter your desired function:` prompt.

## Usage for Eidolos.sh
```
InterWorx Install:
 interworx -------------- Install latest InterWorx.
 cPanel Install:
 cpanel -------------- Install latest cPanel.
 cpdnsonly ----------- Install cPanel DNSOnly.
 updates ------------ Updates OS, updates cPanel if applicable.

 Alternative Control Panels:
 webmin -------------- Install latest Webmin
 vestacp -------------- Install latest VestaCP for Linux.
 ehcp -------------- Install latest EHCP for Linux.
 ezee -------------- Install latest Ezeelogin.

 SSL Tools:
 sslcheck -------------- Checks SSL certificates installed and helps resolve SSL installs.

 CloudLinux Install:
 regcloudlinux ------- Register with CloudLinux Network.
 cloudlinux ---------- Install CloudLinux on your system (License and Reboot required).

 Plugins - Addons and Secure:
 addsec ---------- Additional Scripts for Security and Addons
 exit ---------- Leave
```

### Usage for addon.sh

```
Plugins - Addons and Secure:
 csf ------------ Install CSF Firewall for cPanel.
 htopsetup ----------- Install htop Process Viewer.
 logview ------------- Install logview plugin.
 chkrootkit ---------- Install CHKRootKit.
 maldetect ----------- Install Linux Malware Detect.
 whmsonic ------------ Install WHMSonic Plugin
 fantastico ---------- Install Fantastico Plugin
 softaculous --------- Install Softaculous Plugin
 litespeedcp ----------- Install LiteSpeed Plugin
 cleanbackup --------- Install Clean Backup Plugin.
 prminstall ---------- Install Process Resource Monitor.
 siminstall ---------- Install System Integrity Monitor.
 bfdetect ------------ Install Brute Force Detection.
 dnscheck ------------ Install Account DNS Check Plugin.
 ruby ---------------- Install Ruby on Rails.
 ffmpeg -------------- Install FFMPEG.
 cpnginx ------------- Install cPnginx Admin Plugin.
 allconfigserver ----- Install All Plugins from ConfigServer.com (without CSF)
 remcpnginx ---------- Remove cPnginx Admin Plugin.
 ffmpegremove -------- Remove FFMPEG from your system.
 compileon ----------- Disable Compilers. cPanel only.
 compileoff ---------- Enable Compilers. cPanel only.
 port ---------------- Change SSH port.
 selinux ------------- Disable SELinux permanently.
 update -------------- Fully update your system.
 securetmp ----------- Secure your /tmp partition. cPanel only.
 securetmpv ---------- Secure your /tmp partition on Virtuozzo VPS for cPanel.
 fixsuphp ------------ Fix permission issue for suPHP (Advanced users only).

 main ------------Return to Main Menu.
 exit ---------- Leave
```

Reporting Issues
----------------

When reporting issues, please try to be as descriptive as possible, and include
as much relevant information as you can. A step by step guide on how to
reproduce the issue will greatly increase the chances of your issue being
resolved in a timely manner.

For example, if you are experiencing a problem while running one of the
commands, please provide full output of said command.

If your issue involves installing, updating or resolving dependencies, the
chance of us being able to reproduce your issue will be much higher if you
share your environment with us.

Contributing policy
-------------------

Fork the project, create a feature branch, and send us a pull request. We'll
review the PR and discuss with you the changes that you'd like merged into master.

If you would like to help, take a look at the [list of open issues](https://github.com/EidolonHost/Eidolos/issues).

### LICENSE

See [LICENSE](https://github.com/EidolonHost/Eidolos/blob/master/LICENSE) for specifics. We're `GPLv2`, if you're wondering.

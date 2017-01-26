# Eidolos
Eidolos Script is a shell script that helps us install various services on a given server.

### Installation
Well, you have two options. Either download the entire thing as a [zip](https://github.com/EidolonHost/Eidolos/archive/master.zip)... or from the `terminal`, use the following commands:


`wget https://raw.githubusercontent.com/KeiroD/Eidolos/master/eidolos.sh`

`wget https://raw.githubusercontent.com/KeiroD/Eidolos/master/addon.sh`

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

### Latest News
The current version of Eidolos is our first stable open-source release.
For a [list of known issues see GitHub](https://github.com/EidolonHost/Eidolos/issues) or take a look at the [roadmap](roadmap.md) to see what the current plans are.

### Contributing
Eidolos is an open source project and wouldn't exist without the passionate community of volunteer [contributors](https://github.com/EidolonHost/Eidolos/graphs/contributors).
If you would like to help out then you can find more information below:

* [Building, testing and debugging the sources](https://github.com/EidolonHost/Eidolos/wiki/Building,-Testing,-and-Debugging)

To contribute code to the project simply:
  1. Fork the repo and clone locally
  2. Create a specific topic branch, add a nice feature or fix your bug
  3. Send a Pull Request to spread the fun!

If you haven't already, please sign the [.NET Foundation CLA](http://cla2.dotnetfoundation.org) to give us permission to include your code in the next release of Eidolos.

This project has adopted the code of conduct defined by the [Contributor Covenant](http://contributor-covenant.org/) to clarify expected behavior in our community. This code of conduct has been [adopted by many other projects](http://contributor-covenant.org/adopters/). For more information see the [.NET Foundation Code of Conduct](http://www.dotnetfoundation.org/code-of-conduct).

### License
Eidolos proudly uses the [GPLv2 License](LICENSE).

### EidolonHost

The Eidolos project is supported by [EidolonHost](https://eidolonhost.com).

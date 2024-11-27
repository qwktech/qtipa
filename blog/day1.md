# QTIPA Dev Blog: Day 1

QwkTech is relaunching, and we need a directory server of some sort. Reasearch
leads me to believe FreeIPA is the best foundation to build on in the modern
era, and has been easy to set up in sandbox vms, making it the perfect starting
point for infrastructure required to relaunch.


## The Whys

* Cloud platforms do not align with future goals of QwkTech.
* Want to move toward ARM + PoE devies to reduce ammount of rack power.
* Bought a few Pi 5 and PoE hats to get transition started.
* Chose Raspberry Pi 5 because
  * RockChip has bad support.
  * Pi 5 is common, easy to build off of other projects the right way.
  * PoE hats are cheap and common.
  * I know everyone is the bad guy, don't care where company is going.
* Chose Fedora Core because
  * I prefer Fedora/RHEL based systems.
  * FreeIPA requires Fedora/RHEL
  * CoreOS is awesome.
  * Set and forget.


## The Research

* Found this wasnt going to be easy (it never is).
* Raspberry Pi 5 not yet supported by Fedora.
* Found a [Fedora spin](https://rpmfusion.org/Howto/RaspberryPi) that claims to work (it does).
* Need to reference Fedora spin kickstart file to get CoreOS to boot on Pi.
* Dont even know how to create a CoreOS disk.
  * Requires Fedora install to use dnf.
  * I only have RHEL or Arch on hand.


## The Experiment
* Need to try to get a SD card mounted.
* Can't write from VM as easily, not ideal.
* Other of install recommended through podman, why not uboot file pull?
* Tested U-Boot file pull in fedora container
  * DNF has updated in Fedora 41, not compatible with docs.
  * Switched to Fedora 40 container, working as intended.
  * Success.
* Create build-deps.sh
* added build-butane to readme, but eventually merged into build-deps.sh for breavity.
* Tested until working
* moved on to coreos installer
  * Needted to move some steps from makefile into install-bootloader.sh to prevent errors.
  * Found needed more params for rsync to prevent file permission update attempts causing errors, perm updates unnecessary anyway.
* Successfully creating disks with no errors.
* Plugged disk into pi, no booting.
  * Status light is solid green.
  * HDMI connects to monitor, but only displays black screen with back light on.
  * Fedora IoT was at least showing compatibility error.
  * May be tricky to troubleshoot with no HDMI out.


## Next Steps

* Copy updates made in Fedora spin to get booting on Pi5


## References
* [Fedora spin](https://rpmfusion.org/Howto/RaspberryPi)
* [Provisioning Fedora CoreOS on the Raspberry Pi 4](https://docs.fedoraproject.org/en-US/fedora-coreos/provisioning-raspberry-pi4/)

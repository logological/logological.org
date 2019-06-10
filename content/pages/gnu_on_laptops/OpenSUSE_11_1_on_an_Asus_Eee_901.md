Title: openSUSE 11.1 on an ASUS Eee 901
save_as: gnu_on_laptops/OpenSUSE_11_1_on_an_Asus_Eee_901.html
url: gnu_on_laptops/OpenSUSE_11_1_on_an_Asus_Eee_901.html

# openSUSE 11.1 on an ASUS Eee 901

This document describes how I installed and configured [openSUSE
11.1](http://www.opensuse.org/) on an [ASUS Eee
901](http://en.wikipedia.org/wiki/ASUS_Eee_PC) netbook.

Technical specifications
------------------------

My system has the following components:

<table>
<tr><th>Component           </th><th>Details</th></tr>
<tr><td>CPU                 </td><td>1.6 GHz Intel Atom, 45nm Diamondville N270</td></tr>
<TR><TD>RAM                 </TD><TD>1 GB RAM DDR2-400</TD></TR>
<tr><td>Solid State Drive   </td><td>1× 4 GB, 1× 16 GB</td></tr>
<tr><td>Display             </td><td>8.9" (22.6 cm), 1024×600 TFT LCD</td></tr>
<tr><td>Graphics controller </td><td>Mobile 945GM/GMS/GME, 943/940GML Express Integrated Graphics Controller</td></tr>
<tr><td>Ethernet            </td><td>Attansic L1 Gigabit Ethernet Controller</td></tr>
<tr><td>Wireless LAN        </td><td>RaLink RT2860</td></tr>
<tr><td>Sound               </td><td>82801G (ICH7 Family) High Definition Audio Controller</td></tr>
<tr><td>Touchpad            </td><td>unknown</td></tr>
<tr><td>Integrated camera   </td><td>Microdia Sonix USB 2.0 1.3 megapixel camera</td></tr>
<tr><td>Ports               </td><td>3× USB 2.0</td></tr>
<tr><td>  RJ45 (Ethernet)</td><td>&nbsp;</td></tr>
<tr><td>  HDMI</td><td>&nbsp;</td></tr>
<tr><td>  VGA</td><td>&nbsp;</td></tr>
<tr><td>  headphone</td><td>&nbsp;</td></tr>
<tr><td>  microphone</td><td>&nbsp;</td></tr>
<tr><td>  memory card reader</td><td>&nbsp;</td></tr>
</table>

Summary
-------

<table>
<tr><th>Component or feature</th><th>Details</th></tr>
<tr><td>Suspend to disk      </td><td>not working</td></tr>
<tr><td>Suspend to RAM       </td><td>working</td></tr>
<tr><td>USB                  </td><td>working</td></tr>
<tr><td>Ethernet             </td><td>working</td></tr>
<tr><td>WLAN                 </td><td>working</td></tr>
<tr><td>graphics             </td><td>working</td></tr>
<tr><td>hard disk            </td><td>working</td></tr>
<tr><td>sound                </td><td>working</td></tr>
<tr><td>memory card reader   </td><td>not tested</td></tr>
<tr><td>touchpad             </td><td>working</td></tr>
<tr><td>camera               </td><td>working</td></tr>
</table>

Installation
------------

The following instructions assume that you have an external USB hard
drive and an external monitor. (I used the external monitor because I
suspect that the graphical installer expects a screen resolution of at
least 1024×768.) These instructions also assume that you are currently
running the default Xandros installation, or another GNU/Linux
distribution, on the Eee.

1.  Download the [openSUSE 11.1 32-bit LiveCD ISO
    image.](http://software.opensuse.org/)
2.  Download and install
    [UNetbootin](http://unetbootin.sourceforge.net/), which will be used
    to copy the ISO image to your external hard drive. You may need to
    install some prerequisite packages (namely mtools, p7zip-full, and
    syslinux) in order to install UNetbootin.
3.  Ensure your external hard drive has a formatted partition large
    enough to contain the ISO image. (1 GB should do it.)
4.  Run `unetboot` and have it copy the ISO image to the external hard
    drive. (It is important that you run `unetboot` from the Eee PC
    itself, and not on another machine; it will install a boot loader on
    the external drive which references kernel-specific device names,
    which vary from one machine to another.)
5.  Mount the external drive, find the `initrd` file on it, and replace
    it with
    [initrdud](http://vavai.net/2009/01/02/how-to-make-opensuse-111-liveusb/)
    from Vavai. This will prevent [subsequent
    errors](http://forums.opensuse.org/install-boot-login/402386-11-1-live-usb.html)
    such as "Failed to detect CD/DVD or USB drive!"] or "Couldn't find
    Live image configuration file."
6.  Reboot the machine and hold down F2 to enter the BIOS setup. Make
    sure that the external drive has priority in the boot sequence. Also
    make sure that the wireless card, camera, and Bluetooth are enabled.
7.  After exiting the BIOS, the openSUSE 11.1 LiveCD should boot from
    the external hard drive. You can now install the system to the
    internal SSD by clicking the Install icon.
8.  Select your installation settings according to taste. For
    partitioning, I suggest deleting all the partitions on the first (4
    GB) drive and creating a new 4 GB ext2 partition for the system
    root. The second (16 GB) drive will already contain a single 16 GB
    partition; you can format this or leave it as-is. Set the mount
    point for the second drive to `/home`. Both drives should be mounted
    with the `noatime` option set so as to minimize disk writes.
9.  In the middle of the installation, the X server may blank the
    screen; pressing keys or the touchpad doesn't restore the display.
    You can restore the display by switching to the console
    (Ctrl+Alt+F1) and back (Ctrl+Alt+F7).
10. When the installation is finished, remove the external drive and
    reboot.

While I haven't tested it, the above process should also work with a USB
flash drive instead of an external hard drive. The process should also
work with an external CD-ROM or DVD-ROM drive, except that steps 2
through 5 will be unnecessary; instead, you can simply burn the ISO
image to a CD.

Details
-------

Most components and features work out of the box. Here is a description
of some components which required some configuration, or which I have
not yet gotten to work.

### Networking

Sometimes when the system boots up, the network manager seems to be
dead. This can be fixed by running the command `sudo rcnetwork restart`.
Only after that is it possible to establish an ethernet or wireless
connection. Needless to say, it's a bit annoying having to type this
every time the system starts up, so I am looking for a way to make the
fix permanent.

### Graphics

If you installed using an external monitor, as I did, then the default
display resolution may be as high as 1280×1024. This is fine if you plan
to continue using the external monitor indefinitely, but if not, then
you will have to reset the resolution to the Eee's native 1024×600. The
easiest way of doing this is to load YaST, select the "Graphics Card and
Monitor" applet from the "Hardware" menu, and change the resolution
accordingly. You will have to log off and back on again before the
change takes effect.

Also, the system doesn't appear to correctly detect the DPI of the
internal monitor. To fix this, open `/etc/X11/xorg.conf` and change the
DisplaySize setting to the following:

    DisplaySize  195 114

### Sound

The system can produce sound through the speakers or the headphone jack,
but there appears to be something wrong with the mixer. Specifically,
the PCM channel appears to have no effect on the volume; the only way of
setting the volume is to use the Line Out channel. You will therefore be
unable to adjust the volume from programs that rely on the PCM channel:
MPlayer's volume adjustment control doesn't have any effect at all, and
in Amarok the volume adjustment can produce severely distorted sound if
set too high. If anyone knows how to fix this, please let me know.
Perhaps I need to run alsaconf…?

By default, KMix will show and adjust only the (non-functional) PCM
channel. To fix this, open the KMix mixer, select "Configure Channels…"
from the "Settings" pull-down menu, and add the remaining channels. Then
right-click on the volume adjustment control in the system tray, select
"Select Master Channel…", and select the Line Out channel.

### Keyboard

The keyboard includes a number of Fn-key combinations to adjust the
volume, switch the display to an external monitor, toggle the WLAN,
adjust the LCD brightness, etc. The openSUSE wiki has [instructions on
how to enable these key
combinations](http://en.opensuse.org/OpenSUSE_on_the_EeePC#Hotkeys). I
used the
[eeeEvents-1.1-10.6.i586.rpm](http://download.opensuse.org/repositories/home:/appleonkel:/EEE/openSUSE_11.0_Update/i586/)
package for this. However, the WLAN toggle key (Fn+F2) doesn't seem to
work; the WLAN LED is always lit even after you have supposedly disabled
the WLAN.

### Suspend to disk

Executing the Suspend to Disk command from the K Menu has no effect.
Perhaps this is because I have no swap partition. I am currently
investigating this.

### Suspend to RAM

Executing the Suspend to RAM command from the K Menu seems to correctly
make the computer suspend to RAM, but there doesn't seem to be any way
of reviving the computer. (See the "Dread bricking bug" below.) Running
`s2ram -f` as root has the same effect.

I fixed this by creating two files. The first one, `/etc/pm/config.d`,
has the following contents:

`S2RAM_OPTS="-f -a 2"`

The second one, `/etc/pm/sleep.d/60eeepc`, has the following contents:

```bash
#!/bin/bash
case $1 in
   hibernate)
       /etc/init.d/network stop
       /sbin/modprobe -r rt2860sta
       ;;
   suspend)
       /etc/init.d/network stop
       /sbin/modprobe -r rt2860sta
       ;;
   thaw)
       /sbin/modprobe rt2860sta
       /etc/init.d/network start
       /etc/init.d/acpid restart # hotkeys do not work after resume, /etc/acpi
       ;;
   resume)
       /sbin/modprobe rt2860sta
       /etc/init.d/network start
       /etc/init.d/acpid restart # hotkeys do not work after resume, /etc/acpi
       ;;
   *)  echo "EeePC power management script called incorrectly."
       ;;
esac
```

The dread bricking bug
----------------------

The first time I rebooted after installing openSUSE 11.1, the machine
froze up: the display was completely black, and all the LEDs were lit.
Pressing or holding down the power button would not turn off the
machine. The only solution was to temporarily remove the AC power and
battery. This problem continues to occur occasionally when turning on
the machine or rebooting. (However, once the machine is up and running,
it generally runs without problems.) [This problem is discussed on the
eeeuser.com forums](http://forum.eeeuser.com/viewtopic.php?id=58078). I
tried upgrading the BIOS of the machine to version 1808, which so far
seems to have fixed the problem, but then again, maybe I've just been
lucky and haven't encountered it again yet. Another user reported
success with booting into Failsafe mode, though of course this isn't a
long-term solution.

General observations
--------------------

Despite the above-noted problems, which I'm pretty sure can be overcome
with a little more troubleshooting, I'm pleased with the new operating
system. The OpenSUSE 11.1 system runs *much* faster than the Eee's
default Xandros install. In the stock system, simply switching browser
tabs could take up to 30 seconds, whereas with openSUSE now there is no
delay. Also, the stock Xandros system, with its union file system, left
virtually no free space on the system drive; the openSUSE base install
leaves about 1.5 GB free, which is enough for plenty more programs.

Links
-----

-   [OpenSUSE on the Eee
    PC](http://en.opensuse.org/OpenSUSE_on_the_EeePC)
-   [EeeUser ASUS Eee PC Forum / Other Linux
    Distributions](http://forum.eeeuser.com/viewforum.php?id=15)
-   [Linux on Laptops – Asus](http://www.linux-on-laptops.com/asus.html)
-   [TuxMobil – Asus](http://tuxmobil.org/asus.html)

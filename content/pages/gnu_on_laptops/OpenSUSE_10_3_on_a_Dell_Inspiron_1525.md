Title: GNU/Linux on a Dell Inspiron 1525
slug: gnu_on_laptops/OpenSUSE_10_3_on_a_Dell_Inspiron_1525

# GNU/Linux on a Dell Inspiron 1525

This document describes how I installed and configured
[GNU/Linux](https://www.gnu.org/gnu/linux-and-gnu.html) (64-bit [openSUSE
10.3](http://www.opensuse.org/) distribution) on a [Dell Inspiron
1525](http://support.dell.com/support/edocs/systems/ins1525/en/index.htm)
laptop. **You may also be interested in my more recent guide on
[OpenSUSE 11.3 on a Dell Inspiron
1525](/OpenSUSE_11.3_on_a_Dell_Inspiron_1525).**

Technical specifications
------------------------

The Inspiron 1525 is available in various configurations. My system has
the following components:

<table>
<tr><th>Component           </th><th>Details</th></tr>
<tr><td>CPU                 </td><td>Intel Core 2 Duo T8300 (2.40 GHz, 800 MHz FSB, 3 MB L2 cache)</td></tr>
<tr><td>RAM                 </td><td>4096 MB 667 MHz Dual Channel DDR2 SDRAM (2×2048)</td></tr>
<tr><td>Hard disk           </td><td>250 GB 5400 RPM SATA</td></tr>
<tr><td>Display             </td><td>15.4" TFT widescreen; 1440×900 (WSXGA) resolution</td></tr>
<tr><td>Graphics controller </td><td>Intel 965 GM</td></tr>
<tr><td>Modem               </td><td>unknown</td></tr>
<tr><td>Ethernet            </td><td>Marvell 88E8040</td></tr>
<tr><td>Wireless LAN        </td><td>Intel PRO/Wireless 3945ABG</td></tr>
<tr><td>DVD drive           </td><td>TSSTcorp DVD+-RW TS-L632H</td></tr>
<tr><td>Sound               </td><td>Intel 82801H (ICH8 Family) HD Audio Controller</td></tr>
<tr><td>Touchpad            </td><td>AlpsPS/2 ALPS GlidePoint</td></tr>
<tr><td>Integrated camera   </td><td>unknown</td></tr>
<tr><td>Ports               </td><td>IEEE 1394 (FireWire)</td></tr>
<tr><td>  4× USB 2.0</td><td>&nbsp;</td></tr>
<tr><td>  RJ45 (Ethernet)</td><td>&nbsp;</td></tr>
<tr><td>  RJ11 (modem)</td><td>&nbsp;</td></tr>
<tr><td>  HDMI</td><td>&nbsp;</td></tr>
<tr><td>  S-Video</td><td>&nbsp;</td></tr>
<tr><td>  VGA</td><td>&nbsp;</td></tr>
<tr><td> 2× headphone</td><td>&nbsp;</td></tr>
<tr><td> microphone</td><td>&nbsp;</td></tr>
<tr><td>  memory card reader</td><td>&nbsp;</td></tr>
</table>

Summary
-------

<table>
<tr><th>Component or feature</th><th>Details</th></tr>
<tr><td>Suspend to disk      </td><td>partially working</td></tr>
<tr><td>Suspend to RAM       </td><td>not working</td></tr>
<tr><td>DVD                  </td><td>works out of the box</td></tr>
<tr><td>USB                  </td><td>works out of the box</td></tr>
<tr><td>Ethernet             </td><td>works with kernel \>=2.6.23</td></tr>
<tr><td>WLAN                 </td><td>works with iwlwifi-kmp-default \>=1.2.0_2.6.23.17_ccj64-0.1</td></tr>
<tr><td>FireWire             </td><td>not tested</td></tr>
<tr><td>graphics             </td><td>works out of the box</td></tr>
<tr><td>hard disk            </td><td>works out of the box</td></tr>
<tr><td>modem                </td><td>not tested</td></tr>
<tr><td>sound                </td><td>partially working with alsa-driver \>=20080531</td></tr>
<tr><td>memory card reader   </td><td>not tested</td></tr>
<tr><td>touchpad             </td><td>works out of the box</td></tr>
<tr><td>camera               </td><td>works out of the box</td></tr>
</table>

Details
-------

Most components and features work out of the box. Here is a description
of some components which required some configuration, or which I have
not yet gotten to work.

### Ethernet

The Marvell 88E8040 network card was not recognized by the openSUSE 10.3
installer, which uses an older 2.6.22 Linux kernel. To get the network
card to work, I used my wireless connection to install a 2.6.23 kernel
from the jengelh repository. Here are step-by-step instructions:

1.  Start the YaST Control Center.
2.  Select Software-\>Software Repositories.
3.  A new window will pop up. Press "Add".
4.  Select the "Specify URL…" radio button, and press "Next".
5.  Fill in the fields as follows:
    :   Repository Name: suser-j.engelh
    :   URL:
        <http://ftp5.gwdg.de/pub/linux/misc/suser-jengelh/SUSE-10.3/>

6.  Press "Next".
7.  Press "Finish".
8.  Back at the YaST Control Center, select Software-\>Software
    Management.
9.  A new window will pop up. Change the Filter drop-down menu to
    "Search".
10. In the Search box, type "kernel-default" and press Enter.
11. In the search results pane, right-click on the kernel-default
    package and select "Update". You may get a message indicating that
    other packages (notably the kernel wireless drivers) will be
    upgraded as well; this should be fine. If any conflicts are
    generated, use your best judgment to sort them out.
12. Press "Accept".
13. When the upgrade is complete, reboot your system.

### WLAN

The variant of the Intel PRO/Wireless 3945ABG network card in the
Inspiron 1525 is not supported by the outdated ipw3945 or iwl3945
drivers which come with openSUSE 10.3. However, upgrading to a more
recent version of iwl3945
(iwlwifi-kmp-default-1.2.0_2.6.23.17_ccj64-0.1 and
iwl3945-ucode-2.14.1.5-13) from the [suser-jengelh
repository](http://ftp5.gwdg.de/pub/linux/misc/suser-jengelh/SUSE-10.3/)
(see above) fixes the problem. Make sure to either uninstall the ipw3945
packages, or configure the wireless card to use the iwl3945 module
rather than the ipw3945 module in YaST.

See also:

-   [DellLinuxWiki](http://linux.dell.com/wiki/index.php/Tech/Wireless/Intel_IPW3945)

### Sound

There are many variants of the Intel 82801H (ICH8 family) sound card.
The one used in my Inspiron 1525 is a STAC9228; it may not be fully
supported yet, and I am still trying to get it to work properly.

The version of
[ALSA](http://www.alsa-project.org/main/index.php/Main_Page) which ships
with openSUSE 10.3 (1.0.14) does not support the sound card at all; no
sound is produced. Upgrading to the 10.0.16 driver did not fix the
problem. I downloaded, compiled, and installed a more recent snapshot of
alsa-driver (20080531) from
<http://ftp.kernel.org/pub/linux/kernel/people/tiwai/snapshot/>
(formerly <ftp://ftp.suse.com/pub/projects/alsa/snapshot/driver/>), upon
which the sound now basically works, provided that the module is loaded
with the option model=3stack. Here are step-by-step instructions:

1.  Download the most recent alsa-driver snapshot from
    <http://ftp.kernel.org/pub/linux/kernel/people/tiwai/snapshot/>. The
    version dated 20080531 works for me.
2.  Untar, compile, and install the snd-hda-intel module as follows:
    :   `$ tar xjvf alsa-driver-20080531.tar.bz2` (substitute the name
        of the file you downloaded)
    :   `$ cd alsa-driver`
    :   `$ ./configure --with-cards=hda-intel`
    :   `$ make`
    :   `$ sudo make install`

3.  If the driver fails to compile, then try an earlier snapshot. (Not
    all snapshots are guaranteed to compile.)
4.  As root, add the following line to the file
    /etc/modprobe.conf.local:
    :   `options snd-hda-intel    model=3stack`

5.  Reboot your machine.
6.  If you don't get any sound yet, or if it is coming out of the left
    channel only, then run the following command:
    :   `$ sudo rcalsasound restart`

There are a few minor problems with the sound. For one, the right
headphone jack does not produce any output at all, so you will need to
use the left jack. Another problem is that whenever the balance slider
is moved to the right, the master volume drops proportionally. I have
reported this as a [Bug
0003987](https://bugtrack.alsa-project.org/alsa-bug/view.php?id=3987) on
the [ALSA bugtracking
system](https://bugtrack.alsa-project.org/alsa-bug/main_page.php).

Here are some pages with information on using the 82801H sound card
under Linux:

-   [DellLinuxWiki](http://linux.dell.com/wiki/index.php/Tech/Audio)
-   [Hardware for Linux](http://hardware4linux.info/component/21335/)

### Keyboard

The keyboard includes three volume control buttons, four media control
buttons, a "Home" button, and various Fn-key combinations. The volume
control buttons do not work out of the box; possibly they send standard
key codes which can be mapped with xkb. The other five special buttons I
haven't tested yet.

Fn-Up and Fn-Down correctly increase and decrease the LCD brightness,
respectively. Fn-F1 correctly suspends to disk. Fn-F3 is presumably
meant to suspend to RAM, but this doesn't seem to work. Fn-F8 switches
between the local, external, and dual display modes; I haven't tested
this.

### Touchpad

The touchpad works out of the box, though it needs some configuration.
The right edge of the touchpad acts like a vertical scrollwheel.
Presumably the bottom edge is supposed to act like a horizontal
scrollwheel, but the default mapping seems to instead be Alt-Left and
Alt-Right, which causes no end of grief in web browsers. I suppose this
can be fixed by tweaking the X.org configuration.

### Modem

The modem does not show up in the YaST Hardware Information application,
so I assume it is not working out of the box. However, I haven't done
any extensive testing.

See also:

-   [DellLinuxWiki](http://linux.dell.com/wiki/index.php/Tech/Modems)

### Camera

I can't find the built-in webcam in the YaST Hardware Information
application, but it is recognized in the boot log and seems to work in
applications such as Skype and Kopete. I haven't tested its built-in
microphone.

### ACPI

Basic ACPI functions such as the battery monitor and turning off the LCD
screen seem to work. Suspend to RAM does not work at all. Suspend to
disk seems to work some of the time; other times it gets stuck while
suspending and I have to power off the machine. I haven't yet tried
troubleshooting these problems. Please let me know if you know how to
get suspend working properly.

It is possible that the problems with suspend result from a BIOS bug;
according to the
[DellLinuxWiki](http://linux.dell.com/wiki/index.php/Ubuntu_7.10/Issues/Resume_from_Suspend_Broken_with_newer_BIOS),
BIOS versions A09 and above cause problems with suspend. My laptop came
with version A11 preinstalled.

Links
-----

-   [Running Ubuntu 7.10 (Gutsy Gibbon) on a Dell Inspiron
    1525](http://nain.oso.chalmers.se/index.php?q=node/21)
-   [Installation de Ubuntu Gutsy&Hardy sur DELL Inspiron
    1525](http://web.archive.org/web/20080516111228/http://blog.thelinuxfr.org/2008/02/13/installation-de-ubuntu-gutsy-sur-dell-inspiron-1525/)
    (in French)
-   [DellLinuxWiki](http://linux.dell.com/wiki/index.php/Main_Page)
-   [Linux on Laptops – Dell](http://www.linux-on-laptops.com/dell.html)
-   [TuxMobil – Dell](http://tuxmobil.org/dell.html)

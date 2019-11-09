Title: openSUSE 15.1 on an Acer TravelMate B118-M
slug: gnu_on_laptops/OpenSUSE_15_1_on_an_Acer_TravelMate_B118-M

# openSUSE 15.1 on an Acer TravelMate B118-M

This document describes how I installed and configured
[GNU/Linux](https://www.gnu.org/gnu/linux-and-gnu.html) (64-bit
[openSUSE 15.1](http://www.opensuse.org/) distribution) on an
[Acer Travelmate B118-M](https://www.acer.com/ac/de/DE/content/professional-model/NX.VHPEG.005)
netbook.

Technical specifications
------------------------

The Acer TravelMate B118-M is available in various configurations.
According to my retailer, my system's full model name is "Acer
TravelMate B118-M-P98A", with the Acer article number NX.VHPEG.005.

<table>
<tr><th>Component</th><th>Details</th></tr>
<tr><td>CPU                              </td><td><a href="https://ark.intel.com/content/www/us/en/ark/products/128990/intel-pentium-silver-n5000-processor-4m-cache-up-to-2-70-ghz.html">Intel Pentium Silver N5000</a> (4 cores, 1.10 GHz, 4MB cache)</td></tr>
<tr><td>RAM                              </td><td>4 GB DDR4 SDRAM</td></tr>
<tr><td>Hard disk                        </td><td>500 GB 5400 RPM SATA</td></tr>
<tr><td>Display                          </td><td>11.6" Comfyview; 1366×768 (HD) resolution</td></tr>
<tr><td>Graphics controller              </td><td>UHD Graphics 605</td></tr>
<tr><td>Ethernet                         </td><td>RTL8111/8168/8411 PCI Express Gigabit Ethernet controller</td></tr>
<tr><td>Wireless LAN                     </td><td>Dual Band Wirelass-AC 7265 (IEEE 802.11a/b/g/n/ac)</td></tr>
<tr><td>Sound                            </td><td>Intel Audio Device</td></tr>
<tr><td>Touchpad                         </td><td>ETPS/2 Elantouch Touchpad</td></tr>
<tr><td>Integrated camera                </td><td>unknown Quanta Computer device</td></tr>
<tr><td>Ports                            </td><td>1× USB 2.0<br>1× USB 3.0<br>RJ45 (Ethernet)<br>SD card reader<br>HDMI<br>combination headphone/microphone</td></tr>
</table>

Summary
-------

<table>
<tr><th>Component or feature</th><th>Details</th></tr>
<tr><td>Suspend to disk     </td><td>not tested</td></tr>
<tr><td>Suspend to RAM      </td><td>mostly working; see below</td></tr>
<tr><td>USB                 </td><td>works out of the box</td></tr>
<tr><td>Ethernet            </td><td>works out of the box</td></tr>
<tr><td>WLAN                </td><td>works out of the box</td></tr>
<tr><td>graphics            </td><td>mostly working; see below</td></tr>
<tr><td>HDMI                </td><td>not tested</td></tr>
<tr><td>hard disk           </td><td>works out of the box</td></tr>
<tr><td>sound               </td><td>works out of the box</td></tr>
<tr><td>memory card reader  </td><td>not tested</td></tr>
<tr><td>touchpad            </td><td>needs workaround; see below</td></tr>
<tr><td>camera              </td><td>works out of the box</td></tr>
<tr><td>BIOS update         </td><td>doesn't work; see below</td></tr>
</table>

Installation
------------

The model I received apparently had no usable operating system
installed; it booted into an arcane and unhelpful UEFI menu.  The
computer has no optical drive, so to install openSUSE 15.1 I used an
external USB drive.  In order to get the computer to boot from an
external USB drive, it was necessary to hold down the F2 key
immediately after powering on the machine.  This brings up a BIOS-like
menu that will allow you to select the default boot device order, or
to enable a boot menu (activated by pressing F12 during system
startup).

The touchpad was not detected during install, so I had to use an
external mouse.  I had YaST completely wipe and repartition the hard
drive.  I reserved 92 GB for the root partition, 4 GB for the swap
partition, and the remainder for the home partition.  (YaST also
reserves a 500 MB UEFI partition.)

The installation completed without error, but afterwards the system
went into an infinite restart loop.  To break this it was necessary to
press a key when the blue screen appears and then select "Always
continue to boot".


Details
-------

Most components and features work out of the box. Here is a description
of some components with special considerations, or which I have not yet
gotten to work.

### Touchpad

The touchpad is not activated out of the box.  According to `dmesg |
egrep "i8042|input"`, the kernel logs, it is detected but disabled:

	i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
	i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp

As the message suggests, the solution is to add `i8042.nopnp` to the
boot parameters; this can be done in YaST.

As with the TravelMate B115, the touchpad does not have separate left
and right buttons; instead you can left click by pressing the lower
left corner of the touchpad, and right click by pressing the lower
right corner. It is not possible to press both corners at the same
time, which means that the usual way of simulating a middle click
(i.e., the third mouse button) does not work.

However, there is another way of producing left, right, and middle
clicks which works out of the box:

-   Tap the touchpad with one finger for a left click.
-   Tap the touchpad with two fingers for a right click.
-   Tap the touchpad with three fingers for a middle click.

This behaviour can be customized in KDE using the "Input devices" module
of the Control Center.

### Keyboard

Most of the special Fn+key combinations work out of the box.  An
exception is Fn+F3, which is supposed to disable wireless—this doesn't
work, though I can still disable wireless on the command line or using
the KDE network manager plasmoid.

To set up a keyboard shortcut for toggling wireless (i.e., airplane
mode), create a script with the following contents:

    #!/bin/bash

    wifi="$(nmcli r wifi)"

    if [ "$wifi" = "enabled" ]; then
        nmcli r wifi off
    else
        nmcli r wifi on
    fi

Make sure you set the script as executable. You can then create a menu
entry for this script in your desktop environment and bind a shortcut
key combination to it. Unfortunately, it's not possible to use Fn+F3, or
any other Fn combination, as the keyboard shortcut; this is most likely
a problem with the keyboard driver used by the kernel. (See [this
discussion on the X.Org bug
tracker](https://bugs.freedesktop.org/show_bug.cgi?id=22185) for
details.) I used Meta+F3 (where "Meta" is the key with the Windows
logo).

### Graphics

Under some circumstances, the laptop screen blinks on and off rapidly
for several seconds.  This happens whenever the Fn+Up or Fn+Dn keys
are used to adjust the audio volume, triggering the on-screen display
(OSD).  The problem also occurs very frequently when running Windows 7
in VirtualBox.  In this case, the problem seems to be triggered by
clicking on certain icons in the Windows Explorer, but also when the
virtual machine boots up or shuts down.

I am still investigating this issue and have asked about it on
the
[Acer community site](https://community.acer.com/en/discussion/580925/screen-blinks-on-and-off-when-osd-appears-and-in-virtualbox-travelmate-b118#latest).

### Suspend

The computer properly suspends when the lid is closed, and wakes when
the lid is opened.  However, it is not possible to properly suspend
the machine _while_ the lid remains open.  If you try this, then the
machine suspends but then immediately wakes again.

I have not yet solved this problem.  Running `cat /proc/acpi/wakeup`
shows the following devices that are permitted to wake the computer
from suspend:

	Device  S-state   Status   Sysfs node
	RP01      S4    *disabled
	PXSX      S5    *disabled
	RP02      S4    *disabled
	PXSX      S5    *disabled
	RP03      S4    *enabled   pci:0000:00:13.0
	PXSX      S5    *disabled
	RP04      S4    *disabled
	PXSX      S5    *disabled
	RP05      S4    *enabled   pci:0000:00:13.2
	PXSX      S5    *disabled  pci:0000:02:00.0
	RP06      S4    *enabled   pci:0000:00:13.3
	PXSX      S5    *disabled  pci:0000:03:00.0
	XHC       S4    *enabled   pci:0000:00:15.0
	XDCI      S4    *disabled
	HDAS      S3    *disabled  pci:0000:00:0e.0
	CNVW      S4    *disabled

I have tried disabling each of these (e.g., `echo XHC | tee
/proc/acpi/wakeup`) but in no case did this solve the problem.

I later noticed in the BIOS menu, in the "Main" tab, there is a
setting "Lid Open Resume" that is set to "Enabled".  Presumably
changing this setting to "Disabled" will work around this problem,
though I have not yet tested this.

### BIOS update

BIOS updates are available on Acer's website.  However, they are
distributed as Microsoft Windows executables and so there seems to be
no way of applying them without running Windows.

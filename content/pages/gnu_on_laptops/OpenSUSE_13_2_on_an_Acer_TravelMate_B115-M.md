Title: openSUSE 13.2 on an Acer TravelMate B115-M
save_as: gnu_on_laptops/OpenSUSE_13_2_on_an_Acer_TravelMate_B115-M.html
url: gnu_on_laptops/OpenSUSE_13_2_on_an_Acer_TravelMate_B115-M.html

# openSUSE 13.2 on an Acer TravelMate B115-M

This document describes how I installed and configured
[GNU/Linux](https://www.gnu.org/gnu/linux-and-gnu.html) (64-bit
[openSUSE 13.2](http://www.opensuse.org/) distribution) on an
[Acer Travelmate B115-M](http://www.acer.de/ac/de/DE/content/professional-model/NX.VA1EG.002)
netbook.

Technical specifications
------------------------

The Acer TravelMate B115-M is available in various configurations.
According to my retailer, my system's full model name is "Acer
TravelMate B115-M-41RQ"; I can't find this exact model name listed on
Acer's website, but it does show a [Acer Travelmate B115-M
NX.VA1EG.002](http://www.acer.de/ac/de/DE/content/professional-model/NX.VA1EG.002)
with mostly matching specifications.

<table>
<tr><th>Component</th><th>Details</th></tr>
<tr><td>CPU                              </td><td><a href="http://ark.intel.com/products/81074/Intel-Pentium-Processor-N3530-2M-Cache-up-to-2_58-GHz">Intel Pentium Quad-Core N3530</a> (2.58 GHz mit Intel Turbo-Boost 2.0, 2MB Intel Smart-Cache)</td></tr>
<tr><td>RAM                              </td><td>4 GB DDR3L SDRAM (expandable to 8 GB)</td></tr>
<tr><td>Hard disk                        </td><td>250 GB 5400 RPM SATA</td></tr>
<tr><td>Display                          </td><td>11.6" Comfyview; 1366×768 (HD) resolution</td></tr>
<tr><td>Graphics controller              </td><td>Intel ValleyView Gen7</td></tr>
<tr><td>Ethernet                         </td><td>RTL8111/8168 PCI Express Gigabit Ethernet controller</td></tr>
<tr><td>Wireless LAN                     </td><td>AR9462 Wireless Network Adapter (IEEE 802.11a/b/g/n)</td></tr>
<tr><td>Sound                            </td><td>ValleyView High Definition Audio Controller</td></tr>
<tr><td>Touchpad                         </td><td>unknown model</td></tr>
<tr><td>Integrated camera                </td><td>unknown model</td></tr>
<tr><td>Ports                            </td><td>2× USB 2.0<br>1× USB 3.0<br>RJ45 (Ethernet)<br>SD card reader<br>HDMI<br>combination headphone/microphone</td></tr>
</table>

Summary
-------

<table>
<tr><th>Component or feature</th><th>Details</th></tr>
<tr><td>Suspend to disk     </td><td>works out of the box</td></tr>
<tr><td>Suspend to RAM      </td><td>works out of the box</td></tr>
<tr><td>USB                 </td><td>works out of the box</td></tr>
<tr><td>Ethernet            </td><td>works out of the box</td></tr>
<tr><td>WLAN                </td><td>works out of the box</td></tr>
<tr><td>graphics            </td><td>works out of the box</td></tr>
<tr><td>HDMI                </td><td>works out of the box</td></tr>
<tr><td>hard disk           </td><td>works out of the box</td></tr>
<tr><td>sound               </td><td>works out of the box</td></tr>
<tr><td>memory card reader  </td><td>not tested</td></tr>
<tr><td>touchpad            </td><td>works out of the box</td></tr>
<tr><td>camera              </td><td>works out of the box</td></tr>
</table>

Installation
------------

The computer has no DVD drive, so to install openSUSE 13.2 I used an
external USB drive. I had YaST completely wipe and repartition the hard
drive, but apart from this used all the default settings. The
installation appeared to complete successfully, but upon restarting, the
computer didn't recognize the hard drive as bootable, giving me a
message to the effect of "No bootable devices found".

The problem turned out to be that the hard disk had the `pmbr_boot` flag
set. This flag prevents the computer's UEFI system from scanning the
disk for EFI boot partitions. (See [openSUSE Bug
932033](https://bugzilla.opensuse.org/show_bug.cgi?id=932033).) I have
no idea whether the flag was already there when I got the machine, or
whether it's something the openSUSE installer added, but in any case it
shouldn't be there for a successful UEFI boot.

If you encounter this problem, you can fix it by using the openSUSE
installation disk to boot into Rescue Mode and then use `parted` to
unset the `pmbr_boot` flag:

    # parted /dev/sda
    (parted) disk_set pmbr_boot off
    (parted) quit

Details
-------

Most components and features work out of the box. Here is a description
of some components with special considerations, or which I have not yet
gotten to work.

### Touchpad

The touchpad does not have separate left and right buttons; instead you
can left click by pressing the lower left corner of the touchpad, and
right click by pressing the lower right corner. It is not possible to
press both corners at the same time, which means that the usual way of
simulating a middle click (i.e., the third mouse button) does not work.

However, there is another way of producing left, right, and middle
clicks which works out of the box:

-   Tap the touchpad with one finger for a left click.
-   Tap the touchpad with two fingers for a right click.
-   Tap the touchpad with three fingers for a middle click.

This behaviour can be customized in KDE using the "Input devices" module
of the Control Center.

### Keyboard

Contrary to reports I have seen online for other GNU/Linux
distributions, on openSUSE 13.2 most of the special Fn+key combinations
(including the Fn+Left and Fn+Right combinations for adjusting the
display brightness) work out of the box. The only exception I've
discovered so far is Fn+F3, which is supposed to disable wireless—this
doesn't work, though I can still disable wireless on the command line or
using the KDE network manager plasmoid.

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

Links
-----

-   [Acer TravelMate
    B115](http://wiki.ubermix.org/page/Acer_TravelMate_B115) on the
    ubermix wiki

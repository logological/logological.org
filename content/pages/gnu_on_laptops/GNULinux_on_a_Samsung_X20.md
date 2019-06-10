Title: GNU/Linux on a Samsung X20
save_as: gnu_on_laptops/GNULinux_on_a_Samsung_X20.html
url: gnu_on_laptops/GNULinux_on_a_Samsung_X20.html

# GNU/Linux on a Samsung X20

This document describes how I installed and configured
[GNU/Linux](https://www.gnu.org/gnu/linux-and-gnu.html) ([SuSE
9.3](http://www.suse.com/) distribution) on a [Samsung
X20](http://www.samsungpc.com/products/x20/x20.htm) laptop.

Technical specifications
------------------------

<table>
<tr><th>Component           </th><th>Details</th></tr>
<tr><td>CPU                 </td><td>Intel Centrino 1.6 GHz</td></tr>
<TR><TD>RAM                 </TD><TD>1024 MB</TD></TR>
<tr><td>Hard disk           </td><td>60 GB</td></tr>
<tr><td>Display             </td><td>15" 1400×1050 LCD</td></tr>
<tr><td>Graphics controller </td><td>Intel i915</td></tr>
<tr><td>Modem               </td><td>56 Kbps V.92 AC'97 S/W modem</td></tr>
<tr><td>Ethernet            </td><td>BCM4401-B0 100Base-TX</td></tr>
<tr><td>Wireless LAN        </td><td>PRO/Wireless 220BG</td></tr>
<tr><td>DVD drive           </td><td>TSST 8x DVD-ROM, 24x RW, 24x CD-R, 24x CD</td></tr>
<tr><td>Sound               </td><td>AC'97</td></tr>
<tr><td>Ports               </td><td>IEEE 1394 (FireWire)</td></tr>
<tr><td>  3× USB 2.0</td><td>&nbsp;</td></tr>
<tr><td>  PCMCIA</td><td>&nbsp;</td></tr>
<tr><td>  RJ45 (Ethernet)</td><td>&nbsp;</td></tr>
<tr><td>  TV-out</td><td>&nbsp;</td></tr>
<tr><td> RJ11 (modem)</td><td>&nbsp;</td></tr>
<tr><td>  VGA</td><td>&nbsp;</td></tr>
<tr><td>  headphone</td><td>&nbsp;</td></tr>
<tr><td>  microphone</td><td>&nbsp;</td></tr>
<tr><td>  S/PDIF</td><td>&nbsp;</td></tr>
<tr><td>  memory stick</td><td>&nbsp;</td></tr>
</table>

Summary
-------

<table>
<tr><th>Component or feature</th><th>Details</th></tr>
<tr><td>ACPI                        </td><td>not tested</td></tr>
<tr><td>DVD                         </td><td>working</td></tr>
<tr><td>Ethernet                    </td><td>working</td></tr>
<tr><td>wireless                    </td><td>working</td></tr>
<tr><td>FireWire                    </td><td>not tested</td></tr>
<tr><td>graphics                    </td><td>working</td></tr>
<tr><td>graphics, dual monitor mode </td><td>not tested</td></tr>
<tr><td>hard disk                   </td><td>working</td></tr>
<tr><td>modem                       </td><td>not tested</td></tr>
<tr><td>PCMCIA                      </td><td>not tested</td></tr>
<tr><td>sound, MIDI                 </td><td>not tested</td></tr>
<tr><td>sound, wave                 </td><td>working</td></tr>
<tr><td>TV-out                      </td><td>not tested</td></tr>
<tr><td>memory stick                </td><td>not tested</td></tr>
<tr><td>S/PDIF                      </td><td>not tested</td></tr>
<tr><td>USB                         </td><td>working</td></tr>
</table>

Details
-------

### Preparation and installation

Before booting for the first time, press F2 to enter the BIOS setup and
make a note of which version you have. If necessary, [upgrade your
BIOS](http://www.samsungpc.com/products/x20/x20_bios.htm) as there are
some bugs in older versions which may affect the WLAN on/off button and
other components.

The X20 comes with Windows XP preinstalled. Its hard drive partition
must be shrunk in order to make room for GNU/Linux.

SuSE 9.3 was installed via network through my company's LAN. Except for
the X.org display setup, installation went off without a hitch.

### Display

SuSE's X configuration utility, SaX, had trouble setting up the graphics
card and display. I had to use the default `/etc/X11/X.org` file
produced during installation. This gave me a respectable display of
1280×1024 at 24 bpp.

To achieve the maximum LCD resolution of 1400×1050, you need to make
several changes to the system. First, download and install
[915resolution](http://www.geocities.com/stomljen/) and add the
following line to `/etc/init.d/boot.local`:

`915resolution 5c 1400 1050 `

You may need to obtain the latest [i810
driver](http://www.fairlite.demon.co.uk/intel.html); be sure you
download the one appropriate for your version of X.Org. Install the
driver in `/usr/X11R6/lib/modules/drivers`. The i810 driver that comes
with SuSE 9.3 does not support 1400×1050 mode; I'm not sure about later
versions of SuSE.

Finally, modify the relevant sections of your `/etc/X11/xorg.conf` file
to read as follows:

```
Section "Module"
  Load         "dbe"
  Load         "dri"
  Load         "extmod"
  Load         "glx"
  Load         "freetype"
EndSection

Section "Monitor"
  Identifier	"LaptopLCD"
  Option	"DPMS"
  DisplaySize   304 228
EndSection

Section "Device"
  Identifier  "i915Chipset"
  Driver      "i810"
  BusID	      "PCI:0:2:0"
  VideoRam    131072
  Option      "NoAccel"       "false"
  Option      "DRI"           "true"
EndSection

Section "Screen"
  Identifier	"LaptopScreen"
  Device	"i915Chipset"
  Monitor	"LaptopLCD"
  DefaultDepth	24
  SubSection "Display"
    Viewport	0 0
    Depth	8
  EndSubSection
  SubSection "Display"
    Viewport	0 0
    Depth	16
  EndSubSection
  SubSection "Display"
    Viewport	0 0
    Depth	24
  EndSubSection
EndSection

Section "ServerLayout"
  …
  Screen       0  "LaptopScreen" 0 0
  …
EndSection

Section "DRI"
    Group      "video"
    Mode       0660
EndSection
```

### Hotkeys

The following hotkeys work out of the box:

Fn-Up/Down
:   adjust LCD brightness
Fn-F4
:   toggle LCD/external monitor
Fn-F7
:   toggle S/PDIF
Fn-F8
:   toggle 3D sound
Fn-F10
:   toggle "Etiquette mode"
Fn-F9
:   toggle touchpad
touchpad middle button
:   toggle touchpad
WLAN button
:   toggle WLAN

#### Volume hotkeys

To get Fn-F6 (mute), Fn-Left (volume down), and Fn-Right (volume up) to
work, put the following in `/etc/X11/Xmodmap`:

    keycode 174 = XF86AudioLowerVolume
    keycode 176 = XF86AudioRaiseVolume
    keycode 160 = XF86AudioMute

If you are using KDE and the package \`kdeutils3-laptop' is installed,
then you will get nice popups for volume adjustment. (If this not
enabled by default, go to Control Center→KDE Components→Service Manager,
make sure the "Use" box for "KMilo" is ticked, and if necessary, start
it by clicking the "Start" button.

#### ACPI hotkeys

Not tested; check back later.

#### Application hotkeys

To enable the three application buttons, add the following lines to
`/etc/init.d/boot.local`:

    setkeycodes 74 93
    setkeycodes 75 94

Then add the following to `/etc/X11/Xmodmap`:

    keycode 131 = F13
    keycode 128 = F14
    keycode 208 = F15

Title: GNU/Linux on a Lenovo ThinkPad T61
slug: gnu_on_laptops/GNULinux_on_a_Lenovo_ThinkPad_T61

# GNU/Linux on a Lenovo ThinkPad T61

This document describes how I installed and configured
[GNU/Linux](https://www.gnu.org/gnu/linux-and-gnu.html) ([openSUSE
10.3](http://www.opensuse.com/) distribution) on a [Lenovo ThinkPad
T61](http://www5.pc.ibm.com/uk/products.nsf/Products?openagent&brand=Thinkpad&series=ThinkPad+T+Series)
laptop.

Technical specifications
------------------------

The ThinkPad T61 is available in various configurations. My system has
the following components:

<table>
<tr><th>Component           </th><th>Details</th></tr>
<tr><td>CPU                 </td><td>Intel Core2 Duo T7300 @ 2.00 GHz</td></tr>
<TR><TD>RAM                 </TD><TD>2 GB</TD></TR>
<tr><td>Hard disk           </td><td>60 GB</td></tr>
<tr><td>Display             </td><td>15.4" TFT widescreen; 1680×1050 (WSXGA+) resolution</td></tr>
<tr><td>Graphics controller </td><td>NVIDIA Quadro NVS 140M</td></tr>
<tr><td>Modem               </td><td>unknown</td></tr>
<tr><td>Ethernet            </td><td>Intel 82566MM Gigabit</td></tr>
<tr><td>Wireless LAN        </td><td>Intel PRO/Wireless 4965 AG</td></tr>
<tr><td>DVD drive           </td><td>Matshita DVD/CDRW UJDA775</td></tr>
<tr><td>Sound               </td><td>82801H (ICH8 Family) HD Audio Controller</td></tr>
<tr><td>Touchpad            </td><td>SynPS/2 Synaptics Touchpad</td></tr>
<tr><td>Pointing stick      </td><td>TPPS/2 IBM TrackPoint</td></tr>
<tr><td>Fingerprint reader  </td><td>SGS Thomson Microelectronics Fingerprint Reader</td></tr>
<tr><td>Ports               </td><td>IEEE 1394 (FireWire)</td></tr>
<tr><td>  3× USB 2.0</td><td>&nbsp;</td></tr>
<tr><td>  PCMCIA</td><td>&nbsp;</td></tr>
<tr><td>  RJ45 (Ethernet)</td><td>&nbsp;</td></tr>
<tr><td>  RJ11 (modem)</td><td>&nbsp;</td></tr>
<tr><td>  VGA</td><td>&nbsp;</td></tr>
<tr><td>  headphone</td><td>&nbsp;</td></tr>
<tr><td>  microphone</td><td>&nbsp;</td></tr>
<tr><td>  memory card reader</td><td>&nbsp;</td></tr>
</table>

Summary
-------

<table>
<tr><th>Component or feature</th><th>Details</th></tr>
<tr><td>Suspend-to-disk/RAM </td><td>not working</td></tr>
<tr><td>DVD                 </td><td>works out of the box</td></tr>
<tr><td>USB                 </td><td>works out of the box</td></tr>
<tr><td>Ethernet            </td><td>works out of the box</td></tr>
<tr><td>WLAN                </td><td>works out of the box</td></tr>
<tr><td>Bluetooth           </td><td>not tested</td></tr>
<tr><td>FireWire            </td><td>not tested</td></tr>
<tr><td>graphics            </td><td>works after some configuration</td></tr>
<tr><td>hard disk           </td><td>works out of the box</td></tr>
<tr><td>modem               </td><td>not tested</td></tr>
<tr><td>PCMCIA              </td><td>not tested</td></tr>
<tr><td>sound, MIDI         </td><td>works out of the box</td></tr>
<tr><td>sound, wave         </td><td>works after some configuration</td></tr>
<tr><td>memory card reader  </td><td>not tested</td></tr>
<tr><td>touchpad            </td><td>works out of the box</td></tr>
<tr><td>pointing stick      </td><td>works out of the box</td></tr>
<tr><td>fingerprint reader  </td><td>not tested</td></tr>
</table>

Details
-------

Most components and features work out of the box. Here is a description
of some components which required some configuration, or which I have
not yet gotten to work.

### Display

#### NVIDIA driver

SaX defaults to using VESA drivers because SUSE is not permitted to
distribute the NVIDIA drivers. The VESA drivers limit you to a
resolution of 1280x1024, whereas the computer's NVIDIA card actually
supports resolutions up to 1680×1050 with the correct drivers. The
easiest way to install the NVIDIA drivers is to visit the [NVIDIA page
on the openSUSE wiki](http://en.opensuse.org/NVIDIA) and follow the
"Install NVIDIA via 1-click" link, which will launch YaST. I got an ugly
conflict warning; I selected "Ignore this requirement just here" and
YaST eventually solved the conflict on its own.

#### External monitor

The Fn-F7 key combination to switch the display to an external monitor
does not work. However, the proprietary NVIDIA driver comes with a tool,
nvidia-settings, which can be used to extend or clone the desktop to an
external monitor.

### CD/DVD

Note that the Matshita DVD/CDRW UJDA775 is a CD writer but *not* a DVD
writer!

### Sound

Sound works, but the default settings leave the machine mute. In KDE,
right-click on the speaker icon in the system tray and click "Show Mixer
Window". In the "Switches" tab, be sure that the speaker output is
enabled, and in the "Output" tab, be sure that the PCM volume is turned
up. Likewise I needed to fiddle with the microphone settings in order to
get microphone input working. Then right-click on the speaker icon in
the system tray, click "Select Master Channel…", and be sure that "PCM"
is selected. If you do not hear any sound, press the special volume-up
or volume-down button, which are located to the right of the Esc key on
the keyboard.

### Keyboard

The keyboard includes three volume control buttons, a Windows key, a
context menu key, page forward/backward keys, and various Fn-key
combinations.

#### Volume control buttons

The keyboard includes three special buttons for muting the speaker and
raising and lowering the volume. In the default configuration, pressing
the mute button mutes the sound output, but pressing it again does not
unmute it. The output can be unmuted by pressing the volume-up or
volume-down button. The volume-up and volume-down buttons have otherwise
no effect on the sound volume. I have not yet figured out how to
properly configure these buttons.

#### Fn-key combinations

LCD brightness controls
:   Fn-Home and Fn-End work out of the box to adjust the brightness of
    the LCD display.
Suspend-to-RAM and suspend-to-disk
:   Fn-F4 and Fn-F12 are meant to suspend to RAM and suspend to disk,
    respectively. These key combinations seem to be recognized, but
    don't work properly. See the section on [ACPI](/#ACPI)
    below.
External/dual display
:   Fn-F7 is meant to switch between the LCD and external display. It
    has no effect. See the section on [external
    monitors](/#External_monitor) above.
Pointing stick/trackpad key
:   Fn-F8 is apparently meant to enable/disable the pointing stick and
    trackpad. It has no effect.
Enable/disable wireless
:   Fn-F5 is apparently meant to enable/disable the WLAN. I haven't
    tested it yet.
Lock screen
:   Fn-F2 locks the X display but doesn't turn off the monitor.
Turn off LCD
:   Fn-F3 turns off the LCD monitor but doesn't lock the screen.
Other key combinations
:   Fn-F9, Fn-PgUp, Fn-Space, Fn-Up, Fn-Left, Fn-Right, and Fn-Down all
    have symbols, but I'm not sure what they're supposed to do.

#### Special keys

The context menu key works out of the box; it seems to be mapped to
right-click. The Windows key and page forward/backward keys don't seem
to do anything. I haven't yet figured out how to configure them.

### ACPI

ACPI seems to be working insofar as it correctly reports battery life
and can turn off the LCD and external monitors. However, suspend-to-RAM
(Fn-F4) and suspend-to-disk (Fn-F12) do not work at all; pressing the
buttons have no effect. I have been trying various fixes but to no
avail:

1.  I tried adding the parameter acpi_sleep=s3_bios to
    /boot/grub/menu.lst and rebooting. After this, both Fn-F4 and Fn-F12
    correctly suspend to RAM or disk, respectively. However, the system
    does not resume from suspend mode.
2.  I tried modifying
    /usr/share/hal/fdi/information/10freedesktop/20-video-quirk-pm-lenovo.fdi
    as suggested at [Fedora 7 on my Thinkpad
    T61](http://vbraun.name/cms/node/6), but this results in the same
    problem (suspend but no resume).

The following pages contain further suggestions for getting suspend to
work, some of which I have not yet tried:

-   [Installing_Ubuntu_7.04_%28Feisty_Fawn%29_on_a_ThinkPad_T61](http://www.thinkwiki.org/wiki/Installing_Ubuntu_7.04_%28Feisty_Fawn%29_on_a_ThinkPad_T61#Suspend)
-   [Installing Debian Etch Linux on Lenovo Thinkpad T61 — Eric Jahn
    Blog](http://ejahn.net/Members/eric/stories/t61_etch)
-   [Installing_Ubuntu_8.04_%28Hardy_Heron%29_on_a_ThinkPad_T61](http://www.thinkwiki.org/wiki/Installing_Ubuntu_8.04_%28Hardy_Heron%29_on_a_ThinkPad_T61#Suspend_with_Nv140m)
-   [Fedora Core 7 on a Lenovo ThinkPad T61](http://lambda.uta.edu/T61/)
-   [Installing_Fedora_8_on_a_T61](http://www.thinkwiki.org/wiki/Installing_Fedora_8_on_a_T61#Suspend_to_RAM)
-   [Installing_openSUSE_10.3_Beta_1_on_an_IBM_ThinkPad_T61](http://www.thinkwiki.org/wiki/Installing_openSUSE_10.3_Beta_1_on_an_IBM_ThinkPad_T61#Powermanagement)
-   [Installing_openSUSE_10.3_GM_on_a_ThinkPad_T61](http://www.thinkwiki.org/wiki/Installing_openSUSE_10.3_GM_on_a_ThinkPad_T61#Suspend_and_Suspend_to_Disk)
-   [HARDWARE_Lenovo_Thinkpad_T61](http://gentoo-wiki.com/HARDWARE_Lenovo_Thinkpad_T61#Suspend_to_RAM)
-   [Installing Mandriva 2008 x86-64 Powerpack on a Thinkpad T61 -
    ThinkWiki](http://www.thinkwiki.org/wiki/Installing_Mandriva_2008_x86-64_Powerpack_on_a_Thinkpad_T61)
-   [FedoraForum.org - Getting Suspend working properly on a Lenovo
    T61](http://forums.fedoraforum.org/showthread.php?t=160325)
-   [Fedora 7 on my Thinkpad T61](http://vbraun.name/cms/node/6)
-   [HAL Quirk
    Site](http://people.freedesktop.org/~hughsient/quirk/index.html)

Links
-----

-   [T61 at ThinkWiki](http://www.thinkwiki.org/wiki/Category:T61)

Title: openSUSE 11.3 on a Dell Inspiron 1525
save_as: gnu_on_laptops/OpenSUSE_11.3_on_a_Dell_Inspiron_1525.html

# openSUSE 11.3 on a Dell Inspiron 1525

This document describes how I installed and configured
[GNU/Linux](http://www.gnu.org/gnu/linux-and-gnu.html) (64-bit [openSUSE
11.3](http://www.opensuse.org/) distribution) on a [Dell Inspiron
1525](http://support.dell.com/support/edocs/systems/ins1525/en/index.htm)
laptop. You may also be interested in [my previous guide to installing
openSUSE 10.3](/OpenSUSE_10.3_on_a_Dell_Inspiron_1525).

Technical specifications
------------------------

The Inspiron 1525 is available in various configurations. My system has
the following components:

<table>
<tr><th>Component           </th><th>Details</th></tr>
<tr><td>CPU                 </td><td>Intel Core2 Duo T8300 (2.40 GHz, 800 MHz FSB, 3 MB L2 cache)</td></tr>
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
<tr><td>Integrated camera   </td><td>OmniVision Laptop Integrated Webcam</td></tr>
<tr><td>Ports               </td><td>IEEE 1394 (FireWire)</td></tr>
<tr><td>  4× USB 2.0</td><td>&nbsp;</td></tr>
<tr><td>  RJ45 (Ethernet)</td><td>&nbsp;</td></tr>
<tr><td>  RJ11 (modem)</td><td>&nbsp;</td></tr>
<tr><td>  HDMI</td><td>&nbsp;</td></tr>
<tr><td>  S-Video</td><td>&nbsp;</td></tr>
<tr><td>  VGA</td><td>&nbsp;</td></tr>
<tr><td>  2× headphone</td><td>&nbsp;</td></tr>
<tr><td>  microphone</td><td>&nbsp;</td></tr>
<tr><td>  memory card reader</td><td>&nbsp;</td></tr>
</table>

Summary
-------

<table>
<tr><th>Component or feature</th><th>Details</th></tr>
<tr><td>Suspend to disk      </td><td>works out of the box</td></tr>
<tr><td>Suspend to RAM       </td><td>works out of the box</td></tr>
<tr><td>DVD                  </td><td>works out of the box</td></tr>
<tr><td>USB                  </td><td>works out of the box</td></tr>
<tr><td>Ethernet             </td><td>works out of the box</td></tr>
<tr><td>WLAN                 </td><td>works out of the box</td></tr>
<tr><td>FireWire             </td><td>not tested</td></tr>
<tr><td>graphics             </td><td>works out of the box</td></tr>
<tr><td>hard disk            </td><td>works out of the box</td></tr>
<tr><td>modem                </td><td>not tested</td></tr>
<tr><td>sound                </td><td>mostly working (see below)</td></tr>
<tr><td>memory card reader   </td><td>works out of the box</td></tr>
<tr><td>touchpad             </td><td>works out of the box</td></tr>
<tr><td>camera               </td><td>works out of the box</td></tr>
</table>

Details
-------

Most components and features work out of the box. Here is a description
of some components which required some configuration, or which I have
not yet gotten to work.

### Sound

There are many variants of the Intel 82801H (ICH8 family) sound card.
The one used in my Inspiron 1525 is a STAC9228, and still has a few
support issues detailed below.

See also:

-   [DellLinuxWiki](http://linux.dell.com/wiki/index.php/Tech/Audio)
-   [Hardware for Linux](http://hardware4linux.info/component/21335/)

#### No audio on boot or resume

When using the "default" kernel (kernel-default), the audio output works
as expected. However, [when using the "desktop" kernel (kernel-desktop),
there is no audio output after booting the system or resuming from
suspend](http://bugzilla.novell.com/show_bug.cgi?id=558979). There is a
workaround for this: first, install the latest hda-verb package from
[tiwai's openSUSE Build Service
repository](http://download.opensuse.org/repositories/home:/tiwai/openSUSE_11.3/x86_64/).
Then, whenever you boot or resume your computer, run the following
command as root:

`# hda-verb /dev/snd/hwC0D2 0x24 SET_VOLUME_KNOB 0x7f`

It should be possible to automate this process; there are probably some
scripts that run automatically on bootup or resume that this command can
be added to.

#### Garbled audio on resume

As mentioned above, there is no audio output when resuming from suspend,
but that's only if no audio was playing at the time the computer was
suspended. [If you suspend the computer while audio is playing, then
resume, you may find that whatever application which was playing audio
has locked up, and may be outputing irritating noise at full
volume.](https://bugzilla.novell.com/show_bug.cgi?id=633484) The only
solution is to kill the offending application.

#### No built-in microphone

The built-in microphone does not work. [According to Michael
Olberg](http://nain.oso.chalmers.se/index.php?q=node/21), this can be
fixed on Ubuntu by installing [Dell's backported
drivers](http://linux.dell.com/files/ubuntu/). I'm not sure how to solve
the problem on openSUSE, though. In the meantime I just use an external
microphone plugged into the microphone jack on the front of the machine.

#### No audio from right headphone jack

There are two headphone jacks on the front of the machine. [Only the
left one produces audio
output.](http://www.google.co.uk/search?sourceid=mozclient&ie=utf-8&oe=utf-8&q=82801h+%22second+headphone%22)
I haven't been able to figure out how to get any audio out of the right
one, though [DellLinuxWiki claims to have a fix for
Ubuntu](http://linux.dell.com/wiki/index.php/Ubuntu_7.10/Issues/Second_Headphone_Jack_Does_Not_Work)
which may work if you're using Gnome on openSUSE 11.3.

### Keyboard

The keyboard includes three volume control buttons, four media control
buttons, a "Home" button, and various Fn-key combinations. The volume
control buttons do not work out of the box; possibly they send standard
key codes which can be mapped with xkb. The other five special buttons I
haven't tested yet.

Fn-Up and Fn-Down correctly increase and decrease the LCD brightness,
respectively. Fn-F1 is meant to suspend to disk, but doesn't work. Fn-F3
is presumably meant to suspend to RAM, but this doesn't work either.
Fn-F8 switches between the local, external, and dual display modes; I
haven't tested this.

### Modem

The modem does not show up in the YaST Hardware Information application,
so I assume it is not working out of the box. However, I haven't
actually tried to use it, so I don't know. The modem is apparently part
of the Intel High Definition Audio chipset, and is identified as
follows:

```
$ cat /proc/asound/card0/codec#0
Codec: Conexant ID 2c06
Address: 0
Function Id: 0x2
Vendor Id: 0x14f12c06
Subsystem Id: 0x14f1000f
Revision Id: 0x100000
Modem Function Group: 0x2
```

This modem should therefore work with the [HSF (softmodem)
driver](http://www.linuxant.com/drivers/hsf/index.php).

See also:

-   [DellLinuxWiki](http://linux.dell.com/wiki/index.php/Tech/Modems)

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

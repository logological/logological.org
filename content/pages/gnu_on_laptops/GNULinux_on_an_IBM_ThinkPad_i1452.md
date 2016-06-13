Title: GNU/Linux on an IBM ThinkPad i1452
save_as: gnu_on_laptops/GNULinux_on_an_IBM_ThinkPad_i1452.html

# GNU/Linux on an IBM ThinkPad i1452

This document describes how I installed and configured
[GNU/Linux](https://www.gnu.org/gnu/linux-and-gnu.html) (henceforth
"Linux") on an IBM ThinkPad i1452 in November 1999. Because the
instructions contained herein are based largely on personal experience,
and because they were written several years ago, they should not to be
taken as the final authority on installing Linux on a 1452.

Though I have chosen to use [SuSE](http://www.suse.com/) 6.2, the
information here is fairly distribution-neutral. Furthermore, many
models of ThinkPad share similar hardware, so users of other ThinkPads
(particularly the 14*xx* series) may find this document of use as well.

Installation
------------

For the most part, this was a piece of cake. There were a few minor
caveats, however, so read on.

### Partitioning

If you're new to partitioning, I recommend you use a user-friendly tool
like [Partition Magic](http://www.partitionmagic.com/) 4.0 or higher to
do your (re)partitioning from Windows before you install Linux. You'll
want a swap partition of 64 to 96 MB, and ideally at least a gig for
everything else (the more the better). Linux doesn't care if it's
installed on a primary or extended partition. To make more room for your
Linux partition, there are several things you can do:

-   [IBM tech
    support](http://www.pc.ibm.com/support?lang=en_CA&page=brand&brand=IBM+ThinkPad)
    has confirmed that it's safe to archive the C:WINDOWSOPTIONS
    directory and then delete it. This directory contains all the CAB
    files that should have been provided on a Win98 CD. If you've got
    access to a CD burner, you might want to do this as it will free up
    about 200 MB.
-   If you don't plan on using Windows much, you should uninstall all of
    the preloaded software that you'll never use (ConfigSafe, PC-Doctor,
    AudioRack, IBM Global Network, *et al.*). This will probably save
    over 50 MB.
-   Finally, you can squeeze another 10–20% more space out of C: by
    running the Windows 98 FAT32 converter on it. Note, however, that
    some of the recovery CDs that ship with the 1452 will not work with
    FAT32 drives. This never bothered me, though, since it's possible to
    manually extract the files you need from the CD using your favourite
    unzip utility.

### X Windows

In SuSE 6.2, that the xsvga package is not installed in the default
configuration. This package is required to properly set up your X
server, so make sure you include it in the installation (you'll find it
under the `xsrv` category). If you already completed the installation
without selecting xsvga, simply run `yast` again and follow the menus to
change your configuration.

When your installation is complete, type `SaX` to start
[SuSE](http://www.suse.com/)'s X configuration program. You will be
asked to set up your mouse and keyboard; as long as xsvga is installed,
the video card and monitor will be automatically detected. In the last
window tab, I recommend choosing a resolution of 1024×768 at 16-bit
colour.

### Keyboard and screen size

The list of keyboard mappings you are asked to choose from in the
initial setup is woefully small. (This issue was of importance to me as
I use the [Dvorak](http://www.ccsi.com/~mbrooks/dvorak/dvorak.html)
layout.) Fortunately, there are a lot more mappings available once
installation is complete. To access them, run `yast` and select
"Adjustments of System" and then "Select Keymap". Scroll down until you
find the keymap you want; you'll have an opportunity to test each keymap
before it applies the changes. Note that "Dvorak / ANSI" refers to the
original [Dvorak](http://www.ccsi.com/~mbrooks/dvorak/dvorak.html)
layout with punctuation in odd places; most
[Dvorak](http://www.ccsi.com/~mbrooks/dvorak/dvorak.html) typists will
want to choose "Dvorak / dvorak" instead. Keyboard mappings will also
have to be assigned in [KDE](http://www.kde.org/) since it apparently
decides to get its keyboard input directly from BIOS.

Also in the "Adjustments" menu can be found a means of changing your
text screen font and screen size. If you've got good vision, you'll
probably want to put your monitor in an 80×50 text mode; to do this,
select "default 8x9" from the list.

### PCMCIA

When the install program originally asked me if I wanted PCMCIA support,
it shamelessly crashed with a "syntax error" of all things — so much for
that. [SuSE](http://www.suse.com/) 6.2 ships with an old version of the
PCMCIA module, anyway, which is known to be flaky with the OZ Micro
OZ6832/6833 CardBus controller in the ThinkPad. Newer versions (3.1.0+)
have supposedly fixed this; you can get them at the [Linux PCMCIA
Information Page](http://pcmcia.sourceforge.org/). Here's how to install
the drivers:

-   First, make sure you have the kernel sources installed. Run `yast`
    to change your configuration, find the kernel sources, and install
    them. (I did this by going to "Package Information" and doing a
    search for "kernel".)
-   Next, download [the drivers](http://pcmcia.sourceforge.org/) into
    /usr/src/linux/.
-   In that same directory, run <kbd>tar xvzf
    pcmcia-cs-3.1.3.tar.gz</kbd> (Substitute the name of the file you
    downloaded.)
-   <kbd>cd</kbd> to the new directory created by the previous command.
-   Type <kbd>make config</kbd>. In general, it's best to stick with the
    defaults, though I opted to install PnP BIOS resource checking.
-   Type <kbd>make all</kbd>
-   Type <kbd>make install</kbd>

Reboot, and if your card isn't correctly identified, you'll need to
consult the [PCMCIA HOWTO](http://pcmcia.sourceforge.org/). If you get a
<samp>cs: warning: no high memory space available!</samp> message, you
will most likely need to restrict the high memory scan in
/etc/pcmcia/config.opts to 0x40000000-0x40000fff. Some cards just plain
aren't supported; check the SUPPORTED.CARDS file for details.
Personally, I was unable to get my [Micra 10/100 Ethernet
Adapter](http://www.micra.com.au/PNETCI100.htm) to work at all. I ended
up trading it for a Netgear FA410TXC, which worked fine (well, almost —
see [Bugs](/#bugs) below.) Don't forget to edit your
/etc/pcmcia/network.opts file, as YaST doesn't seem to do this for you.

### Sound card

You need to install the [ALSA](http://www.alsa-project.org/) drivers to
get the ThinkPad's ESS Solo card to work in Linux. This is most easily
done during the initial installation, but if you're already through with
that then just run `yast` again. The relevant package is probably in the
`snd` category. Once [ALSA](http://www.alsa-project.org/) is installed,
create a file called /sbin/init.d/boot.d/S05soundon with the following
contents:

```
depmod -a
modprobe snd-esssolo1
modprobe snd-pcm1-oss
amixer master 100
amixer master unmute
amixer pcm 100
amixer pcm unmute
amixer cd 100
amixer cd unmute
```

Sound will be enabled next time you reboot. (If you want sound right
away, either type in the above commands manually or execute the file.)

*Update:* The above modifications to S05soundon may not work if you are
using a recent version of ALSA. Steve Dearth writes:

> It appears that the latest [ALSA](http://www.alsa-project.org/)
> release renamed a number of cards/modules. An updated version of their
> HOWTO was released yesterday and explained the renames… Anyway, as I
> mentioned before, I am running [RH6.1](http://www.redhat.com/) on an
> IBM Thinkpad 1452i and finally got around to recompiling my kernel.
> Noticed that there is now experimental support for the solo1. I
> enabled it and its been working great. Just thought you might like the
> info.

### DVD

The DVD drive in the ThinkPad functions as a normal CD-ROM in Linux.
When this document was originally written, there was no Linux DVD player
fit for public release.

### Modem

The [Winmodem](http://www.o2.net/~gromitkc/winmodem.html) installed in
the ThinkPad is virtually useless since it's not a real modem. People
are working on writing the necessary software to run Winmodems on Linux
— check out [Linux Winmodem Support](http://linmodems.org/) and also
[Richard Close's Winmodem page](http://www.close.u-net.com/). I haven't
yet heard of any success stories from ThinkPad owners using the existing
Winmodem software, but even if you could get your Winmodem working with
Linux, do you really want to give up 15% of your CPU time to run it? Get
an external serial modem or a PCMCIA modem instead.

### USB

At the time of this writing, [USB support](http://www.linux-usb.org/)
for Linux is still in an experimental stage; personally I haven't tried
playing around with it.

### Power Management

APM must be compiled into the kernel in order to access such things as
the battery level. Unfortunately, [SuSE](http://www.suse.com/) does not
install an APM-capable kernel by default, so I suppose you'll have to
build one yourself. I haven't gotten around to doing this myself, so I'm
afraid I'm not much help.

Not being a regular user of the hibernation function (<kbd>Fn-F12</kbd>
under Windows 98), I haven't done much research on how to get it too
working with Linux. If you check the other ThinkPad pages on the [Linux
on Laptops](http://www.linux-on-laptops.com/) site, you may find someone
else who has figured out hibernation. Don't restrict yourself to the
1452 pages; I'm sure hibernation is similar on all ThinkPads.

As for putting your system in standby mode, you'll be pleased to note
that your <kbd>Fn-F3</kbd> and <kbd>Fn-F4</kbd> buttons still work. I
have noted that the computer doesn't want to stay in standby mode when
it's connected to my LAN, so I have to go into root mode to shut off my
PCMCIA Ethernet card first. This is accomplished with <kbd>cardctl
suspend *n*</kbd>, where <kbd>*n*</kbd> is the socket number of the
Ethernet card. To resume from a suspend, I reactivate the card similarly
with <kbd>cardctl resume *n*</kbd>.

When resuming from a standby or hibernation, you will note that the
system clock has not been updated. (Linux does not assume a hardware
timer, using instead a software clock.) To resynchronize the software
clock with your PC's hardware timer, type in the following as root:
<kbd>hwclock --hctosys</kbd>.

To reduce the trouble of logging into root and manually manipulating
your network card and system clock each time you suspend and resume your
computer, you will probably want to set up a simple shell script, such
as the following, runnable via <kbd>sudo</kbd> or <kbd>su1</kbd>:

```bash
#!/bin/sh
cardctl suspend 0
echo "Press Fn-F4 to suspend now. Then, press enter to resume."
read
hwclock --hctosys
cardctl resume 0
```

Bugs/known issues
-----------------

-   In [KDE](http://www.kde.org), when I call back a hidden bottom panel
    by clicking on the bottom right corner, the display becomes garbled.
    I don't know whether this problem is unique to KDE and this model of
    Thinkpad.
-   Despite the fact that my network connection works perfectly, I still
    sometimes get errors during bootup with messages like "eth0: no such
    device".

Acknowledgments
---------------

Thanks to Scott Bronson, Wayne Sipkins, and all others who posted their
experiences with Linux on ThinkPads. Thanks to Steve Dearth for updates
on ALSA and kernel support for the ESS Solo1.

Special thanks to David Hinds for his help with PCMCIA.

Copyright
---------

This article is Copyright © 1999 [Tristan
Miller](mailto:psychonaut@nothingisreal.com). Permission is granted to
reproduce this work, in whole or in part, so long as this copyright
notice remains intact.

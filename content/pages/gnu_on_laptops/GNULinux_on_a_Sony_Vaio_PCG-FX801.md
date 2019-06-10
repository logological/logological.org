Title: GNU/Linux on a Sony Vaio PCG-FX801
save_as: gnu_on_laptops/GNULinux_on_a_Sony_Vaio_PCG-FX801.html
url: gnu_on_laptops/GNULinux_on_a_Sony_Vaio_PCG-FX801.html


# GNU/Linux on a Sony Vaio PCG-FX801

This document describes how I installed and configured
[GNU/Linux](https://www.gnu.org/gnu/linux-and-gnu.html) ([SuSE
9.0](http://www.suse.com/) distribution) on a Sony Vaio PCG-FX801
laptop.

Technical specifications
------------------------

<table>
<tr><th>Component           </th><th>Details</th></tr>
<tr><td>CPU                             </td><td>Mobile AMD Athlon XP 1400+</td></tr>
<TR><TD>RAM                             </TD><TD>256 MB</TD></TR>
<tr><td>Hard disk                       </td><td>20 GB</td></tr>
<tr><td>Modem                           </td><td>Internal V.90</td></tr>
<tr><td>Ethernet                        </td><td>Sony RTL-8139/8139C/8139C+</td></tr>
<tr><td>Monitor                         </td><td>Built-in 14.1" TFT display</td></tr>
<tr><td>Floppy drive                    </td><td>3.5" floppy</td></tr>
<tr><td>Graphics                        </td><td>ATI 3D Rage P/M Mobility AGP 2x</td></tr>
<tr><td>DVD drive                       </td><td>QSI DVD-ROM SDR-081</td></tr>
<tr><td>IEEE 1394 (FireWire) controller </td><td>Sony TSB12LV26</td></tr>
<tr><td>Sound                           </td><td>VT82C686 AC97</td></tr>
<tr><td>Ports                           </td><td>FireWire</td></tr>
<tr><td>  2× USB</td><td>&nbsp;</td></tr>
<tr><td>  2× PCMCIA</td><td>&nbsp;</td></tr>
<tr><td>  Ethernet</td><td>&nbsp;</td></tr>
<tr><td>  serial</td><td>&nbsp;</td></tr>
<tr><td>  parallel</td><td>&nbsp;</td></tr>
<tr><td>  VGA</td><td>&nbsp;</td></tr>
</table>

Summary
-------

<table>
<tr><th>Component or feature</th><th>Details</th></tr>
<tr><td>ACPI                        </td><td>not tested</td></tr>
<tr><td>APM                         </td><td>working</td></tr>
<tr><td>DVD                         </td><td>working</td></tr>
<tr><td>Ethernet                    </td><td>working</td></tr>
<tr><td>FireWire                    </td><td>not tested</td></tr>
<tr><td>floppy drive                </td><td>working</td></tr>
<tr><td>graphics                    </td><td>working</td></tr>
<tr><td>graphics, 3-D acceleration  </td><td>not tested</td></tr>
<tr><td>graphics, dual monitor mode </td><td>not working</td></tr>
<tr><td>hard disk                   </td><td>working</td></tr>
<tr><td>modem                       </td><td>not tested</td></tr>
<tr><td>parallel port               </td><td>not tested</td></tr>
<tr><td>PCMCIA                      </td><td>not tested</td></tr>
<tr><td>serial port                 </td><td>not tested</td></tr>
<tr><td>sound, MIDI                 </td><td>not tested</td></tr>
<tr><td>sound, wave                 </td><td>working</td></tr>
<tr><td>TV-out                      </td><td>not tested</td></tr>
<tr><td>USB                         </td><td>working</td></tr>
</table>

Details
-------

### Preparation and installation

The PCG-FX801 comes with Windows XP preinstalled. The 20 GB hard drive
initially has two 10-GB partitions, one of which is blank. At least one
of these partitions must be deleted in order to install GNU/Linux.

SuSE 9.0 was installed via network through my company's LAN.
Installation went off without a hitch.

### ACPI/APM power management

Battery monitors work as expected with APM. Suspend/resume with ACPI was
not tested, though there appears to be support for it built into the KDE
Control Center (System Administration→Sony Vaio Laptop).

### Graphics

The built-in ATI 3D Rage P/M Mobility AGP 2x card works well with the
standard ATI driver shipped with XFree86 4.3.0.1. 3-D acceleration was
not tested.

The graphics card supports dual head mode, allowing one to use both the
built-in LCD and an external monitor together for a single large
desktop. Unfortunately, support for this mode is not available with the
current XFree86 ATI driver. For further details, you can read the
following an exchange between the ATI driver developer and myself on the
XFree86 discussion list:

    From: Tristan Miller <psychonaut@nothingisreal.com>
    Subject: [XFree86] Multihead setup: ATI 3D Rage P/M Mobility AGP 2x and Xinerama
    Message-Id: <200411080143.15163.psychonaut@nothingisreal.com>
    Date: Mon, 8 Nov 2004 01:43:14 +0100
    
    Greetings.
    
    I am trying to set up a multihead display with the Xinerama extensions to 
    XFree86 4.3.0.1 on GNU/Linux (SuSE 9.0). I have a Sony Vaio laptop with a 
    3D Rage P/M Mobility AGP 2x video card. I know that this video card is 
    capable of dual display mode as I've got it working with Windows XP. I 
    also have no problem running single displays either on the built-in LCD or 
    on the external monitor (or on both, but of course in that case both 
    monitors display the same thing rather than separate desktops).
    
    I understand that for multiheaded video cards, the XF86Config file must be 
    set up with two "Monitor" and two "Screen" sections, one for each monitor, 
    and also two separate but nearly identical "Device" sections. If the video 
    card has two separate BusIDs (as revealed by /proc/pci), then each 
    "Device" section must specify a unique BusID. However, if the video card 
    has a single BusID, then the line "Screen 0" should be added to the first 
    "Device" section, and "Screen 1" to the second. (Sources: 
    <http://www.kclug.org/pipermail/kclug/2002-September/010412.html> and 
    <http://freedesktop.org/bin/view/XOrg/FAQMiscellaneous#How_do_I_set_up_a_multihead_conf>.)
    
    My video card has only one entry in /proc/pci:
    
      Bus  1, device   0, function  0:
        VGA compatible controller: ATI Technologies Inc Rage Mobility P/M AGP 
    2x (rev 100).
          IRQ 5.
          Master Capable.  Latency=66.  Min Gnt=8.
          Non-prefetchable 32 bit memory at 0xe9000000 [0xe9ffffff].
          I/O at 0x9000 [0x90ff].
          Non-prefetchable 32 bit memory at 0xe8100000 [0xe8100fff].
    
    Therefore I set up my XF86Config file with the "Screen 0"/"Screen 1" 
    variant. However, when I try to test the configuration, I get the 
    following error message (extracted from the log file /var/log/Xorg.0.log):
    
    (II) LoadModule: "ati"
    (II) Loading /usr/X11R6/lib/modules/drivers/ati_drv.o
    (II) Module ati: vendor="The XFree86 Project"
    	compiled for 4.2.0, module version = 6.4.7
    	Module class: XFree86 Video Driver
    	ABI class: XFree86 Video Driver, version 0.5
    (II) v4l driver for Video4Linux
    (II) ATI: ATI driver (version 6.4.7) for chipsets: ati, ativga
    (II) R128: Driver for ATI Rage 128 chipsets: ATI Rage 128 RE (PCI),
    	ATI Rage 128 RF (AGP), ATI Rage 128 RG (AGP), ATI Rage 128 RK (PCI),
    	ATI Rage 128 RL (AGP), ATI Rage 128 SM (AGP),
    	ATI Rage 128 Pro PD (PCI), ATI Rage 128 Pro PF (AGP),
    	ATI Rage 128 Pro PP (PCI), ATI Rage 128 Pro PR (PCI),
    	ATI Rage 128 Pro ULTRA TF (AGP), ATI Rage 128 Pro ULTRA TL (AGP),
    	ATI Rage 128 Pro ULTRA TR (AGP), ATI Rage 128 Mobility LE (PCI),
    	ATI Rage 128 Mobility LF (AGP), ATI Rage 128 Mobility MF (AGP),
    	ATI Rage 128 Mobility ML (AGP)
    (II) RADEON: Driver for ATI Radeon chipsets: ATI Radeon QD (AGP),
    	ATI Radeon QE (AGP), ATI Radeon QF (AGP), ATI Radeon QG (AGP),
    	ATI Radeon VE QY (AGP), ATI Radeon VE QZ (AGP),
    	ATI Radeon Mobility LW (AGP), ATI Radeon Mobility LY (AGP),
    	ATI Radeon Mobility LZ (AGP), ATI Radeon 8500 QL (AGP),
    	ATI Radeon 8500 BB (AGP), ATI Radeon 7500 QW (AGP)
    (II) Primary Device is: PCI 01:00:0
    (II) ATI:  Candidate "Device" section "Rage Mobility 1".
    (II) ATI:  Candidate "Device" section "Rage Mobility 0".
    (II) ATI:  Shared PCI/AGP Mach64 in slot 1:0:0 detected.
    (EE) ATI:  XF86Config Device sections "Rage Mobility 1" and "Rage Mobility 
    0" may not be assigned to the same adapter.
    (EE) No devices detected.
    
    Fatal server error:
    no screens found
    
    Apparently some part of my system (video driver? XFree86?) does not 
    recognize my video card as multihead-capable. Any suggestions on how to 
    work around this? Are there some other options I can use in the "Device" 
    sections to convince XFree86 that the card can drive two monitors with 
    separate displays?
    
    I have tried both the standard ati driver which comes with XFree86, and 
    also the ati.2 driver from <http://gatos.sf.net/>.
    
    For reference, below are the relevant sections of my XFree86.config file.
    
    Regards,
    Tristan
    
    Section "Monitor"
      Option       "CalcAlgorithm" "CheckDesktopGeometry"
      HorizSync    31-68
      Identifier   "Vaio LCD"
      ModelName    "1024X768@75HZ"
      VendorName   "--> LCD"
      VertRefresh  50-85
      UseModes     "Modes[0]"
    EndSection
    
    Section "Monitor"
      Option       "CalcAlgorithm" "CheckDesktopGeometry"
      HorizSync    81-81
      Identifier   "SyncMaster"
      ModelName    "SyncMaster 193T"
      VendorName   "Samsung"
      VertRefresh  75-75
    EndSection
    
    Section "Modes"
      Identifier   "Modes[0]"
      Modeline 	"1024x768" 94.50 1024 1072 1168 1376 768 769 772 808 +HSync 
    +VSync
    EndSection
    
    Section "Screen"
      DefaultDepth 24
      SubSection "Display"
        Depth      24
        Modes      "1024x768" 
      EndSubSection
      Device       "Rage Mobility 0"
      Identifier   "Screen 1"
      Monitor      "Vaio LCD"
    EndSection
    
    Section "Screen"
      DefaultDepth 24
      SubSection "Display"
        Depth      24
        Modes      "1024x768" 
      EndSubSection
      Device       "Rage Mobility 1"
      Identifier   "Screen 2"
      Monitor      "SyncMaster"
    EndSection
    
    Section "Device"
      BoardName    "3D Rage P/M Mobility AGP 2x"
      BusID        "1:0:0"
      Driver       "ati"
      Identifier   "Rage Mobility 0"
      Screen       0
      VendorName   "ATI"
      Option	"crt_screen"
    EndSection
    
    Section "Device"
      BoardName    "3D Rage P/M Mobility AGP 2x"
      BusID        "01:00:0"
      Driver       "ati"
      Identifier   "Rage Mobility 1"
      Screen       1
      VendorName   "ATI"
      Option	"crt_screen"
    EndSection
    
    Section "ServerLayout"
      Identifier   "Multihead"
      InputDevice  "Keyboard[0]" "CoreKeyboard"
      InputDevice  "Mouse[5]" "CorePointer"
      Option       "Clone" "off"
      Option       "Xinerama" "on"
      Screen       1 "Screen 2"
      Screen       0 "Screen 1" Relative "Screen 2" 1024 432
    EndSection
    
    Section "DRI"
        Group      "video"
        Mode       0660
    EndSection
    
    -- 
       _
      _V.-o  Tristan Miller [en,(fr,de,ia)]  ><  Space is limited
     / |`-'  -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=  <>  In a haiku, so it's hard
    (7_\     http://www.nothingisreal.com/   ><  To finish what you
    _______________________________________________
    XFree86 mailing list
    XFree86@XFree86.Org
    http://XFree86.Org/mailman/listinfo/xfree86

    From: Marc Aurele La France <tsi@ualberta.ca>
    Subject: Re: [XFree86] Multihead setup: ATI 3D Rage P/M Mobility AGP 2x and Xinerama
    Message-ID: <Pine.BSO.4.61.0411080835110.10235@login2.srv.ualberta.ca>
    Date: Mon, 8 Nov 2004 08:37:00 -0700 (MST)
    
    
    On Mon, 8 Nov 2004, Tristan Miller wrote:
    
    > I am trying to set up a multihead display with the Xinerama extensions to
    > XFree86 4.3.0.1 on GNU/Linux (SuSE 9.0). I have a Sony Vaio laptop with a
    > 3D Rage P/M Mobility AGP 2x video card. I know that this video card is
    > capable of dual display mode as I've got it working with Windows XP. I
    > also have no problem running single displays either on the built-in LCD or
    > on the external monitor (or on both, but of course in that case both
    > monitors display the same thing rather than separate desktops).
    
    > I understand that for multiheaded video cards, the XF86Config file must be
    > set up with two "Monitor" and two "Screen" sections, one for each monitor,
    > and also two separate but nearly identical "Device" sections. If the video
    > card has two separate BusIDs (as revealed by /proc/pci), then each
    > "Device" section must specify a unique BusID. However, if the video card
    > has a single BusID, then the line "Screen 0" should be added to the first
    > "Device" section, and "Screen 1" to the second. (Sources:
    > <http://www.kclug.org/pipermail/kclug/2002-September/010412.html> and 
    > <http://freedesktop.org/bin/view/XOrg/FAQMiscellaneous#How_do_I_set_up_a_multihead_conf>.)
    
    > My video card has only one entry in /proc/pci:
    
    >  Bus  1, device   0, function  0:
    >    VGA compatible controller: ATI Technologies Inc Rage Mobility P/M AGP
    > 2x (rev 100).
    >      IRQ 5.
    >      Master Capable.  Latency=66.  Min Gnt=8.
    >      Non-prefetchable 32 bit memory at 0xe9000000 [0xe9ffffff].
    >      I/O at 0x9000 [0x90ff].
    >      Non-prefetchable 32 bit memory at 0xe8100000 [0xe8100fff].
    
    > Therefore I set up my XF86Config file with the "Screen 0"/"Screen 1"
    > variant. However, when I try to test the configuration, I get the
    > following error message (extracted from the log file /var/log/Xorg.0.log):
    
    > (II) LoadModule: "ati"
    > (II) Loading /usr/X11R6/lib/modules/drivers/ati_drv.o
    > (II) Module ati: vendor="The XFree86 Project"
    > 	compiled for 4.2.0, module version = 6.4.7
    > 	Module class: XFree86 Video Driver
    > 	ABI class: XFree86 Video Driver, version 0.5
    > (II) v4l driver for Video4Linux
    > (II) ATI: ATI driver (version 6.4.7) for chipsets: ati, ativga
    > (II) R128: Driver for ATI Rage 128 chipsets: ATI Rage 128 RE (PCI),
    > 	ATI Rage 128 RF (AGP), ATI Rage 128 RG (AGP), ATI Rage 128 RK (PCI),
    > 	ATI Rage 128 RL (AGP), ATI Rage 128 SM (AGP),
    > 	ATI Rage 128 Pro PD (PCI), ATI Rage 128 Pro PF (AGP),
    > 	ATI Rage 128 Pro PP (PCI), ATI Rage 128 Pro PR (PCI),
    > 	ATI Rage 128 Pro ULTRA TF (AGP), ATI Rage 128 Pro ULTRA TL (AGP),
    > 	ATI Rage 128 Pro ULTRA TR (AGP), ATI Rage 128 Mobility LE (PCI),
    > 	ATI Rage 128 Mobility LF (AGP), ATI Rage 128 Mobility MF (AGP),
    > 	ATI Rage 128 Mobility ML (AGP)
    > (II) RADEON: Driver for ATI Radeon chipsets: ATI Radeon QD (AGP),
    > 	ATI Radeon QE (AGP), ATI Radeon QF (AGP), ATI Radeon QG (AGP),
    > 	ATI Radeon VE QY (AGP), ATI Radeon VE QZ (AGP),
    > 	ATI Radeon Mobility LW (AGP), ATI Radeon Mobility LY (AGP),
    > 	ATI Radeon Mobility LZ (AGP), ATI Radeon 8500 QL (AGP),
    > 	ATI Radeon 8500 BB (AGP), ATI Radeon 7500 QW (AGP)
    > (II) Primary Device is: PCI 01:00:0
    > (II) ATI:  Candidate "Device" section "Rage Mobility 1".
    > (II) ATI:  Candidate "Device" section "Rage Mobility 0".
    > (II) ATI:  Shared PCI/AGP Mach64 in slot 1:0:0 detected.
    > (EE) ATI:  XF86Config Device sections "Rage Mobility 1" and "Rage Mobility
    > 0" may not be assigned to the same adapter.
    > (EE) No devices detected.
    
    The message strikes me as fairly clear.  This isn't supported.  If you want to 
    know why, search the devel@ archives.
    
    Marc.
    
    +----------------------------------+-----------------------------------+
    |  Marc Aurele La France           |  work:   1-780-492-9310           |
    |  Computing and Network Services  |  fax:    1-780-492-1729           |
    |  352 General Services Building   |  email:  tsi@ualberta.ca          |
    |  University of Alberta           +-----------------------------------+
    |  Edmonton, Alberta               |                                   |
    |  T6G 2H1                         |     Standard disclaimers apply    |
    |  CANADA                          |                                   |
    +----------------------------------+-----------------------------------+
    XFree86 developer and VP.  ATI driver and X server internals.
    _______________________________________________
    XFree86 mailing list
    XFree86@XFree86.Org
    http://XFree86.Org/mailman/listinfo/xfree86

    From: Tristan Miller <psychonaut@nothingisreal.com>
    Subject: Re: [XFree86] Multihead setup: ATI 3D Rage P/M Mobility AGP 2x and Xinerama
    Message-Id: <200411081708.33557.psychonaut@nothingisreal.com>
    Date: Mon, 8 Nov 2004 17:08:33 +0100
    
    
    Greetings.
    
    On Monday 08 November 2004 16:37, Marc Aurele La France wrote:
    > > (EE) ATI:  XF86Config Device sections "Rage Mobility 1" and "Rage
    > > Mobility 0" may not be assigned to the same adapter.
    > > (EE) No devices detected.
    >
    > The message strikes me as fairly clear.  This isn't supported.  If you
    > want to know why, search the devel@ archives.
    
    I did search them, but couldn't find anything addressing this problem.  
    Searching for the name of my video card or for the "may not be assigned to 
    the same adapter" message didn't produce any useful results; the former 
    just had something about 2D acceleration.  If you're aware of a relevant 
    thread, could you please post a link or suggest some alternative keywords 
    I could try for a search?
    
    Thanks,
    Tristan
    
    -- 
       _
      _V.-o  Tristan Miller [en,(fr,de,ia)]  ><  Space is limited
     / |`-'  -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=  <>  In a haiku, so it's hard
    (7_\    http://www.nothingisreal.com/   ><  To finish what you
    _______________________________________________
    XFree86 mailing list
    XFree86@XFree86.Org
    http://XFree86.Org/mailman/listinfo/xfree86

    From: Marc Aurele La France <tsi@ualberta.ca>
    Subject: Re: [XFree86] Multihead setup: ATI 3D Rage P/M Mobility AGP 2x and Xinerama
    Message-ID: <Pine.BSO.4.61.0411111557220.5093@login2.srv.ualberta.ca>
    Date: Thu, 11 Nov 2004 16:02:21 -0700 (MST)
    
    
    On Mon, 8 Nov 2004, Tristan Miller wrote:
    
    > On Monday 08 November 2004 16:37, Marc Aurele La France wrote:
    >>> (EE) ATI:  XF86Config Device sections "Rage Mobility 1" and "Rage
    >>> Mobility 0" may not be assigned to the same adapter.
    >>> (EE) No devices detected.
    
    >> The message strikes me as fairly clear.  This isn't supported.  If you
    >> want to know why, search the devel@ archives.
    
    > I did search them, but couldn't find anything addressing this problem.
    > Searching for the name of my video card or for the "may not be assigned to
    > the same adapter" message didn't produce any useful results; the former
    > just had something about 2D acceleration.  If you're aware of a relevant
    > thread, could you please post a link or suggest some alternative keywords
    > I could try for a search?
    
    Well, after some digging, your best bet is probably ...
    
    http://xfree86.desiato.de/xfree86/pipermail/xpert/2000-August/000715.html
    
    This doesn't reference exactly the same problem, but it is related in the sense 
    that what you are talking about also involves the driver's current (in-)ability 
    to manage two CRTCs.
    
    Marc.
    
    +----------------------------------+-----------------------------------+
    |  Marc Aurele La France           |  work:   1-780-492-9310           |
    |  Computing and Network Services  |  fax:    1-780-492-1729           |
    |  352 General Services Building   |  email:  tsi@ualberta.ca          |
    |  University of Alberta           +-----------------------------------+
    |  Edmonton, Alberta               |                                   |
    |  T6G 2H1                         |     Standard disclaimers apply    |
    |  CANADA                          |                                   |
    +----------------------------------+-----------------------------------+
    XFree86 developer and VP.  ATI driver and X server internals.
    _______________________________________________
    XFree86 mailing list
    XFree86@XFree86.Org
    http://XFree86.Org/mailman/listinfo/xfree86

Title: Using Free Software at the University of Manitoba
slug: um-foss

# Using Free Software at the University of Manitoba

Much of the officially supported productivity and groupware software the University of Manitoba provides for faculty and staff is proprietary.  If it does not work the way you want, then you may find that it is impossible to fix it or improve it yourself, or to get any help or cooperation from the developers.  However, in many cases it is possible to use [Free Software](https://www.gnu.org/philosophy/free-sw.html) alternatives that suit your needs or that can be more easily improved.  This page aims to document these alternatives and provide some advice on choosing between them, configuring them, and running them.

## TLDR summary

For those who just want a quick overview of what to do:

* **MFA:** [Configure your MFA](https://mysignins.microsoft.com/security-info) to use a phone number or security key instead of Microsoft's proprietary app.
* **E-mail:** Use [Thunderbird](https://www.thunderbird.net/) or any other OAuth2-capable e-mail client—see below for the correct IMAP and SMTP settings.  If your client doesn't support OAuth2, then install the [DavMail](https://davmail.sourceforge.net/) gateway and have the client connect to it.
* **Calendar:** Install the [DavMail](https://davmail.sourceforge.net/) gateway and have [Thunderbird](https://www.thunderbird.net/), or any other CalDAV client, connect to it.
* **Address book:** Install the [DavMail](https://davmail.sourceforge.net/) gateway and have [Thunderbird](https://www.thunderbird.net/), or any other CardDAV/LDAP client, connect to it.
* **Chat:** Use [Pidgin](https://www.pidgin.im/) and the appropriate plugins to access Teams, Slack, etc.
* **Digital signatures:** Use [XCA](https://www.hohnstaedt.de/xca/) to create a self-signed certificate and [Okular](https://okular.kde.org/) or [LibreOffice](https://www.libreoffice.org/) to sign PDFs with it.
* **Office suite:** Microsoft 365 files can be downloaded for local editing with [LibreOffice](https://www.libreoffice.org/), and then uploaded again afterwards.
* **VPN:** Use [OpenConnect](https://www.infradead.org/openconnect/), though see below to work around issues with IST's non-working instructions.

## Multi-factor authentication

Most of the University's online services require multi-factor authentication.  Step 1 of the University's [MFA set-up page](https://mysignins.microsoft.com/security-info) instructs you to "download and install the Microsoft Authenticator app" for this purpose.  However, there is no need to install this proprietary app to use MFA!  You can instead jump straight to Step 4 and select a phone number or security key as your authentication method.

## E-mail

UM's e-mail system is hosted through a Microsoft Exchange server via Microsoft 365.  Fortunately, this service exposes standard IMAP and SMTP protocols for receiving and sending mail, respectively.  The protocols use Microsoft's so-called "Modern Authentication" (or OAuth2) mechanism, which many free mail clients do not (yet) support.  Clients that do support it include the following:

* [Alpine](https://alpineapp.email/)
* [Evolution](https://gitlab.gnome.org/GNOME/evolution/-/wikis/home)
* [FairEmail](https://email.faircode.eu/)
* [Mailspring](https://www.getmailspring.com/)
* [Mozilla Thunderbird](https://www.thunderbird.net/)

If your favourite e-mail client doesn't support OAuth2, you may be able to use it anyway with the help of an OAuth2 proxy such as [oauth2-proxy](https://github.com/simonrob/email-oauth2-proxy) or [DavMail](http://davmail.sourceforge.net/).  If you are using such a proxy, you will need to consult its documentation for how to configure it and your e-mail client.  (Tips on configuring DavMail are given elsewhere on this page.)

### Setting up incoming mail (IMAP)

For incoming mail, configure your e-mail client with the following settings.  (Note that the field names may vary from client to client.)

<dl>
<dt>Server type</dt>
<dd>IMAP</dd>
<dt>Server name</dt>
<dd>outlook.office365.com</dd>
<dt>Port</dt>
<dd>993</dd>
<dt>User name</dt>
<dd><em>Your.Email@umanitoba.ca</em></dd>
<dt>Connection security</dt>
<dd>SSL/TLS</dd>
<dt>Authentication method</dt>
<dd>OAuth2</dd>
</dl>

When you first configure your account, or when you check mail for the first time, your client will prompt you for multi-factor authentication.

### Setting up outgoing mail (SMTP)

For outgoing mail, configure your e-mail client with the following settings.  (Note that the field names may vary from client to client.)

<dl>
<dt>Server type</dt>
<dd>SMTP</dd>
<dt>Server name</dt>
<dd>smtp.office365.com</dd>
<dt>Port</dt>
<dd>587</dd>
<dt>User name</dt>
<dd><em>Your.Email@umanitoba.ca</em></dd>
<dt>Connection security</dt>
<dd>STARTTLS</dd>
<dt>Authentication method</dt>
<dd>OAuth2</dd>
</dl>

When you first configure your account, or when you send mail for the first time, your client will prompt you for multi-factor authentication.

### Junk mail filtering

Incoming mail that Microsoft deems to be suspicious is automatically filtered in two ways.  Some mail gets diverted to an IMAP folder named "Junk mail", and some mail gets "quarantined" into an area that you can access only by pointing a web browser to `https://security.microsoft.com/quarantine`.

You may not want either type of filtering if you prefer to use your own spam filtering software, or if you prefer not to have your mail filtered at all.  Unfortunately, there is no way to fully disable the server-side filtering.  You can consider the following workarounds for the filter that diverts mail to the "Junk mail" folder:

1. You can manage a list of "approved senders" through the Microsoft 365 web interface.  Mail from senders on this list will bypass the server-side junk mail checks that divert mail to the "Junk mail" folder.  The disadvantage of this method is that you have to manually manage the list (and of course that you have to do it through the proprietary web interface).

2. Your mail client may allow you to create a client-side filtering rule that automatically moves all incoming mail from the Junk mail folder to your inbox. Unfortunately, Thunderbird does not yet support filtering rules for mail arriving anywhere other than the inbox.

3. [Imap-CLI](https://github.com/Gentux/imap-cli) is a general-purpose command-line IMAP tool that you can configure to move all messages from one IMAP folder to another (say, from your "Junk mail" folder to your inbox).  You can then run it periodically (via a cron job, for example).  It supports OAuth2 authentication.

There is probably no workaround for the filter that "quaratines" e-mails into a special web interface.

### Content rewriting

The mail server is configured to automatically add an obnoxious "**Caution!** This message was sent from outside the University of Manitoba." banner to the body of all incoming e-mails sent from outside the University.  There is no way to disable this.  You can consider the following workarounds:

1. The server doesn't rewrite the main body of signed and/or encrypted messages, though it will add to the message a new MIME part containing the banner.  So if it's important that the integrity of your incoming messages be preserved, you could encourage your correspondents to sign and/or encrypt their mails (e.g., with OpenPGP).

2. Your mail client may allow you to create a client-side filtering rule that automatically rewrites the body of incoming messages.  If so, you could create a filter that looks for and removes the banner.

## Calendar

The University has at least two calendar systems: a [public calendar system for events](https://eventscalendar.umanitoba.ca/), and another system that hosts the personal calendars associated with umanitoba.ca e-mail accounts.

### Public events calendar

The [public calendar system for events](https://eventscalendar.umanitoba.ca/) can be used as-is with free software!  This system provides event information via web pages that can be viewed in a web browser, via an RSS feed that can be viewed in a feed aggregator, or via iCalendar files that can be subscribed to from an HTTP- or WebDAV-capable calendar client such as [Thunderbird](https://www.thunderbird.net/).

I recommend using the web interface to browse for event categories of interest to you.  (Follow the links in the drop-down menus near the top of the page.)  Once you are at the web page for a category, the "SUBSCRIBE" section in the right column of the page provides WebDAV or HTTP URLs that you can import into your calendar client:

1. For a WebDAV URL, click on the yellow Outlook icon.  This will open an "iCal Subscription" sidebar showing the URL for that category.  You can copy and paste this URL into your calendar client.
2. For an HTTP URL, click on the blue Google icon. This will open Google Calendar with an "Add calendar" dialog showing the URL for that category.  You can copy and paste this URL into your calendar client.

### Personal calendars

Personal calendars are hosted through a Microsoft Exchange server via Microsoft 365.  Unfortunately, it does not expose the standard CalDAV protocol, and most free calendar clients do not support Microsoft's proprietary protocols.  You can consider the following workarounds:

1. Install [DavMail](https://davmail.sourceforge.net/), a Java-based server that acts as a gateway between Microsoft's proprietary protocols and CalDAV.  You can then use any CalDAV-capable calendar client, such as [Thunderbird](https://www.thunderbird.net/), and have it connect to your DavMail server.
2. Use [Thunderbird](https://www.thunderbird.net/), which has an integrated calendar to which Microsoft Exchange support can be added via the [TbSync](https://addons.thunderbird.net/En-us/thunderbird/addon/tbsync/) and [Provider for Exchange ActiveSync](https://addons.thunderbird.net/En-us/thunderbird/addon/eas-4-tbsync/?src=ss) add-ons.  (Note that you must install _both_ add-ons.)

In my experience, both DavMail and TbSync are a bit buggy, which is inevitable considering that they aim to reverse-engineer a complex, largely undocumented, and constantly changing protocol.  However, their respective developers are very responsive to bug reports.  I find DavMail to be the more reliable and versatile of the two, though it is more complicated to set up than TbSync.

### Setting up DavMail (basic instructions)

1. Download and install DavMail.  The author provides [prepackaged versions for Windows, Mac OS X, Debian, and other systems](https://davmail.sourceforge.net/download.html) on his website, and [prepackaged versions for CentOS, Fedora, and openSUSE](https://software.opensuse.org//download.html?project=home%3Amguessan%3Adavmail&package=davmail) via the openSUSE Build Service.
2. Configure the DavMail server.  To do this, go to the [DavMail website](https://davmail.sourceforge.net/) and follow the relevant setup instructions in the "DavMail setup" section of the navigation menu and in the "Office 365" and "Is Office 365 modern authentication / MFA supported?" sections of the [FAQ](https://davmail.sourceforge.net/faq.html).
3. Configure your calendar client.  To do this, go the [DavMail website](https://davmail.sourceforge.net/) and follow the relevant calendar setup instructions in the "Thunderbird Setup", "OS X Setup", "Android Setup", or "iPhone Setup" section of the navigation menu.  If you are using a different calendar client, you should be able to adapt the Thunderbird setup instructions.

On my openSUSE machines, I install DavMail using the repositories provided by the openSUSE Build Service.  (I add these repositories to Zypper so that any available upgrades to DavMail are fetched and installed whenever I do a system update using `zypper up` or `zypper dup`.)

I run DavMail as a headless systemd service in `O365Manual` mode, but to do the initial setup, I first ran it as a GUI application.  This allowed me to interactively perform the MFA and get the OAuth2 access token for use in the `davmail.properties` configuration file.  Step-by-step instructions on setting up DavMail to run interactively or as a systemd service are provided in the following two sections.

### Setting up DavMail to run in a local user account

1. Launch DavMail from your local user account.  A DavMail icon will appear in your system tray.
2. Right-click on the DavMail icon in your system tray and select "Settings…".
3. In the "Main" tab, select "O365Manual" as the Exchange Protocol.
4. Check the boxes for all the services you want to create a gateway for (POP or IMAP for incoming mail, SMTP for outgoing mail, Caldav for calendar, and LDAP for address book).
5. Press the "Save" button.
6. Launch Thunderbird.  (You could alternatively use any other CalDav-capable calendar application, though you will need to adapt the rest of these instructions accordingly.)
7. In the Calendar tab, press the "New Calendar…" button.  A "Create New Calendar" dialog appears.
8. Select "On the Network" and press the "Next" button.
9. In the "Username" field, enter your full umanitoba.ca e-mail address (e.g., `FirstName.LastName@umanitoba.ca`).
10. In the "Location" field, enter `http://localhost:1080/users/FirstName.LastName@umanitoba.ca/calendar` (substituting your e-mail address) and press the "Find Calendars" button.  An "Authentication Required" dialog appears.
11. Enter your UMNet password and press the "OK" button.
12. An "Office 365 - Manual authentication" dialog appears.  Press the "Open" button to open the MFA page in your web browser (or alternatively, press the "Copy to clipboard" button and then paste the URL into the address bar of your web browser).  If your browser is not already logged into the UM MFA system, you may be prompted for your username and password and for an MFA token.  Your browser will then be redirected to a _blank_ page.
13. Check your browser's address bar for the URL of this blank page.  It will look something like the following:  `https://login.microsoftonline.com/common/oauth2/nativeclient?code=SOME_EXTREMELY_LONG_STRING_OF_CHARACTERS&session_state=SOME_SHORT_STRING_OF_CHARACTERS`.  Copy the value of the `code` field (`SOME_EXTREMELY_LONG_STRING_OF_CHARACTERS` in the example here) and paste it into the "Authentication code" field of DavMail's "Office 365 - Manual authentication" dialog, and then press the "Send" button.
14. Back in Thunderbird's "Create New Calendar" dialog, you may be prompted whether to subscribe to a CalDAV or iCalendar calendar.  The default option should be fine. Press the "Properties" button. An "Edit Calendar" dialog appears.
15. Give the calendar a name and, if desired, a colour.  Press the "OK" button.  You will be returned to the "Create New Calendar" dialog.
16. Press the "Subscribe" button.
17. Wait a minute or two for DavMail and Thunderbird to perform the initial sychronization of your new calendar.
18. You can now begin using your calendar!  You will need to keep DavMail running for this, so if you log out of your account or reboot machine, remember to restart it, or configure your account to automatically start it on login.  Alternatively, you can configure DavMail to run as a system service (see below).
19. The authentication code you entered in a previous step is valid only for 90 days.  (After 90 days, DavMail will probably prompt you again for a new code.)

### Configuring DavMail to run as a system service

These instructions assume that you have installed a packaged version of DavMail that includes systemd configuration files.

1. Follow the instructions above to set up DavMail to run in a local user account.
2. Quit DavMail and launch a root shell.
3. Copy `$HOME/.davmail.properties` to `/etc/davmail.properties`.
4. Open `/etc/davmail.properties` in a text editor.  Locate the line that sets the key `davmail.mode` and make sure that it reads `davmail.mode=O365Manual`.  Also locate the line that sets the key `davmail.logFilePath` and set the value to something sensible – e.g., `davmail.logFilePath=/var/log/davmail.log`.
5. Start the system-wide DavMail service: `systemctl start davmail.service`
6. Verify that the service started correctly by running `systemctl status davmail.service`.  If a problem is indicated, consult the log file you set in a previous step.
7. Verify that your calendar client is able to connect to the service, such as by creating an event.
8. If everything is working, you can configure your system to automatically start the DavMail service on boot: `systemctl enable davmail.service`.
9. Remember that your authentication code is valid only for 90 days.  However, when DavMail runs as a system service, it won't prompt you for a new code, and Thunderbird might not emit any error messages.  You should set a reminder to manually get a new code.  To get a new code, first stop the system-wide DavMail service by running `systemctl stop davmail.service` as root.  Then launch DavMail in your user account and have Thunderbird connect to the calendar, in which case DavMail should prompt you once again for the authentication code.  You can then quit DavMail, copy the new code from the end of `$HOME/.davmail.properties` to `/etc/davmail.properties`, and restart the system-wide DavMail service with `systemctl start davmail.service`.

## Address book

UM's address book is hosted through a Microsoft Exchange server via Microsoft 365.  Unfortunately, it does not expose the standard CardDAV or LDAP protocols, and most free e-mail/address book clients do not support Microsoft's proprietary protocols.  You can consider the following workarounds:

1. Install [DavMail](https://davmail.sourceforge.net/), a Java-based server that acts as a gateway between Microsoft's proprietary protocols and CardDAV or LDAP.  You can then use any CardDAV- or LDAP-capable client, such as [Thunderbird](https://www.thunderbird.net/), and have it connect to your DavMail server.
2. Use [Thunderbird](https://www.thunderbird.net/), which has an integrated address book to which Microsoft Exchange support can be added via the [TbSync](https://addons.thunderbird.net/En-us/thunderbird/addon/tbsync/) and [Provider for Exchange ActiveSync](https://addons.thunderbird.net/En-us/thunderbird/addon/eas-4-tbsync/?src=ss) add-ons.  (Note that you must install _both_ add-ons.)

You can set up DavMail for CardDAV/LDAP clients using instructions similar to those given above for CalDAV clients.

## Office suite

The Microsoft 365/Teams service used by the University includes an office suite, with browser-based versions of Microsoft Word, Excel, and PowerPoint.  These online tools can export documents to OpenDocument format, which you can download and edit locally with free tools such as [LibreOffice](https://www.libreoffice.org/).  The online tools similarly allow documents to be uploaded and imported from OpenDocument format.

### Letterhead

The University provides [letterhead](https://umanitoba.sharepoint.com/sites/um-intranet-um-brand/SitePages/template-and-asset-library.aspx) in Microsoft Word and PDF formats.  The Word versions can be used with free word processors such as [LibreOffice Writer](https://www.libreoffice.org/discover/writer/).  The author of this guide has produced a [LaTeX](https://www.latex-project.org/) version of the letterhead that he hopes to one day release here.

## Digital signatures

Various University offices will occasionally send you PDFs and ask you to digitally sign them.  There exist various free software tools that can sign PDFs with an existing PKCS#12 certificate:

1. [LibreOffice](https://www.libreoffice.org/) can sign PDFs with an existing certificate:
    1. Launch LibreOffice and select File → Digital Signatures → Sign Existing PDF….  A file picker dialog will appear; select the PDF on your filesystem that you want to sign and press the "Open" button.  The PDF will open in a new window.  Press the "Sign Document" banner at the top of the window.  This will bring up a "Digital Signatures" dialog listing the document's current signatures.  Press the "Sign Document…" button to select one of your existing signatures and sign the document.  If you haven't yet configured any signatures, you should first press the "Start Certificate Manager…" button, which will launch your system's default certificate management software.
2. [Okular](https://okular.kde.org/) can sign PDFs with an existing certificate:
    1. First, make sure that Okular is configured to use your existing certificate database: launch Okular and go to Settings → Configure Backends.  In the setting dialog that appears, select "PDF".  If you don't see your certificate in the Available Certificates list, then you may need to specify the path to your certificate database by pressing the radio button next to "Custom" and then pressing the file picker icon or typing the path to the database file (e.g., `$HOME/.pki/nssdb`) in the input field.  Press "OK" when done.
    2. To actually sign a PDF, open it with Okular, scroll to the location in the document where you want the signature to appear, and select Tools → Digitally Sign.  You will be prompted to draw a rectangle where you want the signature to appear on the page.  Then a dialog will appear prompting you to select a certificate to sign with, as well as a reason, location, and an image.  (Make sure you actually click on the desired certificate and the desired image, even if there is only one choice.)  Press "OK" and you will be prompted for where to save the signed version of the PDF.

If you don't yet have a PKCS#12 certificate, you will need to create one.  There are at least a couple options for this:

1. You can use the command-line tool [OpenSSL](https://www.openssl.org/).  (Instructions forthcoming.)
2. You can use the graphical [XCA](https://www.hohnstaedt.de/xca/) tool and the Mozilla NSS tools.  Here are some rough notes:
    1. Launch XCA.  Create a new database (File → New DataBase).
    2. Start creating a new certificate by pressing the New Certificate button.  A new dialog window will pop up.
    3. In the "Signing" frame of the "Source" tab, select "Create a self signed certificate".
    4. In the "Subject" tab, enter an Internal Name to identify the certificate internally, and then fill in the fields in the "Distinguished name" frame.  The "countryName" should be a two-letter ISO code and the "commonName" should be your personal name.  Press "Generate a new key" to generate a private key.
    5. In the "Extensions" tab, set the Type to "Certification Authority".  If desired, adjust the validity period for the certificate.
    6. In the "Key usage" tab, check the "Critical" box in the "X509v3 Key Usage" frame.
    7. Press the OK button.  The dialog box disappears and the newly generated certificate now appears in the main window.
    8. Select the newly generated certificate and press the "Export" button.  An export dialog appears.
    9. Choose the name and filename, and set the Export Format to PKCS #12.
    10. Press the OK button.
    11. In a terminal, import the certificate into the PKI store: `pk12util -d sql:$HOME/.pki/nssdb -i /path/to/your/new/certificate.p12`

## Chat/team communication

The University's Microsoft 365 service includes Microsoft Teams, which can be used for chat and video conferencing.  There is no need to install Microsoft's proprietary Teams application in order to access Teams, as you can access Teams through a free web browser such as [Firefox](https://mozilla.org/firefox) or [Chromium](https://www.chromium.org/Home).  However, note that the web interfaces themselves contain proprietary JavaScript, and accessing Teams through a standalone web browser may not be as convenient as using a dedicated application.  Some alternatives to consider:

1. Use [Pidgin](https://www.pidgin.im/), the universal chat client, with the [MS Teams Plugin](https://github.com/EionRobb/purple-teams).  This lacks support for certain features (calls, message reactions, etc.) but does support basic chat.  This solution is 100% free software.

2. Use [Ferdium](https://www.ferdium.org/), a desktop application that embeds web versions of various apps, including Teams.  It can do pretty much everything the web-based versions of Teams can do, but only because it runs the same proprietary JavaScript.

Individual academic units within the university may use Slack, another proprietary chat/team communication tool.  Both Pidgin (via [slack-libpurple](https://github.com/dylex/slack-libpurple)) and Ferdium support Slack as well, with the same respective advantages and disadvantages as their Teams support.

## VPN

[IST's VPN support page](https://umanitoba.ca/information-services-technology/my-security/vpn-support) links to some [VPN instructions for Linux](https://ithelp.umanitoba.ca/a/1635613-vpn-instructions-for-installing-linux-vpn) that discuss connecting to the VPN with [OpenConnect](https://www.infradead.org/openconnect/), a client that works not just with GNU/Linux but most other popular operating systems.

Unfortunately, IST's instructions for using OpenConnect no longer seem to work; the client now throws a "Failed to find or parse web form in login page" error, possibly as a result of changes made to UM's (pre-)sign-in web page in 2024. It is possible to work around the problem by manually passing an authentication cookie to openconnect using the `-C` command-line option.  Where does one get such a cookie?  One option is [openconnect-pulse-gui](https://github.com/utknoxville/openconnect-pulse-gui), a Python script that will bring up an interactive web interface for you to do MFA, capture the resulting authentication cookie, and print it out on the console for you.  In fact, the script prints out the complete OpenConnect command line that you can simply copy and paste into your command shell; this will get you connected to the VPN with no further prompting.

At least on my openSUSE systems, I find there are two problems with how OpenConnect sets up the VPN tunnel:

1. By default, only certain network traffic gets routed through the VPN.  If you want _all_ traffic to be routed through the VPN, then you should add the line `CISCO_SPLIT_INC=` somewhere near the top of the `vpnc-script` script that OpenConnect runs upon establishing a connection.  On openSUSE, this script is located at `/etc/openconnect/vpnc-script`; on Debian it is located at `/usr/share/vpnc-scripts/vpnc-script`.

2. My computer's DNS settings (in `/etc/resolv.conf`) don't get changed, so I can't refer to my UM computers by name.  I don't yet have a workaround for this.


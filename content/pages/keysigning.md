title: Key-signing party
save_as: keysigning.html

# Key-signing party

An OpenPGP key-signing party will be held on Thursday, 8 September at
12:00 in room S2|02 A126 of Technische Universität Darmstadt.
Everyone is welcome to attend, whether or not they previously signed
up, so feel free to forward this page to friends or colleagues.

## What is a key-signing party?

A key-signing party is an opportunity for OpenPGP users to sign each
other's public keys and grow the Web of Trust.  Some background
material:

* [The GNU Privacy Guard (GnuPG)](https://gnupg.org/)
* [GnuPG for Beginners](https://github.com/logological/GnuPGforBeginners/raw/master/GnuPGforBeginners.pdf) (tutorial slides by Tristan Miller)
* [The Keysigning Party HOWTO](http://www.cryptnet.net/fdp/crypto/keysigning_party/en/keysigning_party.html)

## Before the party

If you don't yet have an OpenPGP keypair, you will need to create one.
Refer to the websites listed above if you need help.

E-mail your public key to me, Tristan Miller, at
[miller@ukp.informatik.tu-darmstadt.de](mailto:miller@ukp.informatik.tu-darmstadt.de)
as soon as possible, but in any event before 16:00 on Wednesday, 7
September.  To do this with GnuPG, use the following command:

    $ gpg --armor --export MY_KEY_ID > MY_KEY_ID.asc

Then attach `MY_KEY_ID.asc`, or copy and paste its contents, in an
e-mail message to me.  I will make a list of all the keys and
distribute it at the party.  On this web page I will also make
available
**[a GnuPG keyring containing all the keys](https://logological.org/party_keyring.gpg)**.


## What to bring to the party

Everyone should bring the following to the party:

* A pen or pencil.

* Something to identify yourself with.  Your friends and close
  colleagues may be happy to identify you by your face alone, but
  strangers might want third-party proof, such as your
  student/employee ID card, passport, or driving licence.

* A scrap of paper containing your public key's 40-digit fingerprint.
  You can obtain this from GnuPG as follows:

        $ gpg --fingerprint MY_KEY_ID

* **No computer!**  Do not bring or use laptops, tablets, or smartphones
  at the party.  The party is only for identifying paricipants and
  connecting them to keys; the actual signing of keys will take place
  *after* the party, in the security of your own home or office.


## At the party

We will use the following protocol:

1. The list of keys will be projected on a screen, and hard copies
   will be given to all participants.  The list shows the ID, owner,
   and fingerprint of each key.  Next to each key will be two
   checkboxes: one for verifying that the fingerprint matches, and one
   for verifying that the owner's identity matches.  The list will
   look something like this:<br /><br
   />![Sample list of keys](images/keysigning_list.png)

2. The keys on the list are numbered.  Everyone lines up in that order.

3. I will call out the name of each participant in order.  When your
   name is called, confirm whether your key's fingerprint and owner
   are correctly listed on your hard copy and on the screen.  When
   someone else's name is called, listen for their confirmation, and
   if they give it, place a checkmark in the "key info" column next to
   their key in your list.  (We do this step to make sure that
   everyone has the same copy of the list, and that it contains the
   correct information.)

4. Once all the key data has been confirmed, the line of participants
   folds over on itself to form a double line.  So now the first
   person on the list is facing the last person, the second person on
   the list faces the second-last person, and so on.

5. Next, each participant in the line will *identify* every other
   participant.  Start with the person standing in front of you:
   examine their proof of identity, and if you are satisfied with it,
   then place a checkmark in the "owner ID" column next to their key
   in your list.  The person standing in front of you will likewise
   check your identity.  Once both identity checks are complete, take
   one step to the right to meet the next person.  (If you're at the
   end of a line, move across to the opposite line.)

6. After everyone has confirmed each other's identity, the party is
   over!  Take your copy of the key list back to your home or office.


## After the party

Back at your home or office computer, you should sign and republish
all the keys (and only those keys) that you verified at the party.
Here is a suggested workflow:

1. Download the GnuPG keyring that I will post on this page after the
   party.  It should contain all the keys from the list.

        $ wget https://logological.org/party_keyring.gpg

2. Import the keys to your default keyring:

        $ gpg --import party_keyring.gpg

3. Now pull out your hard copy of the key list from the party.  For
   every key on the list where you made both checkmarks, check that
   the fingerprint in the keyring matches the one on the list:

        $ gpg --fingerprint KEY_ID

4. If the fingerprints match, then sign the key:

        $ gpg --sign-key KEY_ID

5. Upload the signed key to a well-connected keyserver:

        $ gpg --keyserver hkp://pool.sks-keyservers.net --send-key KEY_ID

6. Optionally, e-mail the key's owner a copy of their signed key.
   Recall that you can export a single key as follows:

        $ gpg --armor --export KEY_ID > KEY_ID.asc

If/when you receive signed copies of your own key as an e-mail
attachment, you can import the new signatures into your own keyring:

    $ gpg --import MY_KEY_ID.asc

Alternatively, you can retrieve the signed versions of your own key
(and the other participants' keys) from a keyserver:

    $ gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys KEY_ID

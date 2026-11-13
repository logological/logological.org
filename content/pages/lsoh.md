title: Little Shop of Horrors
slug: lsoh

# Little Shop of Horrors

**Little Shop of Horrors** is a multiplayer online game by LunaTech, loosely based on [the 1986 musical film of the same name](https://en.wikipedia.org/wiki/Little_Shop_of_Horrors_(film)).  It is written in CBM BASIC 2.0 and interoperates with [C*Base 3.0](https://en.wikipedia.org/wiki/C*Base), a dial-up BBS program for the Commodore 64 that was popular in the early 1990s.

In 1994 I began work on an unofficial port of _Little Shop of Horrors_ to [Microsoft QuickBASIC 4.5](https://en.wikipedia.org/wiki/QuickBASIC), with the idea of making the game compatible with popular DOS-based BBSes.  I never finished the port, and eventually lost my copy of the original _Little Shop of Horrors_.  Unfortunately, neither the original game nor any documentation for it has been archived anywhere on the Web, and so I am publishing this incomplete port for historical purposes.  The port does implement most of the basic game logic and provides ANSI-style conversions of the original PETSCII interface, so there is probably enough here for a dedicated programmer to infer and implement the missing parts.

Anyone who has a copy of the original game, or any further information about it or its developer, is invited to get in touch with me.

## Screenshots

<img src="{static}/images/lstitle.png" style="max-width: 100%" alt='ANSI artwork of a two-headed carnivorous plant with the text "Little Shop of Horrors"' title="Title screen">

<img src="{static}/images/lsmenu.png" style="max-width: 100%" alt='ANSI artwork of a smiling carnivorous plant with a gameplay menu in a speech bubble' title="Main menu">

<img src="{static}/images/lsstats.png" style="max-width: 100%" alt="The game's stats screen" title="Stats screen">

### Source code

You can 
[browse, download, or clone the source code and instructions on GitHub](https://github.com/logological/LittleShopOfHorrors/).

## Gameplay

The game is played asynchronously, with each player being one of the callers to the BBS.  Players are permitted a certain number of turns per real-time day.

The game's action takes place across ten apartment buildings on Skid Row; each apartment has four floors and each floor contains a single apartment.  Each player takes the role of a resident of one of these apartments.  New players are randomly assigned a vacant apartment and a man-eating plant that they must name.  (If all 40 apartments are occupied, then prospective new players must wait for an existing player to be evicted.)  The object of the game is to nurture one's plant into a mean, green killing machine and use it to eliminate every other player.

Plants start with five limbs and a certain number of pints of blood.  The blood serves as the plant's food supply, which is steadily consumed throughout the game and which can be replenished through fights and other events.  Plants are characterized by a growth stage that helps determine their fighting ability; the growth stage can increase or decrease according to certain events in the game.  Plants also have the ability to bud Venus flytraps that their owner can use to guard their apartment while they sleep.

Each player must select a time (as measured by the BBS's real-time clock) at which they and their plant go to sleep for eight hours.  While sleeping, players are vulnerable to attacks by other players, and so should schedule their sleep time when others are unlikely to dial into the BBS to play.

If a plant loses all its limbs or runs out of blood, it dies and its owner is evicted from their apartment.  An evicted player is out of the game, but can try rejoining as a new player the next day.

If one player manages to kill all the other players, then they win and no further play is permitted until the sysop resets the game.

### Attacking other players

On each turn, a player selects another apartment to visit together with their plant:

* If the apartment is unoccupied or has already been visited by the player that day, the turn is over.
* If the apartment's occupants are awake, then most of the time the player is repelled, though there is a slight chance that the player manages to slash off a limb of the resident's plant for their own plant to feast on.
* If the apartment's occupants are asleep but they have laid a trap, then the player can disarm it if they have weedkiller.  Otherwise, the trap explodes, repelling the player and possibly draining some blood from their plant.
* If the apartment's occupants are asleep and there is no trap, or the player has just disarmed the trap, then the player can select among the following options:
  * Rob the resident of their money.
  * Attack the resident's plant, slashing off a limb.  This nets the player 150 points and 50 to 100 pints of blood.
  * Pit the two plants against each other in a duel.  Each plant's strength is determined by its growth stage, number of limbs, and blood supply.  A plant kills its opponent if it is five times stronger.  If the player wins, they take the loser's money, but if their plant dies in the duel, they are evicted.
  * Use weedkiller on the resident's plant (if the player has any).
  
The outcome of fights and duels is recorded in the news, which all players can read.

### Random events

When the player begins their turns for the day, one of 21 random events occurs.  Some events are pure flavour (the plant complains, quips, hints that the player could use a map, etc.), but some of them can affect the game.  These include the following:

* **Plant eats a little old lady:** +100 score
* **Player finds an unattended ambulance:** +100 blood, +100 score
* **Plant buds a Venus flytrap:** +1 trap, +50 score
* **Plant grows a stage:** +1 growth stage, +100 score
* **Hybrid Horror contest:** a random player wins $75–175 and +200 score
* **Player finds money:** +$1–100
* **Player finds weedkiller:** +50 score
* **"This round is on ME!":** +2 turns
* **Plant gets mites:** −10 score
* **Player finds a map:** shows the player the location of all sleeping residents
* **Player receives a second plant:** the player may feed it to their existing plant for +50 blood, or have the two plants fight to the death, in which case the player keeps the victor

## Credits and licence

The original _Little Shop of Horrors_ was credited to an entity known as "LunaTech".  I have no information about them apart from the name.

The following copyright and licence notice applies to this QuickBASIC port:

Copyright © 1994 [Tristan Miller](https://logological.org/) ([tristan@logological.org](mailto:tristan@logological.org))

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <[https://www.gnu.org/licenses/](https://www.gnu.org/licenses/)>.

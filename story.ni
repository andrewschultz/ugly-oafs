"Ugly Oafs" by Perry Creel

the story headline is "Save Green Terra! Repel the Wrath Pulse! A wordplay game"

the story description is "Or better: find the FRY GUN to dispel the pulse for good."

[this is the source as of noon Central, 10/26/2014. It may have small changes since then, but if you want to see the puzzles/coding/etc., it's all here. I hope you enjoy it.]

volume top level stuff

book basics

release along with cover art.

release along with the source text.

book included extensions

include Object-Based Hinting by Andrew Schultz. [requires Basic Debugging by Andrew Schultz]

include Trivial Niceties by Andrew Schultz.

[These aren't earth-shaking, but they're at:
https://www.dropbox.com/s/hc64gcof28um1wq/Basic%20Debugging.i7x
https://www.dropbox.com/s/tbxoyl2g59k2ppn/Object-Based%20Hinting.i7x
https://www.dropbox.com/s/i4nfnncf3i4mrmo/Trivial%20Niceties.i7x
]

section extensions you can find at inform7.com

include Basic Screen Effects by Emily Short.

section testing extensions - not for release

include Property Checking by Emily Short. [modified trivially to track the # of things undescribed as well as toggle something as unimportant--seriously, if you don't use this extension, you should.]

[include Object Response Tests by Juhana Leinonen. [This is also a serious bug fighting weapon to make your testers sweat less.]
]
book rules

the block listening rule is not listed in any rulebook.

book debuggin

debug-state is a truth state that varies.

Procedural rule: ignore the print final score rule.

section nfr - not for release

when play begins (this is the only debug if you want rule):
	now debug-state is true;

section initialize

when play begins (this is the basic adjustments rule):
	move marker backdrop to all not bzzt rooms;
	set pronouns from onyx;
	repeat through table of flippies:
		now howsolve entry is 0;
	if debug-state is false:
		ask-screenread;

book type definitions

To set the/-- pronoun it to (O - an object): (- LanguagePronouns-->3 = {O}; -).
To set the/-- pronoun him to (O - an object): (- LanguagePronouns-->6 = {O}; -).
To set the/-- pronoun her to (O - an object): (- LanguagePronouns-->9 = {O}; -).
To set the/-- pronoun them to (O - an object): (- LanguagePronouns-->12 = {O}; -).

a thing can be abstract. a thing is usually not abstract.

a thing can be fixed-off. a thing is usually not fixed-off.

a person can be unfollowy, prefollowy, followy, or beat. a person is usually unfollowy.

a person has a truth state called mulligan. mulligan of a person is usually false.

a thing can be cyclable. a thing is usually not cyclable.

a thing can be played. a thing is usually not played.

a tangential is a kind of thing. a tangential is usually not cyclable. a tangential has a room called up-room. a tangential has a room called down-room.

an animal can be zooish. an animal is usually not zooish.

book tangential

rule for printing a locale paragraph about psst:
	now psst is mentioned;
	do nothing instead.

rule for printing a locale paragraph about river:
	now river is mentioned;
	do nothing instead.

book cyclable

a thing can be takeonflip. a thing is usually not takeonflip.

the pecan is cyclable. "An oddly striped pecan lies here.". description is "It's striped orange-ish. Odd."

the tiger is a followy animal. description is "It's orange with black stripes, but it seems a bit languid. It's still sort of hunting you, so you may want to get a move on."

the ape is a fixed-off followy zooish animal. description is "It looks bored and shifty. But maybe you can get on its good side."

some wet sap is singular-named and cyclable. "Some wet sap lies here. It's sort of gross, but it might be useful.". description is "It's sticky[if player carries the sap] on your hands[end if]. It's made up of--well, you don't know what.". the indefinite article of wet sap is "some"

check taking off sap:
	say "It's stuck pretty well, but not enough to prevent you from carrying things." instead;
	
after taking sap:
	say "You hear a mournful WHOOOO as you take it. You're temporarily blinded by a pulse of light, as well.";

the hay is cyclable. "Some hay lies here. There's a lot of really small stalks you can maybe do something [if bus is in lalaland or pig is in lalaland]more [end if]with."

description of hay is "There's nothing special about the hay[if pig is in lalaland or bus is in lalaland], though it's half as bit as when you got it[end if]."

after printing the name of the hay while taking inventory:
	if pig is in lalaland or bus is in lalaland:
		say " (half the size it was)";

the pig is a cyclable zooish animal. description is "You shouldn't see it. It's in the zoo."

the owl is a cyclable zooish animal. description is "You shouldn't see it. It's in the zoo."

the banjo is cyclable and takeonflip. description is "It looks playable."

check playing banjo:
	say "Twang twang twang." instead;

the chain is cyclable. the chain is takeonflip. description is "The chain seems light-weight and sturdy, handy for pulling stuff around."

the ingot is cyclable. "An unidentifiable ingot is here.". description is "The ingot is about the same shape as the onyx, but it's smaller and, being metal, brighter."

understand "metal" as ingot.

the drum is cyclable. description is "It looks sturdy enough to play."

the colt is a cyclable animal. description is "This should be in the zoo."

the tuffet is tangential. up-room of tuffet is u01. down-room of tuffet is u25. "A tuffet lies here.". description is "As tuffets go, it's pretty, well, tuff. None of that Miss Muffet stuff. It's rather too big to carry, and it's got an image of that onyx in the center, broken into several pieces.[paragraph break]The tuffet seems to lean ever so slightly when you look at it[if score is 0]. If you could just figure what that means, now[end if]."

check taking tuffet:
	say "It provides tuff resistance. Maybe it can be changed." instead;

check entering tuffet:
	say "It--shifts, very slightly, when you try to sit on it. All of it. As if it wants to be something that can't just be sat on." instead;

the steeds are cyclable plural-named animals. "Two steeds paw at the ground here, waiting [if steed-sled is false]to be tethered to have somewhere--anywhere--to pull something[else]to follow you wherever you want them to push the sled[end if].". description of steeds is "Sturdy, yet restless[if steed-sled is true]. They're tied to that sled[end if]. They're mostly white, but they've got black spots in the center, a black bar all broken up."

understand "steed" as steeds.

check pushing:
	if noun is sled:
		say "You need to specify a direction." instead;
	if noun is steeds:
		say "They won't budge. Maybe they need to be led." instead;
	say "Most things in this game can either be carried, or they can't be pushed." instead;

the odd zoo is tangential. up-room of odd zoo is u11. down-room of odd zoo is u15. "There's an odd zoo here[if zoo-both][one of], very similar to the one [w-e]-a-ways[or][stopping][end if]."

to decide whether zoo-both:
	if u11 is visited and player is in u15:
		decide yes;
	if u15 is visited and player is in u11:
		decide yes;
	decide no;

to say w-e:
	say "[if player is in u15]West[else]East[end if]";

check inserting into odd zoo:
	say "You could maybe herd an animal in there, but don't put stuff in there." instead;

check taking tangential:
	if noun is zoo:
		say "You're nowhere near strong enough. Or mean enough to animals." instead;
	if noun is frog:
		say "It ribbits playfully away." instead;
	if noun is dune:
		say "The dune is too big, and it's--well--sand, which is hard to carry, anyway." instead;
	say "That's part of the scenery." instead;

description of odd zoo is "It really is an odd zoo. It seems too small to hold any animals, yet when you take a closer look, it seems bigger inside than out. You can't see or hear anything in it[if number of zooish animals in lalaland > 0], though you know some animals are in there, as y[else]. Y[end if]ou see the number [number of zooish animals in lalaland] on it."

check entering odd zoo:
	say "A combination of braying and alarms knocks you back." instead;

before taking scenery:
	if noun is ferns:
		say "They resist as you pull them. Maybe there's another way to do something with the ferns." instead;
	say "You don't need to go uprooting scenery, and you may not be strong enough, anyway." instead;

the arena is cyclable scenery. "It sounds empty. It feels empty."

the dolls are a plural-named thing. description of dolls is "Not very human like. It's like an engineer designed them."

the wheel is a takeonflip thing. description of wheel is "It's a small round riding wheel, not a spinning wheel."

the cot is a thing. "A small cot lies here. Well, small for you, but probably the right size for the local citizens.". description is "It's a small cot, about an oaf's size, and it even sort of has an imprint from where an oaf was sleeping. It's clean, thankfully."

after taking cot:
	say "You think you hear a familiar squeal.";

the oaf is a person. "The oaf you changed from a cot bounces up and down here.". description is "He is a mix of stripes, dots and checks. He looks important. Well, you hope he is, as you haven't seen any other oaf."

the shard is cyclable. description of shard is "It's jagged, and just looking at it seems to suck hope from you."

the tickets are cyclable and plural-named. description of tickets are "They have TIX written on them, but you're not sure to where.". "Some tickets labeled TIX lie here.". understand "tix" as tickets.

the doves are a plural-named animal. the doves are cyclable and zooish. description is "The doves should be in the zoo."

the keg is a cyclable thing. description of keg is "It smells vaguely like ale."

the block smelling rule is not listed in any rulebook.

check smelling:
	if player has keg:
		say "You smell ale from the keg." instead;
	say "You smell nothing unusual." instead;

the ice is cyclable and takeonflip. description of ice is "Amazingly, it's neither melting (yet) nor too cold to touch. Magic!"

before taking a person:
	say "You can carry a lot, but you can't carry anything heavy." instead;

the Pyrex cup is cyclable. description is "It's marked as part of the hotel, but you're not sure what significance it has."

the clerk is a cyclable person. description is "This boring clerk should not be seen."

chapter xyzzying

to decide what number is slp:
	decide on shiftability of location of player;

xyzzying is an action out of world.

understand the command "xyzzy" as something new.

understand "xyzzy" as xyzzying.

xyzzy-above is a truth state that varies.
xyzzy-below is a truth state that varies.

carry out xyzzying:
	if location of player is downy:
		now xyzzy-below is true;
		say "A hollow voice booms 'Fool! Bazza cannot be summoned ANYWHERE belowground!'" instead;
	now xyzzy-above is true;
	let mys be slp;
	if mys > 13:
		now mys is 26 - mys;
	if mys is 2:
		say "[if number of not visited uppy rooms > 0]A magic word is on the tip of your tongue. Maybe if you walk around everywhere, then come back, it'll make sense[else]'Xyzzy!' you exclaim. Then, for no reason at all, 'Zabba!' Well, that sounded better, but no dice[end if]." instead;
	else if mys is 1 or mys is 8 or mys is 9:
		say "You hear some notes, along with a weird silence that makes you cringe." instead;
	say "[if mys > 2 and mys < 8]You hear a five-note melody[else]Some ultrasonic assault on your ears makes you cringe. Maybe somewhere else will be nicer[end if].";
	the rule succeeds;

chapter silly verbs

instead of singing:
	say "Brwp. You never were good at singing." instead;

instead of jumping:
	if player is in d13:
		say "You can just go up. Or down. It's weird. You're not sure." instead;
	if player is in u13 and onyx is not in u13:
		say "You can just go up. Or down. It's weird. You're not sure." instead;
	say "Nothing much happens."

instead of touching:
	if noun is tangential:
		say "You don't feel anything odd." instead;
	if location of player is mine:
		if noun is safe:
			say "It feels sleek and smooth and heavy." instead;
		if noun is dial:
			say "It is pretty plain." instead;
		say "Your sense of touch is dulled here. You can't help but focus on the [if player has fry gun]fry gun[else]safe[end if]." instead;
	let pd be nearest-flip of noun;
	if pd is 40:
		say "You feel nothing unusual." instead;
	repeat through table of pythags:
		if pd <= rootdist entry:
			d "[pd] vs [rootdist entry].";
			say "The [noun] feel[unless noun is plural-named]s[end if] [descrip entry]." instead;

to decide what number is nearest-flip of (myi - a thing):
	let curmin be 40;
	let tempp be 0;
	repeat through table of flippies:
		if myi is fromf entry:
			if there is a tof entry and tof entry is in lalaland:
				do nothing;
			else:
				d "[cr1 entry] [cr2 entry].";
				now tempp is pythag-dist of location of player and cr1 entry;
				if tempp < curmin:
					now curmin is tempp;
				if there is a cr2 entry:
					now tempp is pythag-dist of location of player and cr2 entry;
					if tempp < curmin:
						now curmin is tempp;
	decide on curmin;

table of pythags
rootdist	descrip
2	"very warm"	[0-0 1-0 1-1]
5	"warm" [2-0 2-1]
8	"lukewarm" [2-2]
10	"slightly cool" [3-0 3-1]
16	"cool" [4-0 3-2]
40	"cold" [4-1 3-3 4-2 4-3 4-4]

to decide what number is pythag-dist of (r1 - a room) and (r2 - a room):
	let sh1 be shiftability of r1;
	let sh2 be shiftability of r2;
	let x1 be the remainder after dividing (sh1 - 1) by 5;
	let x2 be the remainder after dividing (sh2 - 1) by 5;
	let y1 be (sh1 - 1) / 5;
	let y2 be (sh2 - 1) / 5;
	let tot be ((x1 - x2) * (x1 - x2)) + ((y1 - y2) * (y1 - y2));
	d "[x1] [y1] vs [x2] [y2] => [tot].";
	decide on tot;
	
instead of kissing:
	if noun is oaf or noun is diver:
		say "You decide to just pat them on the head, too." instead;
	if noun is frog:
		say "The oafs officially have a representative democracy. So a prince would be useless. But their government isn't important." instead;
	say "Ayii! This isn't a romance game." instead;

mn is privately-named scenery. printed name of mn is "mine". description of mn is "There seems to be nothing physically preventing you from entering the mine."

understand "mine" as mn.

instead of doing something with mn:
	if action is procedural:
		continue the action;
	if current action is not entering:
		say "You can really only enter the mine." instead;
	try going inside;

instead of waking up: [?? QUEY is possible]
	say "You try the usual break-out-of-a-dream stuff, but nothing works.";
	
the block waving hands rule is not listed in any rulebook.

instead of waving hands:
	if player is in mine:
		say "No need to possibly shut yourself in.";
	if player is in d10:
		if the room inside of d10 is the mine:
			say "You can just close the mine later. Save the oafs first." instead;
		if hulk is in lalaland:
			if mine is in d10:
				say "The mine is already here.";
			else:
				say "You wave, and the prune trove splits apart to reveal a mine, which you can enter.";
				now mn is in d10;
				change the inside exit of d10 to mine;
				change the outside exit of mine to d10;
				now prune trove is off-stage;
		else if hive is visible:
			say "The hive doesn't notice, being inanimate.";
		else:
			say "That seems to infuriate the hulk, who, thankfully, doesn't want to chase you. He must be guarding something.";
		continue the action;
	if oaf is visible:
		say "The oaf waves back excitedly." instead;
	if number of visible people > 1:
		say "You don't make any new friends." instead;
	say "Nobody to wave to." instead;

the bunny is a zooish animal. description of bunny is "This bunny should be in the zoo."

instead of looking under:
	say "Nothing is physically hidden in this game."

instead of searching:
	if noun is dune:
		say "You sift through, but the only place you can get, you feel nothing." instead;
	say "Nothing is physically hidden in this game, so let's examine, instead.";
	try examining the noun instead;

instead of sleeping:
	if bee is visible or thug is visible or punk is visible or tiger is visible:
		say "You fail to fall asleep before the pain starts." instead;
	if bunny is in lalaland:
		say "The zoo already has a bunny." instead;
	if player is in u09 or player is in u17:
		say "You fall asleep, and when you wake up, a bunny has climbed on you. How sweet. You guide it to the nearby zoo. It seems content there.[check-ach of 24]";
		now bunny is in lalaland instead;
	if cot is visible:
		say "The cot is too small." instead;

instead of entering cot:
	say "The cot seems to chatter, like the oafs did." instead;

chapter abouting

abouting is an action out of world.

understand the command "about" as something new.

understand "about" as abouting.

carry out abouting:
	say "It's not important to do EVERYTHING to make the oafs happy. In fact, you only really need about seven points to free them. But they'll be even happier if you do more.[paragraph break]Also, this work is dedicated to my just plain cool buds, Andy Boyd and Davy Fink. They are almost as cool as me, sort of my reflections in a way, and in no way imaginary, so stop saying that![paragraph break]But those foolz bailed on me when I aksed them to test the game. See the hard-working, patient and thoughtful people who didn't, with CREDITS.[paragraph break]Source code is included, for people who are technical like that. Transcripts are appreciated--send them to ugly.oafs@gmail.com.";
	now abouted is true;
	the rule succeeds;

abouted is a truth state that varies.

chapter creditsing

creditsing is an action out of world.

understand the command "credits/credit" as something new.

understand "credits" and "credit" as creditsing.

carry out creditsing:
	say "Well, my testers were under the gun, so I appreciate their help extra. Perhaps you will, yourself, or you may be disappointed with them for helping this game to be passable enough for me to enter it into IFComp. Hooray for free will![paragraph break]Alice Grove, Buster Hudson, Hanon Ondricek, Neil Butters, and Robert DeFord beta-tested and rounded out the very roughest edges and then some. I wish I had given them more time to attack more. Matt Weiner found bugs on the game's release, and Harry Giles and Kateri gave technical/aesthetic help in the IFComp 2014 authors['] subforum at intfiction.org.[paragraph break]Finally, playtesting Juhana Leinonen's ShuffleComp entry, Sparkle, convinced me to go through with this game when it was just a couple of PERL files and 5k of proof-of-concept code. You will probably find his effort less baffling and more compact. Please don't send him hate-mail as a result of this game.";
	the rule succeeds;

chapter talktoing

Understand the commands "ask" and "tell" and "say" and "answer" as something new. 

Understand "ask [text]" or "tell [text]" or "answer [text]" or "say [text]" as a mistake ("[talk to instead]"). 

Instead of asking someone to try doing something: 
	say "[talk to instead][paragraph break]". 

Instead of answering someone that something: 
	say "[talk to instead][paragraph break]". 

To say talk to instead: 
	say "(To communicate in [story title], TALK TO a character. If you have a magic word to say, say it as-is, no need for prefixes or suffixes.) " 

Understand "talk to [someone]" as talking to. Understand "talk to [something]" as talking to. Talking to is an action applying to one thing. 

to say mb-frog:
	choose row 1 in table of accomp;
	if did-accomp entry is false:
		say ". Maybe you could have a nice word for it";

check talking to:
	d "[list of people that are not animals].";
	if noun is dolls:
		say "You feel a bit embarrassed. You don't know what to ask them." instead;
	if noun is frog:
		say "The frog smiles at you[mb-frog]." instead;
	if noun is steeds:
		say "[if steed-sled is true]The steeds perk their ears up and paw the ground. They probably don't understand words, but they look ready to follow you[else]The steeds look up at you, then tilt their heads and look down. They may be waiting for the right time to follow[end if]." instead;
	if noun is an animal:
		say "Animals don't understand words, here." instead;
	if noun is cot:
		say "It seems to be chattering, but nothing becomes actual conversation." instead;
	if noun is oaf:
		oaf-eval instead;
	if noun is punk:
		say "The punk sneers at how un-hip you are. Well, he does more than sneer." instead;
	if noun is thug:
		say "The thug sneers at how un-hip you are. Well, he does more than sneer." instead;
	if noun is player:
		say "You mutter to yourself how weird this all is." instead;
	if noun is gun:
		say "You channel Sledge Hammer, briefly." instead;
	if noun is boxy hulk:
		say "The boxy hulk booms 'MINE!'" instead;
	if noun is serf:
		say "The serf shakes his head. He is tired from working." instead;
	if noun is tyro:
		say "The tyro stammers ineffectually." instead;
	if noun is diver:
		say "The diver can't hear you or talk under his suit. He shuffles around, unsure whether to [if diver-follow is false]follow[else]continue following[end if] you. Do you wish it to [if diver-follow is false]start[else]stop[end if]?";
		if the player consents:
			if diver-follow is false:
				say "The diver bounces as excitedly as he can in his heavy gear.";
				now diver-follow is true;
			else:
				say "The diver tries to put his hands in his pockets to show he's chillin['], but there aren't any.";
				now diver-follow is false;
			the rule succeeds;
		else:
			say "OK." instead;
	if noun is cool dudes:
		say "They know a whole ton. I mean, the people they're meant to be, do." instead;
	if noun is left guy or noun is right guy:
		say "He looks like he has some information, but not as much as the center." instead;
	if noun is middle guy:
		say "He looks like he has some information, or he would if he were real. Maybe he does anyway." instead;
	if noun is sea guy or noun is undug elves:
		say "They don't say anything. You shouldn't even be seeing them." instead;
	if noun is slab or noun is pulse:
		say "You can't get a word in--the wrath pulse paralyzes you. But maybe you could write something on the talk slab." instead;
	if noun is a person:
		say "You'd expect something, but...nothing." instead;
	say "As expected, you get no response.";

diver-follow is a truth state that varies. river-dive is a truth state that varies. ford-dive is a truth state that varies.

every turn when diver-follow is true (this is the dive for treasure rule):
	if diver is not in location of the player:
		now diver is in location of player;
		say "The diver trudges along behind, looking for--well, probably somewhere to dive.";
		treasure-check;
		
to treasure-check:
	d "ford: [if ford is visible]true[else]false[end if] rift: [if rift is visible]true[else]false[end if].";
	if player is in u09 or player is in u17:
		if river-dive is false:
			say "The diver plunges into the river! It's not too deep for you, but he finds it worth looking around.";
			now river-dive is true;
			if ford-dive is false:
				say "Unfortunately, he doesn't find anything, this time.";
		else:
			say "The diver already went in the river. Maybe he needs to try his luck elsewhere.";
	if ford is visible:
		if ford-dive is false:
			say "The diver plunges into the ford! It's not too deep for you, but for it, it's quite a task.";
			now ford-dive is true;
			if river-dive is false:
				say "Unfortunately, he doesn't find anything, this time.";
		else:
			say "The diver already went in the ford. Maybe he needs to try his luck elsewhere.";
	if ford-dive is true and river-dive is true:
		say "This time, the diver uncovers a statue! And what a statue it is. It is of three cool dudes. He offers it to you. After you decline several times, he thrusts it in your hands and runs away, cartwheeling with surprising dexterity.";
		now player has dudes;
		now diver-follow is false;
		now diver is in lalaland;

sea-guy-warn is a truth state that varies.

to oaf-eval:
	if onyx is in u13:
		if steed-sled is true:
			say "'The steedses! They will knock over the bad onyx!'";
		else if steeds are off-stage:
			say "'Nobody can approach the onyx! It puts wordses in our brainses! You needs something that can think, but not in alphabetses!'";
		else:
			say "'The steedses! They needs something to pull! Does you...' [if player has chain]You hold out the chain. 'That workses nicely.'[else]You shrug. Nothing to tie the steeds to.";
		continue the action;
	if sea-guy-warn is false:
		say "'The SEA GUY! And his army of UNDUG ELVES! They are unreachable below! You must find a way to deal with ... with ...' the oaf can't quite say it. You may need to talk to the oaf again.";
		now sea-guy-warn is true;
		continue the action;
	if pens are off-stage and pen is off-stage:
		say "'The wrath pulse below inhibitses us! Things is reverseded there! You must talk to it! Talk to it with writings! Surely you must find somethings if you found the steeds and the sled!'";
		continue the action;
	if pen is in lalaland:
		say "'Oh, thank you! You has rescueded us!'";
		end the story finally;
		continue the action;
	say "'You has writingly thingses! You must shares a word! It is a powerful one!'";
	continue the action;

chapter adding

adding is an action out of world.

understand the command "add" as something new.

understand "add" as adding.

carry out adding:
	if bee is visible:
		if player is in u01 or player is in u25:
			say "For some reason, you think two bees will cancel each other out. They don't, but they both cancel you out equally with their stings.[check-ach of 4]";
			allow-oaf-cont;
			end the story instead;
	say "[err-rej]";
	the rule succeeds;

chapter verbsing

verbsing is an action out of world.

understand the command "verbs/verb" as something new.

understand "verbs" and "verb" as verbsing.

carry out verbsing:
	say "You don't need many verbs to win Ugly Oafs. Once you figure a magic word, you can use it without a prefix, e.g. XYZZY instead of SAY XYZZY. However, though this game is nonsense, you need find no nonsense word.[paragraph break]You may need to ATTACH something to something else (which also envelops PUT X ON/IN Y,) PUSH it around, or occasionally TALK to people. ASK X ABOUT Y is mapped to TALKing. You can also ATTACK, which is of limited use.[paragraph break]You may gain help from HINT by itself, or HINT (SOMETHING). THINK(T) reviews all you've seen so far[if tx-nudge is true] on your side of the whole (THINK/TX for the reverse,)[else],[end if] and FIND locates all items you've already seen.[paragraph break]Also, commands such as LOOK, THINK, FIND, EXAMINE, INVENTORY and SCORE do not cost you time in pressure situations.[paragraph break]Finally, ABOUT and CREDITS tell about this game and the people who helped with bug fixes and playability issues.";
	the rule succeeds;

chapter thinking

marker-x-up is a truth state that varies.
marker-x-down is a truth state that varies.

marker-msg-up is a truth state that varies.
marker-msg-down is a truth state that varies.

to say dirs of (thisr - a room):
	if thisr is u13:
		say "[if onyx is in u13]Onyx[else]hole[end if]";
		continue the action;
	else if thisr is d13:
		say "pulse";
		continue the action;
	let Q be the shiftability of thisr;
	let EW be (remainder after dividing (Q - 1) by 5) - 2;
	if thisr is downy:
		now EW is 0 - EW;
	let NS be ((Q - 1) / 5) - 2;
	repeat through table of dirmaps:
		if NS is vert entry and EW is horiz entry:
			say "[printy entry]";
			continue the action;
	say "BUG";

table of dirmaps
vert	horiz	printy
2	0	"2[srsp]S"
1	0	"S"
0	0	"Right by"
-1	0	"N"
-2	0	"2[srsp]N"
2	-1	"S[srsp]S[srsp]W"
1	-1	"S[srsp]W"
0	-1	"W"
-1	-1	"N[srsp]W"
-2	-1	"N[srsp]N[srsp]W"
2	1	"S[srsp]S[srsp]E"
1	1	"S[srsp]E"
0	1	"E"
-1	1	"N[srsp]E"
-2	1	"2[srsp]N[srsp]E"
2	-2	"2[srsp]S[srsp]W"
1	-2	"W[srsp]S[srsp]W"
0	-2	"2[srsp]W"
-1	-2	"N[srsp]W"
-2	-2	"2[srsp]N[srsp]W"
2	2	"2[srsp]S[srsp]E"
1	2	"E[srsp]S[srsp]E"
0	2	"2[srsp]E"
-1	2	"E[srsp]N[srsp]E"
-2	2	"2[srsp]N[srsp]E"


to say suff of (thisr - a room):
	say "[if thisr is uppy][onho][else][opu][end if]";

thinkupping is an action out of world.

thinkdowning is an action out of world.

to say d20-too:
	if d20-read is 1:
		say "SLOG, AHEM and ";
	else if d20-read is 2:
		say "WEEP WOOD, SLOG AHEM and ";

carry out thinkdowning:
	say "[if down-score < 2]Things may be a bit different below. Maybe with enough data, you'll figure[else]Youre pretty sure you see what's going on. You know[end if] how, if not why. Why is always an annoying question.[paragraph break]";
	if marker-x-down is false:
		say "You haven't read any markers here below. They might help.";
	else if marker-msg-down is false:
		say "You haven't read any messaged markers here below. They might help.";
	else:
		repeat through table of markables:
			if rm1 entry is downy:
				if rm1 entry is d13 and x-1 entry is true:
					say "[2da]By the pulse: [msg entry][line break]";
				else if x-1 entry is true: [x-2 entry is always the bullpen, so we ignore it]
					say "[2da][dirs of rm1 entry][suff of rm1 entry]: [if rm1 entry is d20][d20-too][end if][msg entry][line break]";
	if down-score > 0:
		say "Heres stuff you've changed so far:[line break]";
		repeat through table of flippies:
			if cr1 entry is downy:
				if howsolve entry is 1:
					say "[cr1 entry]: [b4txt entry] -> [aftxt entry][line break]";
				if howsolve entry is 2:
					say "[cr1 entry]: [b4txt entry] -> [aftxt entry][line break]";

carry out thinkupping:
	say "[if score is 0 and frivolous-points is 0]Maybe once you get that first point, everything else will get untracked.[else if score < 3]You've done some things, so you may or may not have the hang of them.[else]You give yourself a refresher.[end if][line break]";
	if marker-x-up is false:
		say "You haven't read any markers yet. They might help.";
	else if marker-msg-up is false:
		say "You haven't read any messaged markers yet. They might help.";
	else:
		say "Here are the markers you've read:[line break][equal-banner of 30][line break]";
		repeat through table of markables:
			if rm1 entry is uppy:
				if rm1 entry is u13 and x-1 entry is true:
					say "[2da]By the [if onyx is in u13]onyx[else]hole[end if] (13): [msg entry]";
				else if x-1 entry is true and x-2 entry is true:
					say "[2da][dirs of rm1 entry] & [dirs of rm2 entry][suff of rm1 entry] ([shiftability of rm1 entry], [shiftability of rm2 entry]): [msg entry][line break]";
				else if x-1 entry is true:
					say "[2da][dirs of rm1 entry][suff of rm1 entry] ([shiftability of rm1 entry]): [msg entry][line break]";
				else if x-2 entry is true:
					say "[2da][dirs of rm2 entry][suff of rm2 entry] ([shiftability of rm2 entry]): [msg entry][line break]";
		say "[paragraph break]";
	if score > 0:
		say "Here's stuff you've changed so far:[line break]";
		repeat through table of flippies:
			if cr1 entry is uppy:
				if howsolve entry is 1:
					say "[cr1 entry]: [b4txt entry] -> [aftxt entry][line break]";
				else if howsolve entry is 2:
					say "[cr2 entry]: [b4txt entry] -> [aftxt entry][line break]";

understand the command "t" as something new. understand "t" as thinking.

txing is an action out of world.

understand the command "tx" as something new.

understand "tx" as txing.

carry out txing:
	if d13 is unvisited:
		say "[err-rej]" instead;
	now tx-nudge is true;
	if location of player is uppy:
		try thinkdowning instead;
	else if location of player is downy:
		try thinkupping instead;
	else:
		if player has fry gun:
			say "You have the fry gun. The time for thinking is over.";
		else:
			say "Brute force can't be the answer, here. You may need some lateral thinking.";
	the rule succeeds;


tx-nudge is a truth state that varies.

instead of thinking: [ugh, I hate the semi-duplicated code here but see no way to merge everything]
	if onyx is in lalaland and tx-nudge is false:
		now tx-nudge is true;
		ital-say "You will now focus on aboveground or belowground depending on where you are. But THINKX/TX will let you think about the area you are not in.";
	if location of player is uppy:
		try thinkupping instead;
	else if location of player is downy:
		try thinkdowning instead;
	else:
		if player has fry gun:
			say "You have the fry gun. The time for thinking is over.";
		else:
			say "Brute force can't be the answer, here. You may need some lateral thinking.";
		
chapter finding

finding is an action out of world.

understand the command "find" as something new.

understand "find" as finding.

a thing can be unticked or ticked. a thing is usually unticked.

understand "find [text]" as a mistake ("[try-find]")

to say try-find:
	ital-say "NOTE: You don't need to FIND X. FIND is the command that is used.";
	try finding;

carry out finding:
	if number of words in the player's command > 1:
		if word number 1 in the player's command is "find":
			say "FIND is a one-word command. It should show everything.";
	let found-yet be false;
	let prev-from be onyx;
	repeat through table of flippies:
		now fromf entry is unticked;
	repeat through table of flippies:
		if fromf entry is not off-stage and fromf entry is not in lalaland and player does not have fromf entry and fromf entry is unticked:
			if location of fromf entry is visited and location of fromf entry is uppy:
				now fromf entry is ticked;
				now found-yet is true;
				if location of player is location of fromf entry:
					say "The [fromf entry]: right here";
				else:
					say "The [fromf entry] ([printed name of location of fromf entry]): [bigway of location of player and location of fromf entry]";
				if d13 is visited:
					if location of fromf entry is uppy:
						say " (above)";
					else:
						say " (below)";
				say ".";
	repeat through table of flippies:
		if fromf entry is not off-stage and fromf entry is not in lalaland and player does not have fromf entry and fromf entry is unticked:
			if location of fromf entry is visited and location of fromf entry is downy:
				now fromf entry is ticked;
				now found-yet is true;
				if location of player is location of fromf entry:
					say "The [fromf entry]: right here.";
				else:
					say "The [fromf entry] ([printed name of location of fromf entry]): [bigway of location of player and location of fromf entry]";
				if d13 is visited:
					if location of fromf entry is uppy:
						say " (above)";
					else:
						say " (below)";
				say ".";
	if found-yet is false:
		say "You haven't seen anything significant that you can mess with.";
	the rule succeeds;

chapter pushing

understand the command "shift" as something new.

before pushing:
	if noun is a direction:
		if number of visible pushable between rooms things > 0:
			let Y be a random visible pushable between rooms thing;
			try pushing Y to noun instead;
		else:
			say " You can just go that way." instead;

check pushing the chain to:
	if chain is part of the sled:
		try pushing the sled to the noun instead;
	say "You need something to TIE to the chain to pull it." instead;

check pushing the sled to:
	if steeds are visible:
		say "[if steed-sled is true]The steeds are the ones who can push the sled now[else]The steeds whinny in disappointment[end if].";
		continue the action;
	now pushed-yet is true;
	if chain is part of sled:
		say "It's nice to be able to pull the sled with the chain. But maybe you can get someone or something else to pull it later.";
	else:
		say "[one of]It's actually rather easy to push[or]While it's easy to push, maybe you can get someone or something else to move it around later[stopping].";

report pushing the sled to:
	if steeds are visible:
		say "The steeds paw the ground excitedly at seeing the sled.";
	continue the action;

chapter whying

whying is an action out of world.

understand the command "why" as something new.

understand "why" as whying.

carry out whying:
	if player has fry gun:
		say "No need to ask why now. The wrath pulse must go!" instead;
	if player does not have pen:
		if player has pens:
			say "[if player is in d13]You have too many pens to simply write why. Get rid of one.[else]You wonder why you have two pens when you need one.[end if]" instead;
		say "You think 'why' but you don't have the right implements to--well, EXPRESS why." instead;
	if player is not in d13:
		say "You want to write WHY, but you're not in the right place." instead;
	say "The wrath pulse pulses even more at your ignorance. Why, even the oafs know--or should--why it's oppressing them. It's just--cooler, and smarter, and more advanced. You keep writing it, and the pulse finds itself unable to stop. It blomps off somewhere--still alive, sick of your stupid questions for a while.[paragraph break]You hear oafs cheering as they jump down the hole above. They pat you on the back and give you a victory ride. They tell you how you are not the first to question the pulse so bravely, and you wonder briefly if you could have destroyed it. You hear the legend of the Fry Gun, hidden somewhere, that might dispose of the pulse for good--nah, you did well enough.";
	choose row with final response activity of nodoing in the table of final question options;
	blank out the whole row;
	end the game in victory;
	the rule succeeds;

chapter buning

buning is an action applying to nothing.

understand the command "bun" as something new.

understand "bun" as buning.

carry out buning:
	if hats are visible:
		if player is in u06 or player is in u20:
			choose row 16 in table of accomp;
			if did-accomp entry is true:
				say "Don't get greedy." instead;
			say "There are enough hats, you won't miss one. You're a bit hungry, anyway. The bun tastes pretty good.[check-ach of 16]" instead;
		else:
			say "I'll eat my hat if I let you do that here." instead;
	say "[err-rej]";
	the rule succeeds;

chapter goding

goding is an action out of world.

understand the command "god" as something new.

understand "god" as goding.

carry out goding:
	if player has wet sap:
		if player is in u12 or player is in u14 or player is in u10 or player is in u16:
			say "You call for godlike powers. And what do you know? They are given to you! You suddenly feel contempt for the oafs. You only wish to crush them, their stupid fur, and their stupid grammarses. Grammar.[check-ach of 9]";
			allow-oaf-cont;
			end the story saying "Try something wise other than GOD" instead;
	say "[err-rej]";
	the rule succeeds;

to allow-oaf-cont:
	let xyz be number of rows in table of final question options;
	choose row xyz in table of final question options;
	now final response rule entry is oaf-cont rule;
	d "Allowing oaf continue.";
	choose row with a final response rule of immediately undo rule in the Table of Final Question Options; 
	delete the final question wording entry;
	choose row with final response activity of nodoing in the table of final question options;
	now only if victorious entry is false;

chapter meshing

meshing is an action out of world.

understand the command "mesh" as something new.

understand "mesh" as meshing.

carry out meshing:
	if player is not in d20:
		say "[err-rej]" instead;
	if mesh is in d20:
		say "You already put mesh in the goal.";
	else:
		say "Part of the crossbar and uprights winds out to form a mesh that ties itself to the goal. You're not sure what sort of game the oafs play, but now it will be more fun.[paragraph break]A small box clunks out from what was the mesh.[check-ach of 17]";
		now rev box is in d20;
	the rule succeeds;

chapter hawing

hawing is an action out of world.

understand the command "haw" as something new.

understand "haw" as hawing.

hawed is a truth state that varies.

carry out hawing:
	if player has pies:
		if hawed is true:
			say "You've already been pleased to have not just one pie, but two.";
		if player is in u18 or player is in u08:
			say "You feel very pleased to have even one pie.[check-ach of 13]";
			now hawed is true;
		else:
			say "You arent quite in the right place for that.";
		the rule succeeds;
	say "[err-rej]";
	the rule succeeds;

chapter crying

crying is an action out of world.

understand the command "cry" as something new.

understand "cry" as crying.

carry out crying:
	if player is in u09 or player is in u17:
		if player has crood sheet:
			if player does not have keg:
				say "You spill a teardrop on the crood sheet. It's just not enough of a tip!" instead;
		else:
			say "A single tear hits the ground, and POOF! Some paper appears in its place. Wait, it's not paper, but a sheet. A crude sheet (wait, make that CROOD,) which has something written on it.";
			now player has crood sheet instead;
	if player has keg:
		if player is in d04:
			say "You drown your sorrows in alcohol, wondering if the oafs are even worth saving. When you wake up, well...you got so far that the Sea Guy, whom you couldn't find--well, he tells you he can't blame you for getting drunk, but he CAN blame you for helping the oafs in the first place.[check-ach of 15]";
			allow-oaf-cont;
			end the story instead;
		say "This place isn't depressing enough for you to get mindlessly drunk." instead;
	say "You take a moment to get emotional. Perhaps you are not in the right place for this to do any good." instead;

the crood sheet is a thing.

description of crood sheet is "It's even misspelled crudely! But it has some odd writing on it.[paragraph break][crood-37]".

to say crood-37:
	let b1 be 1;
	let b2 be 1;
	let b3 be 1;
	say "[fixed letter spacing]";
	let thisrow be 0;
	repeat through table of accomp:
		increment thisrow;
		now b1 is b1 * 17;
		now b1 is the remainder after dividing b1 by 37;
		now b2 is b2 * 18;
		now b2 is the remainder after dividing b2 by 37;
		now b3 is b3 * 19;
		now b3 is the remainder after dividing b3 by 37;
		if did-accomp entry is true:
			say "[codey of b1] [codey of b2] [codey of b3]";
		else:
			say "* * *";
		say "[line break]";
	say "[variable letter spacing]";

to say codey of (myn - a number):
	if myn < 10:
		say "[myn]";
	else if myn is 36:
		say "-";
	else:
		say "[character number myn + 55]";

chapter putzing

putzing is an action out of world.

understand the command "putz" as something new.

understand "putz" as wining.

putzed is a truth state that varies.

carry out putzing:
	if player is in u23:
		if putzed is true:
			say "You don't want to double-negative yourself, here.";
		else:
			say "You chastise yourself for feeling all GBCW with a simple 'PUTZ.' It helps you get a grip on reality.[check-ach of 34]";
			now putzed is true;
			inc-score;
		the rule succeeds;
	say "[err-rej]";

chapter xiting

xiting is an action out of world.

understand the command "xit" as something new.

understand "xit" as xiting.

carry out xiting:
	if player has tickets:
		if player is in d18:
			say "You wave the ticket, and an exit appears. You walk out, leaving squealing oafs behind. 'We is losted! You is goned!' Eh, tough luck for them.[check-ach of 28]";
			allow-oaf-cont;
			do nothing instead;
		say "You wave the tickets, but not much happens." instead;
	try exiting instead;			
	the rule succeeds;

chapter wining

wining is an action out of world.

understand the command "win" as something new.

understand "win" as wining.

carry out wining:
	if player is in u08 or player is in u18:
		if oaf is visible:
			say "As you think that, the oaf chatters frantically and tries to shush you and keep you from going anywhere else!" instead;
		if oaf is in u12 or oaf is in u14:
			repeat with JJ running through directions:
				let RR be the room JJ of location of player;
				if RR is location of oaf:
					say "The oaf to the [JJ] runs over, squealing frantically, but that only accelerates things!";
					win-wrong instead;
	if player is in u06 or player is in u20:
		if cot is visible:
			say "Suddenly, you hear oafs squealing!";
			win-wrong instead;
	say "[err-rej]";
	the rule succeeds;

to win-wrong:
	say "[line break]'No! You didded it wrongses! Now you will be just like the Sea Guy! You must changes the thingses properlyly!'[paragraph break]Yeah, whatever. You wonder how you ever put up with their stupid grammar and nonsense words in the first place. You will take charge here, and you'll make sure they're kept down. And you'll deserve that power, because...well...you'll figure out why later.[check-ach of 5]";
	allow-oaf-cont;
	end the story saying "Not the right way to WIN";

chapter wdoneing

wdoneing is an action out of world.

understand the command "wdone" as something new.

understand "wdone" as wdoneing.

carry out wdoneing:
	let thehash be 1;
	let onedone be false;
	repeat through table of accomp:
		now thehash is thehash * 613;
		if thehash > 1111:
			now thehash is the remainder after dividing thehash by 1111;
		if did-accomp entry is true:
			if thehash is not dumhash entry:
				say "CHEATED: [did-you-try entry].";
			else:
				say "DONE: [did-you-try entry].";
				now onedone is true;
	if onedone is false:
		say "You have no weird stuff left to do! Well done!";
	the rule succeeds;

chapter weirding

weirding is an action out of world.

understand the command "weird" as something new.

understand "weird" as weirding.

carry out weirding:
	let thehash be 1;
	let undone be false;
	repeat through table of accomp:
		now thehash is thehash * 613;
		if thehash > 1111:
			now thehash is the remainder after dividing thehash by 1111;
		if did-accomp entry is true:
			if thehash is not dumhash entry:
				say "CHEATED: [did-you-try entry]";
		else:
			say "UNDONE: [did-you-try entry]?";
			now undone is true;
	if undone is false:
		say "You have no weird stuff left to do! Well done!";
	the rule succeeds;

chapter peeing

peeing is an action out of world.

understand the command "pee" as something new.

understand "pee" as peeing.

carry out peeing:
	if odd zoo is visible:
		choose row with myidx of 7 in table of accomp;
		if did-accomp entry is false:
			say "You do your business discreetly behind the zoo. Well, this is the least awful place to do so, what with the general smell.[check-ach of 7]";
		else:
			say "Not again.";
	else:
		say "That's really inappropriate. Especially here.";
	the rule succeeds;

chapter peeing

shhing is an action out of world.

understand the command "shh" as something new.

understand "shh" as shhing.

carry out shhing:
	if odd zoo is visible:
		choose row with myidx of 8 in table of accomp;
		if did-accomp entry is false:
			say "You shush some imaginary troublemaker.[check-ach of 8]";
		else:
			say "If you shh enough, you may need to be shh-ed. Then someone would need to shh that person. What a vicious cycle that would be!";
	else:
		say "You don't feel a need to shush anyone here.";
	the rule succeeds;

chapter etching

pens are a plural-named takeonflip thing. description is "You probably only need one, and you can just drop them to make one roll away, but who knows, it might be fun to use more, or be a little creative."

check dropping pens (this is the drop a pen rule) :
	say "You drop a pen. Now you have one left.";
	now player has pen;
	now pens are in lalaland instead;

check dropping (this is the reject drop unless by river rule) :
	if noun is fry gun:
		say "It's heavy, but you can't shirk your destiny." instead;
	if river is visible:
		try inserting noun into river instead;
	say "Don't worry about that. Anything you can pick up, you don't need to drop." instead;

etching is an action applying to nothing.

understand the command "etch" as something new.

understand "etch" as etching.

carry out etching:
	if player has pen:
		say "You already did that. Now, what to etch?" instead;
	if player has grid and player is in d13:
		say "That won't write anything to the wrath pulse." instead;
	unless player has pens:
		say "Nothing to etch with." instead;
	if player is in u15 or player is in u11:
		say "You engage in harmless graffiti, until you think you hear a noise. One pen drops and rolls away![check-ach of 10]";
		now pens are in lalaland;
		now player has pen instead;
	say "This doesn't look like a good place to vandalize anything." instead;
	the rule succeeds;

chapter way-to

to say bigway of (r1 - a room) and (r2 - a room):
	if r1 is u13 and r2 is d13:
		say "down the hole";
		continue the action;
	if r1 is d13 and r2 is u13:
		say "up the hole";
		continue the action;
	if r1 is uppy and r2 is downy:
		say "[if r1 is not u13][wayto of r1 and u13], [end if]down the hole[if r2 is not d13], then [wayto of d13 and r2][end if]";
		continue the action;
	if r1 is downy and r2 is uppy:
		say "[if r1 is not d13][wayto of r1 and d13], [end if]up the hole[if r2 is not u13], then [wayto of u13 and r2][end if]";
		continue the action;
	say "[wayto of r1 and r2]";

to say wayto of (r1 - a room) and (r2 - a room):
	if r2 is uppy and r1 is downy:
		say "(BUG)";
		continue the action;
	if r1 is uppy and r2 is downy:
		say "(BUG)";
		continue the action;
	let b2 be shiftability of r2;
	let b1 be shiftability of r1;
	let northies be ((b1 - 1) / 5) - ((b2 - 1) / 5) ;
	let b2a be the remainder after dividing (b2 - 1) by 5;
	let b1a be the remainder after dividing (b1 - 1) by 5;
	let easties be b1a - b2a;
	if r2 is uppy:
		now easties is b2a - b1a;
	let nabs be northies;
	if nabs < 0:
		now nabs is 0 - nabs;
	let eabs be easties;
	if eabs < 0:
		now eabs is 0 - eabs;
	let diag be nabs;
	if eabs < diag:
		now diag is eabs;
	if diag > 0:
		say "[diag] [if northies < 0]south[else]north[end if][if easties < 0]west[else]east[end if]";
		if nabs is not diag:
			say " and ";
			say "[nabs - diag] [if northies < 0]south[else]north[end if]";
		if eabs is not diag:
			say " and ";
			say "[eabs - diag] [if easties < 0]west[else]east[end if]";
	else:
		if eabs > 0:
			say "[eabs - diag] [if easties < 0]west[else]east[end if]";
		if nabs > 0:
			if easties is not 0:
				say " and ";
			say "[nabs - diag] [if northies < 0]south[else]north[end if]";

section wayto test - not for release

when play begins (this is the test direction descriptions rule):
	d "NW W: [bigway of u13 and u06].";
	d "NE E: [bigway of u13 and u10].";
	d "NW N: [bigway of u13 and u02].";
	d "NE N: [bigway of u13 and u04].";
	d "SW W: [bigway of u13 and u16].";
	d "SE E: [bigway of u13 and u20].";
	d "SW S: [bigway of u13 and u22].";
	d "SE S: [bigway of u13 and u24].";
	continue the action;
	d "2N NE: [bigway of u16 and u02].";
	d "SW S: [bigway of d09 and d20].";
	d "2NE: [bigway of u11 and u03].";
	d "4SE: [bigway of d05 and d21].";
	d "[bigway of d05 and u05].";
	d "[bigway of u09 and d19].";
	d "[bigway of u13 and d13].";
	d "[bigway of u12 and d13].";
	d "[bigway of u13 and d18].";

chapter other cool jazz

the hats are a plural-named thing. "Some hats lie here. They're far too small for you.". description is "The hats are stacked, and losing or gaining one would make little difference. They are all emblazoned with a picture of the onyx, broken, by the pent crag. But you can't imagine what they could do as hats."

understand "hat" as hats.

instead of wearing hats:
	say "They're not your style, and they're way too small.";

pushed-yet is a truth state that varies.

the sled is a thing. the sled is pushable between rooms. "[if steed-sled is true]That sled you pushed around is attached to the steeds[else if pushed-yet is true]That sled you've been pushing around lies here[else]A sled lies here. You can probably PUSH it around[end if].". description is "[if steed-sled is true]Attached to the steeds by the chain[else if sled-chain is true]Tied to the chain[else]All by itself[end if]. The sled carries the same image of the broken-up onyx as the hats you changed to make it."

after choosing notable locale objects:
	if sled is visible:
		set the locale priority of the sled to 9;

report pushing the sled to u13:
	say "[one of]The sled seems to try to creep towards the onyx, but then, it's pushed back. You try to push the sled to the center, yourself, but the onyx once again makes you balk. It's as if the sled wants to hurl itself at the onyx, but it doesn't have the physical backup[or]Once again, the sled scoots towards the onyx before being bumped back[stopping].";
	continue the action;

check entering the sled:
	if steed-sled is true:
		say "The steeds seem to be following you, so that's not constructive.";
	else:
		say "There's nothing to pull the sled.";
	the rule succeeds;

check taking the sled:
	say "You should push it instead." instead;

a thing can be pristine. a thing is usually pristine.

the marker is a backdrop. description of marker is "[one of]Marker, signpost, whichever. [or][stopping]It has the number [if location is uppy][shiftability of location of player] written on it[else][26 + shiftability of location of player] written over a poorly-erased [shiftability of location of player][end if][markable]"

after examining marker when player is in d20:
	say "There's even more if you look closer. Do so?";
	if the player consents:
		if d20-read < 2:
			increment d20-read;
		say "[one of]WOOD, WEEP[one of]--and, yes, a bit more[or][stopping][or]SLOG, AHEM[cycling] is written.";
	continue the action;

d20-read is a number that varies.

understand "signpost/sign/post" and "sign post" and "markers" as marker.

check examining marker (this is the check where marker examined rule) :
	if location of player is uppy:
		now marker-x-up is true;
	if location of player is downy:
		now marker-x-down is true;

instead of putting on the sled:
	say "Nothing's heavy enough to need the sled for transport. You can just juggle what you have."

after examining marker when player is in u12 or player is in u14:
	say "[if its-muddy]The marker has sunk into the mud.[else]The marker, while at ground level, seems to be floating in the air, as the ground dips around it. That's not right.[end if]";
	continue the action;

to say markable:
	if location of player is a rm1 listed in table of markables:
		choose row with rm1 of location of player in table of markables;
		now x-1 entry is true;
		say ", and also written is [msg entry]";
		if location of player is uppy:
			now marker-msg-up is true;
		else:
			now marker-msg-down is true;
	if location of player is a rm2 listed in table of markables:
		choose row with rm2 of location of player in table of markables;
		now x-2 entry is true;
		say ", and also written is [msg entry]";
		if location of player is uppy:
			now marker-msg-up is true;
		else:
			now marker-msg-down is true;

after printing the locale description (this is the note marker rule):
	if location of player is unvisited:
		if location of player is a rm1 listed in table of markables:
			choose row with rm1 of location of player in table of markables;
			if x-1 entry is false:
				say "The marker for this area has [if rm1 entry is multmark]lots of stuff[else]something[end if] written on it.";
		if location of player is a rm2 listed in table of markables:
			choose row with rm2 of location of player in table of markables;
			if x-2 entry is false:
				say "The marker for this area has [if rm1 entry is multmark]lots of stuff[else]something[end if] written on it.";
	continue the action;

ufo-gone is a truth state that varies.

after printing the locale description (this is the shy ufo rule):
	if player is in u02 or player is in u24:
		if up-score is 0:
			say "A shy UFO ducks out of the way just as you enter.";
		else:
			if ufo-gone is false:
				unless u02 is unvisited and u24 is unvisited:
					say "That shy UFO isn't visible any more, even though you'd expect to see it here.";
				now ufo-gone is true;

table of markables
rm1	x-1	rm2	x-2	msg
u01	false	u25	false	"END, FOE!"
u02	false	u24	false	"CUR! ASP!"
u03	false	u23	false	"FREE COBB!"
u04	false	u22	false	"DAN & HER!"
u05	false	u21	false	"KNIT, FIDO!"
u06	false	u20	false	"HAH, BUB!"
u07	false	u19	false	"IT'LL PASS!"
u08	false	u18	false	"LOG TWO."
u09	false	u17	false	"SCRY? BLAH!"
u10	false	u16	false	"ROB & HER!"
u11	false	u15	false	"HIDE! STOP!"
u12	false	u14	false	"BABE & POPS!"
u13	false	bullpen	false	"PENT CRAG...with GLEN & TYRA scribbled below."
d05	false	bullpen	false	"AVID?! DIVA!"
d04	false	bullpen	false	"PONY? NOPE!"
d03	false	bullpen	false	"INFO TOWN."
d02	false	bullpen	false	"GLUM? UP, GO!"
d01	false	bullpen	false	"HOLY SLOB!"
d10	false	bullpen	false	"FOE DUE!"
d09	false	bullpen	false	"END DUE!"
d08	false	bullpen	false	"YO YO ISIS!"
d07	false	bullpen	false	"CRY D'OH!"
d06	false	bullpen	false	"SAY, MEG!"
d15	false	bullpen	false	"INK?! FAD!"
d14	false	bullpen	false	"BIG LEG."
d13	false	bullpen	false	"GLEN FAHY."
d12	false	bullpen	false	"ROW TWO."
d11	false	bullpen	false	"BE, IF..."
d20	false	bullpen	false	"HEY LOU, REAL BOSH!"
d19	false	bullpen	false	"PRY, CAT!"
d18	false	bullpen	false	"BIFF = PILL"
d17	false	bullpen	false	"WHEW! TILT!"
d16	false	bullpen	false	"OOH AAH! ALL ODD!"
d25	false	bullpen	false	"FED, STU? FIX SPA!"
d24	false	bullpen	false	"LIES LOSE!"
d23	false	bullpen	false	"RANK EVIL!"
d22	false	bullpen	false	"FUN? PAH!"
d21	false	bullpen	false	"SIT UP! BLAZE!"

check taking marker:
	say "It's there for reference. Plus, I checked: it's not magical itself." instead;

the pen is cyclable. description is "You check to make sure it [one of][or]still [stopping] writes okay. Yep."

the lump of lye is cyclable. "Some lye lies here. Ha, ha.". description of lye is "It's a lump of lye[if player has lye], which is non-caustic[else], and it doesn't look poisonous. Well, you can always UNDO if it is[end if]."

after printing the name of the lye while taking inventory:
	if ant is in lalaland or nag is in lalaland:
		say " (half the size it was)";
	continue the action;

after taking inventory:
	if crood sheet is off-stage:
		say "You're thinking it'd be kind of nice to have some sort of tip. It makes you sad you don't have it.";
	continue the action;

the can't eat unless edible rule is not listed in any rulebook.

check eating:
	if noun is a oaf or noun is diver:
		say "You're bigger than them, but there's too much of them to eat." instead;
	if noun is pies:
		say "They smell meaty, but like nothing you know. You're worried actually eating them might be totally against nature." instead;
	if noun is prune trove:
		say "Ugh." instead;
	if noun is melon:
		say "It's too big, and you can't skin it anyway." instead;
	if noun is lye:
		say "It doesn't seem lethal, but still, no." instead;
	if noun is pecan:
		say "The pecan almost seems to growl at you as you try." instead;
	if noun is thug or noun is punk:
		say "You ignore that they are about to serve you YOUR lunch." instead;
	if noun is a person:
		say "No." instead;
	if noun is steeds:
		say "They are probably as feisty as they are nutritious." instead;
	if noun is tiger:
		say "That's kind of ambitious. And backwards." instead;
	if noun is an animal:
		say "No." instead;
	if noun is pulse or noun is slab:
		say "That's not the action you need." instead;
	if noun is ribs:
		say "It's just bone-ribs, not barbecued ribs." instead;
	say "You don't need to eat to win this game. Well, maybe you need to eat your Wheaties or fish or whatever back on the other side of the screen, but yeah." instead;

after taking lye:
	say "It doesn't burn your fingers right away, which is always nice."

the ant is a zooish animal. description is "This ant should be in the odd zoo."

the nag is a zooish animal. description is "This nag should be in the odd zoo."

chapter specific tangentials

the ground is a backdrop. the ground is everywhere. description is "[say-ground]."

instead of doing something with ground:
	if action is procedural:
		continue the action;
	say "The ground, well, you can't do much with it.";

to say say-ground:
	if player is in u14 or player is in u12:
		say "[unless its-muddy]There's solid ground up to about six inches from the post all around, but there's [italic type]air[roman type] right by it. Hm[else]You admire your handiwork, or the verbal equivalent of handiwork, for a minute[end if]";
		continue the action;
	if player is in u13 and onyx is in lalaland:
		say "The ground has a big hole in it you can go down";
	say "The ground is unremarkable here[if location of player is mine], which is kind of remarkable for such a remarkable place[else], not really different from above[end if]";

understand "mud" as ground when ground-is-mud.

to decide whether its-muddy:
	choose row with myidx of 20 in the table of accomp;
	if did-accomp entry is true:
		decide yes;
	decide no;

to decide whether ground-is-mud:
	if player is in u12 or player is in u14:
		if its-muddy:
			decide yes;
	decide no; [?? can you re-muddy?]

the psst is tangential. up-room of psst is u05. down-room of psst is u21. description of psst is  "You can't see where it's coming from."

understand "voice" as psst.

instead of doing something with psst:
	if action is procedural:
		continue the action;
	say "It's just trying to help.";

the cold frog is a tangential. up-room of cold frog is u03. down-room of cold frog is u23. "A cold frog ribbits along here.". description is "It seems happy as it is and right in the place it needs to be."

Include (-
	has transparent animate
-) when defining cold frog.

the ferns are plural-named and tangential. up-room of ferns is u04. down-room of ferns is u22. "Ferns here make music as the air blows through them."

description of ferns is "They're sort of bluish and more grassy than planty."

check taking ferns:
	say "You can't quite uproot them, but they look...odd." instead;

after going to a room (this is the move tangentials rule):
	move-tangentials location of player;
	continue the action;

to move-tangentials (myr - a room):
	d "Move tangentials rule.";
	repeat with TT running through tangentials:
		if TT is not in lalaland:
			d "[TT] [up-room of TT] [down-room of TT].";
			if up-room of TT is myr:
				d "Moving [TT] to [myr].";
				now TT is in myr;
			if down-room of TT is myr:
				now TT is in myr;

the air is a backdrop. the air is everywhere. description is "It's air."

instead of doing something with the air:
	say "You don't need to do anything with the air except breathe it."

book mapping front

[dont need to declare rooms uppy: they are all uppy by default]

a room can be multmark. a room is usually not multmark.

to say onho:
	say " of the [if onyx is in u13]onyx[else]hole[end if]"

to say opu:
	say " of the pulse";

a room can be uppy, downy or bzzt. a room is usually uppy.

a room can be dumped. a room is usually not dumped.

u02 is east of u01. u03 is east of u02. u04 is east of u03. u05 is east of u04.

u01 is a privately-named multmark room. printed name of u01 is "Way northwest[onho]".

u02 is privately-named. printed name of u02 is "North-northwest[onho]".

u03 is privately-named. printed name of u03 is "Way north[onho]".

u04 is privately-named. "[rough-blah][if ferns are visible]. Some ferns lie here, too[end if].". printed name of u04 is "North-northeast[onho]".

u05 is privately-named. printed name of u05 is "Way northeast[onho]".

u06 is a privately-named room. printed name of u06 is "[gomu], West-northwest[onho]". "[rough-blah][one of]. You don't see any oafs here, even though it's murky enough to be the golem murks. But you[or]. You[stopping] hear something."

to say gomu:
	say "GOLEM MURKS"

u07 is east of u06. u08 is east of u07. u09 is east of u08. u10 is east of u09.

u07 is privately-named. printed name of u07 is "Just northwest[onho]". "[u07-33]."

to say u07-33:
	say "Everything seems purply, inkier here. You think you hear a jolly cheer, too[if hotel is visible]. That hotel sure is imposing[end if][if gym is visible]. Also, there's a gym here[end if]"

u08 is privately-named. printed name of u08 is "Just north[onho]".

u09 is privately-named. printed name of u09 is "RIVER[if arena is in u09] with arena[end if], just northeast[onho]".

description of u09 is "[if-ark]."

to say if-ark:
	say "[if ark is visible]An ark is half-submerged in the semi-underground river that [flo-go] here[else]A river [flo-go] underground, here[end if][carried-away]";

to say carried-away:
	if river-can-hint:
		say ". If you dropped something in the river, who knows where it might end up"

to say flo-go:
	say "[if river-can-hint]flows[else]disappears[end if]"

u10 is privately-named. printed name of u10 is "East-northeast[onho]". "[rough-blah]. There's a cubed melon here."

the cubed melon is scenery in u10. "The cubed melon is--well, you've never seen anything like it. It's a total head scratcher. It must be special to Green Terra. Perhaps there's significance to why it's right here, too."

u06 is south of u01. u07 is south of u02. u08 is south of u03. u09 is south of u04. u10 is south of u05. 

u11 is a room. u12 is east of u11. u13 is east of u12. u14 is east of u13. u15 is east of u14.

u11 is privately-named. printed name of u11 is "Way west[onho]".

u12 is privately-named. printed name of u12 is "Just west[onho]".

u13 is privately-named. "[if onyx is in u13]There is a big obelisk of onyx here[it-mocks][else]There's a huge hole where the onyx was[end if]. It's very open here, and you can go pretty much any direction.[if marker is unexamined] There's also a marker in the ground. From what you can see, they're scattered all over, every few paces.[end if]". printed name of u13 is "GREEN TERRA[if number of visited rooms is 1] (wherever that is)[end if]". understand "terra" as u13.

a thing can be examined or unexamined. a thing is usually unexamined.

after examining a thing:
	if noun provides the property examined:
		now noun is examined;
	continue the action;

check examining a direction:
	if noun is up:
		say "Sky." instead;
	if noun is down:
		say "You see the ground." instead;
	if noun is inside or noun is outside:
		say "You don't need to search in this game." instead;
	if noun is nonviable:
		say "You're blocked going that way." instead;
	say "You can probably just go [noun]." instead;

to say it-mocks:
	say ". It seems to be muttering, as if to taunt you";

u14 is privately-named. printed name of u14 is "Just east[onho]".

u15 is privately-named. printed name of u15 is "Way east[onho]".

u11 is south of u06. u12 is south of u07. u13 is south of u08. u14 is south of u09. u15 is south of u10. 

u16 is a room. u17 is east of u16. u18 is east of u17. u19 is east of u18. u20 is east of u19.

river-cheat is a truth state that varies.

the river is a backdrop. the river is in u09 and u17. "It's [if river-cheat is true]once again still[else if number of unvisited uppy rooms is 0]flowing along[else]very still[end if], and it goes underground, which is why you can't see it many other places[if river-cheat is false]. Anything you dropped in there might get carried who knows where[end if]. Eddies swirl clockwise."

understand "swim" as a mistake ("The [if ford is visible]ford[else]river[end if] doesn't seem to lead anywhere.") when river is visible or ford is visible.

u16 is privately-named. printed name of u16 is "West-southwest[onho]".

u17 is privately-named. printed name of u17 is "RIVER[if arena is in u17] with arena[end if], just southwest[onho]".

description of u17 is "[if-ark]."

u18 is privately-named. printed name of u18 is "Just south[onho]".

u19 is privately-named. printed name of u19 is "Just southeast[onho]". "[u07-33]"

u20 is privately-named. printed name of u20 is "[gomu], east-southeast[onho]". "[rough-blah][one of]. You don't see any oafs here, even though it's murky enough to be the golem murks. But you[or]. You[stopping] hear something."

u16 is south of u11. u17 is south of u12. u18 is south of u13. u19 is south of u14. u20 is south of u15. 

u21 is a room. u22 is east of u21. u23 is east of u22. u24 is east of u23. u25 is east of u24.

u21 is south of u16. u22 is south of u17. u23 is south of u18. u24 is south of u19. u25 is south of u20. 

u21 is a privately-named room. printed name of u21 is "Way southwest[onho]".

u22 is privately-named. "[rough-blah][if ferns are visible]. Some ferns lie here, too[end if].". printed name of u22 is "South-southwest[onho]".

u23 is privately-named. printed name of u23 is "Way south[onho]".

u24 is privately-named. printed name of u24 is "South-southeast[onho]".

u25 is privately-named. printed name of u25 is "Way southeast[onho]".

a room has a number called shiftability.

shiftability of u01 is 1.

a room can be listeny. a room is usually not listeny.

chapter diagonals

u07 is southeast of u01. u06 is southwest of u02.
u08 is southeast of u02. u07 is southwest of u03.
u09 is southeast of u03. u08 is southwest of u04.
u10 is southeast of u04. u09 is southwest of u05.

u12 is southeast of u06. u11 is southwest of u07.
u13 is southeast of u07. u12 is southwest of u08.
u14 is southeast of u08. u13 is southwest of u09.
u15 is southeast of u09. u14 is southwest of u10.

u17 is southeast of u11. u16 is southwest of u12.
u18 is southeast of u12. u17 is southwest of u13.
u19 is southeast of u13. u18 is southwest of u14.
u20 is southeast of u14. u19 is southwest of u15.

u22 is southeast of u16. u21 is southwest of u17.
u23 is southeast of u17. u22 is southwest of u18.
u24 is southeast of u18. u23 is southwest of u19.
u25 is southeast of u19. u24 is southwest of u20.

section roomcheck - not for release

a direction can be useful. a direction is usually useful.

down is not useful. up is not useful. inside is not useful. outside is not useful.

print-dirs is a truth state that varies.

when play begins (this is the show what leads where rule):
	if print-dirs is true:
		repeat with x running through useful directions:
			let q be 0;
			repeat with ur running through uppy rooms:
				let z be shiftability of ur;
				if the room x of ur is not nothing:
					increment q;
					say "[q]. [x]: [z] to [shiftability of room x of ur].";
				else:
					say "[x]: [z] no exit.";
		repeat with x running through useful directions:
			let q be 0;
			repeat with ur running through downy rooms:
				let z be shiftability of ur;
				if the room x of ur is not nothing:
					increment q;
					say "[q]. [x]: [z] to [shiftability of room x of ur].";
				else:
					say "[x]: [z] no exit.";

chapter THE CENTER

instead of doing something with onyx:
	say "You balk at the onyx. You can't seem to do anything else--you're blocked by hearing 'Oho, bub!' in your mind."

The Obelisk of Onyx is scenery in u13. "It's just onyx. Although its roof ebbs a bit--a possible weakness."

The hole is scenery. "About all you can do with the hole is enter it."

the player is in u13.

description of the player is "The ugly oafs must have seen something in you. You're neither ugly, nor oafish, you think. They said you were shifty, whatever that means--but given they think ugly and oafs aren't perjorative, that probably wasn't an insult."

[??undesc]

chapter river hinting

used-hint is a truth state that varies.

a thing can be rivered. a thing is usually not rivered.

to decide whether river-can-hint:
	if used-hint is true or number of uppy not visited rooms > 0:
		decide no;
	decide yes;

for printing a locale paragraph about a rivered thing (called dt):
	say "[one of]Hey, look! [or][stopping][if dt is plural-named]Those[else]That[end if] [dt] [one of]popped back up here after a trip in the river. Not even wet. Weird[or]lie[if dt is singular-named]s[end if] here after a trip in the river[stopping].";
	now dt is mentioned;

check inserting into river:
	if noun is diver:
		say "They already went in there." instead;
	if noun is a person or noun is an animal:
		say "You wouldn't win that wrestling match." instead;
	unless river-can-hint:
		say "The river is calm. You'd just get [the noun] wet." instead;
	let listly be false;
	repeat through table of flippies:
		if noun is fromf entry:
			now listly is true;
	if listly is true:
		choose row with fromf of noun in table of flippies;
		if cr1 entry is location of player:
			move noun to cr2 entry;
		else if cr2 entry is location of player:
			move noun to cr1 entry;
		else if a random chance of 1 in 2 succeeds:
			move noun to cr1 entry;
		else:
			move noun to cr2 entry;
		now used-hint is true;
		now noun is rivered;
		say "The river sends [the noun] floating underground before calming down. You [if location of noun is downy and onyx is in u13]hope you didn't just pitch something away[else]hear a THUNK [how-far of location of player and location of noun][end if]. Maybe [the noun] [if noun is plural-named]are[else]is[end if] in a better place, now." instead;
	else:
		say "The river spits [the noun] back up into your hands. Guess you may not need to change [if noun is plural-named]those[else]that[end if]." instead;

to say how-far of (r1 - a room) and (r2 - a room): [for the hinting, we look at the pythagorean values of the distance. N, NE, NN/NNE, 2NE/3E/3EN, FAR are grouped]
	if r1 is uppy and r2 is downy:
		say "echoing from below the hole";
		continue the action;
	let s1 be shiftability of r1 - 1;
	let s2 be shiftability of r2 - 1;
	let x1 be remainder after dividing s1 by 5;
	let x2 be remainder after dividing s2 by 5;
	let y1 be s1 / 5;
	let y2 be s2 / 5;
	let sq be ((y1 - y2)*(y1 - y2)) + ((x1 - x2)*(x1 - x2));
	if sq is 0:
		say "right behind you";
	else if sq is 1:
		say "very near";
	else if sq <= 2:
		say "pretty near";
	else if sq <= 5:
		say "a bit away";
	else if sq <= 10:
		say "kind of far away";
	else:
		say "very far away";
	
book mapping back

d05 is a privately-named room. printed name of d05 is "Way northwest[opu]"

d04 is east of d05. d03 is east of d04. d02 is east of d03. d01 is east of d02.

d04 is privately-named. printed name of d04 is "Dopy Zone, north-northwest[opu]".

Bob is a person in d04. "An oaf named Bob is here. You know its name is Bob because it keeps muttering [bob-bob]."

description of Bob is "Even Bob's fur spells out B-O-B. Bob looks hypnotized."

instead of doing something with bob:
	if action is procedural:
		continue the action;
	say "Bob simply keeps saying [bob-bob]." instead;

to say bob-bob:
	say "'Bob... Bob...' [if down-score < 2]but it can't be the same shifty deal as by the onyx[else]as you'd expect[end if]";

d03 is privately-named. printed name of d03 is "Way north[opu]". "The marker labels this area as INFO TOWN, but it seems to be neither a town nor a place that gives info."

d02 is privately-named. printed name of d02 is "North-northeast[opu]".

Anna is a female person in d02. "An oaf named Anna is here. You know its name is Anna because it keeps muttering [anna-anna]."

to say anna-anna:
	say "'Anna... Anna...' [if down-score < 2]but it can't be the same shifty deal as by the onyx[else]as you'd expect[end if]";

description of Anna is "Even Anna's fur spells out A-N-N-A. Anna looks hypnotized."

instead of doing something with anna:
	if action is procedural:
		continue the action;
	say "Anna simply keeps saying [anna-anna]." instead;

d01 is privately-named. printed name of d01 is "Way northeast[opu]".

d10 is south of d05. d09 is east of d10. d08 is east of d09. d07 is east of d08. d06 is east of d07. d09 is south of d04. d08 is south of d03. d07 is south of d02. d06 is south of d01. printed name of d10 is "North-northwest[opu]: [if bane hive is visible]BANE HIVE[else]PRUNE TROVE[end if]"

description of d10 is "[if bane hive is visible]You hear buzzing from hive. A bane hive. That buzzing is goading you to attack it, which would be fatal...without a plan of retreat[else if prune trove is visible]Something else has replaced the hive's buzzing, and a prune trove lies here. The trove can't be what the hulk was protecting and yelling 'MINE' over[else if mn is visible]You can enter a mine here[end if]."

to say h-b:
	if hulk is in lalaland:
		say "hulk";
	else:
		say "bee";

check going inside when player is in d10:
	if mn is in d10:
		if player does not have dudes:
			say "You are pushed back. [if player has fry gun]You have gotten what you need[else]You find yourself thinking, hm, what's this about[end if]." instead;

the bane hive is scenery in d10. "It pulses as if daring you to attack it and break it open."

the prune trove is scenery. description is "The prune trove is not the sort of thing you'd have expected a boxy hulk would be able to guide. And it doesn't look at all like the mine the hulk referred to[if hulk is visible].[paragraph break]The hulk booms 'MINE!' again as it sees you looking at the trove[else]. At least that stupid hulk isn't there to be all 'MINE!' and stuff[end if]."

the statue of three cool dudes is a thing. description of cool dudes is "The middle dude looks cooler than the left dude or right dude. But they all look like they know something you don't, and you should know who they are, or what they're [italic type]about[roman type]. "

the middle guy is part of the statue of three cool dudes. description of middle guy is "Man! He looks handsome and clever and cosmically in tune. He...he must be SOMEBODY. He could probably go save fantasy worlds if he wants, but he has the wisdom and get-go to CREATE them."

the left guy is part of the statue of three cool dudes. description of left guy is "He looks pretty swell and clever and socially conscious, but not as much as the middle guy. He...he must be SOMEBODY, though, still."

the right guy is part of the statue of three cool dudes. description of right guy is "He looks pretty swell and clever and socially conscious, but not as much as the middle guy. He...he must be SOMEBODY, though, still."

understand "middle/center dude/guy" and "center/dude" as middle guy.
understand "left dude" as left guy.
understand "right dude" as right guy.

understand "andy/boyd" and "andy boyd" as left guy.
understand "davy/fink" and "davy fink" as right guy.
understand "perry/creel" and "perry creel" as middle guy.

does the player mean doing something with the middle guy: it is very likely.

after doing something with statue of three cool dudes:
	set the pronoun them to cool dudes;
	
the bee is a followy fixed-off animal. "That bee you released from the bane hive is buzzing around dangerously.". description is "It looks pretty angry and violent. You'll need some way to slow it down."

the boxy hulk is a person. "[one of]Man, reinforcements for the bee! Something must be hidden here. A boxy hulk--actually shaped like a box--sees you and booms 'MINE!' Fortunately, it's as mobile as a box[or]That boxy hulk is still here. It's actually shaped like a box. And mobile[stopping].". description is "The boxy hulk looks around for a fight but doesn't think you're worth not guarding--the prune trove, apparently."

understand "reno" as a mistake ("You try to abolish the hulk to Nevada, but it doesn't quite work.[check-ach of 3]") when boxy hulk is visible.

does the player mean attacking the hive: it is very likely.
does the player mean attacking a person: it is likely.

instead of attacking:
	if noun is bane hive:
		say "The bane hive splits open, to reveal a rather large bee! Behind the bane hive, you see a prune trove.";
		now bee is followy;
		now prune trove is in d10;
		now bane hive is in lalaland;
		if tiger is in d10 or thug is in d10 or punk is in d10:
			say "The bee chases after your pursuer, who seems more aggressive than you are. As you sit around feeling clever, there's a rumble from the ground below. You fall backwards and black out. When you wake up, a boxy hulk towers over the prune trove.";
			now all chasey people are in lalaland;
			now bee is in lalaland;
		now bee is in location of player instead;
	if noun is oaf:
		say "Mean." instead;
	if noun is punk or noun is thug:
		say "You are easy for them to take down.";
		end the story instead;
	if noun is pulse or noun is slab:
		if player has fry gun:
			try shooting noun instead;
		say "The wrath pulse throbs faster, sensing your futile rage." instead;
	if noun is a person:
		say "You won't be able to beat up anyone, here." instead;
	if noun is fry gun:
		say "You want to attack something WITH the fry gun, instead." instead;
	if noun is onyx:
		say "You can't do anything with it. You can't get close to it." instead;
	if noun is statue of three or noun is part of statue of three:
		say "You suppress your jealousy of how cool the three dudes are. [if player has fry gun]They HELPED you get that gun after all[else]Maybe they could help you[end if]." instead;
	say "You don't want to beat up anything inanimate, unless it's menacing." instead;

bee-nice is a truth state that varies.

definition: a person (called per) is chasey:
	if per is off-stage or per is in lalaland, decide no;
	if per is not followy, decide no;
	if per is thug or per is punk:
		if location of per is unvisited:
			decide no;
	decide yes;

to say tigfo:
	now tiger is followy;
	
to say thufo:
	now thug is followy;

the thug is a followy person. "[one of]You have stumbled on a thug's territory! He yells at you menacingly.[thufo][or]The thug looks at you with hate and disdain. You better keep moving.[stopping]". description is "He's just looking for a fight, and right now, you're the best option."

the serf is a person. "The serf should not be around here.". description is "You see no trace of the thug on him."

the punk is a followy person. "[one of]You have stumbled on a punk's territory! He yells at you menacingly.[pufo][or]The thug looks at you with hate and disdain. You better keep moving.[stopping]". description is "He's just looking for a fight, and right now, you're the best option."

to say pufo:
	now punk is followy;

follow-warn is a truth state that varies.

to say fol-note of (pp - a person):
	now pp is followy;
	if follow-warn is false:
		now follow-warn is true;
		ital-say "your adversary is pretty aggressive, but you can still do stuff like EXAMINE or LOOK without them jumping you."

the tyro is a person. description is "You shouldn't be able to see him."

when play begins:
	let a be a random number from 1 to 4;
	let b be a random number from 1 to 3;
	if b is a:
		increment b;
	move thug to cornval of a;
	move punk to cornval of b;

to decide which room is cornval of (nu - a number):
	if nu is 1, decide on d05;
	if nu is 2, decide on d01;
	if nu is 3, decide on d25;
	if nu is 4, decide on d21;
	decide on d13;

to say fol-text of (JJJ - a person):
	repeat through table of followtext:
		if JJJ is fol entry:
			say "[foltext entry]";
			continue the action;
	say "follows"
	
table of followtext
fol	foltext
bee	"buzzes along behind--BZZ, BZZ"
thug	"shambles along behind, talking to an imaginary boss"
punk	"slam-dances along behind"
tiger	"prowls behind, waiting for you to get tired--maybe you could distract it with something to fight, or somewhere to call home"
diver	"trudges behind"

every turn (this is the attackers rule):
	repeat with JJ running through chasey people:
		if JJ is not in location of the player:
			say "[The JJ] [fol-text of JJ]!";
			if JJ is bee and zoo is visible:
				say "The bee buzzes around the zoo, but it won't fit in, in its current state.";
			if location of player is u15 or location of player is u11:
				if JJ is tiger:
					say "[line break]The tiger twitches its nose. It perhaps smells less resistant food in the odd zoo. It walks in. You hear no animal screams, which is a relief. The tiger will be okay there.";
					now tiger is zooish;
					dispose tiger;
					see-about-stye;
					continue the action;
			if number of followy people in location of player is 1:
				say "[line break]The [list of followy people in location of player] and [JJ] seem to see right through you, even though you're between them. Each sees the other as a more viable opponent to fight. You have the sense to get out of the way as they rumble around. You can't see who wins, as the fight spills over well away from you, but you didn't lose, and that's cool.";
				if bee is visible:
					now boxy hulk is in d10;
				dispose a random followy person in location of player;
				dispose JJ instead;
			if location of player is d10 and hulk is in d10:
				say "[line break]The boxy hulk and the [JJ] eye each other suspiciously. The [JJ] circles around, then lunges. The boxy hulk roars 'MINE! MINE! MINE!' and finally moves its feet! A flailing of fists and limbs ensues, with appropriate yelling[if JJ is tiger] and growling[end if]. You're hidden for most of it, but when you look back, there's no trace of the hulk or the [JJ].";
				dispose JJ;
				now hulk is in lalaland instead;
			now JJ is in location of the player;
			if oaf is in location of the player:
				say "The oaf is too scared of the intruder! He runs to the other place you could have summoned it.";
				if oaf is in u12:
					now oaf is in u14;
				else:
					now oaf is in u12;
		else:
			if mulligan of JJ is false:
				say "You'd better get a move on. That [JJ] looks pretty aggressive[if JJ is bee]--but it's a bee. You may have several ways to outwit it[end if].";
				now mulligan of JJ is true;
			else if action is procedural:
				say "You don't have much time. You'd better get moving.";
			else:
				say "The [JJ] closes in! As you are pounded into unconsciousness, you think maybe you could've run somewhere and done some magic to them.";
				no-continue;

every turn:
	if thug is in location of player or punk is in location of player or bee is in location of the player or tiger is in location of player:
		if diver is in location of player:
			let myr be d13;
			say "The diver oaf, scared, runs away!";
			let SHI be shiftability of location of player;
			now SHI is SHI + 12;
			if SHI > 25:
				now SHI is SHI - 25;
			if location of player is uppy:
				repeat with daroom running through rooms:
					if shiftability of daroom is SHI and daroom is uppy:
						move diver to daroom;
			if location of player is downy:
				repeat with daroom running through rooms:
					if shiftability of daroom is SHI and daroom is downy:
						move diver to daroom;
		if oaf is in location of player:
			say "The oaf, scared, runs away!";
			if player is in u12:
				now oaf is in u14;
			else:
				now oaf is in u12;
	if oaf is in location of player and diver is in location of player:
		say "[one of]The oaf and the diver whisper together, then point at you and bounce up and down. They're clearly excited.[or]The oaf and diver's second reunion is a bit awkward. You would like to find somewhere [if ford-dive is true or river-dive is true]else [end if]for the diver to, well, dive.[stopping]";

to no-continue:
	choose row with final response activity of nodoing in the table of final question options;
	now only if victorious entry is true;
	end the story;
	
to dispose (x - a person):
	now x is in lalaland;
	now x is beat;

to decide whether the action is procedural: [proc]
	if examining or taking inventory, decide yes;
	if looking, decide yes;
	if searching or kissing, decide yes;
	if listening, decide yes;
	if objhinting or hinting, decide yes;
	if thinking or txing, decide yes;
	if eating, decide yes;
	decide no;

d09 is privately-named. printed name of d09 is "Just northwest[opu]".

d08 is privately-named. printed name of d08 is "Just north[opu]".

d07 is privately-named. printed name of d07 is "Just northeast[opu]".

d06 is privately-named. printed name of d06 is "East-northeast[opu]".

d15 is privately-named. printed name of d15 is "Way west[opu]".

d14 is privately-named. printed name of d14 is "Just west[opu]".

d13 is privately-named. printed name of d13 is "WRATH PULSE". "This is just like the ex-onyx area above, but darker, though about the same size. Both have a hole going down. A talk slab rests here. It looks written on, yet at the same time, it isn't silent."

the wrath pulse is scenery in d13. "You can't see it, except how it sort of blurs everything behind it, like a mirage. But you can feel it, and you can hear it. If you listen, you'll know what it says."

instead of doing something with the wrath pulse:
	if action is procedural:
		continue the action;
	if current action is shooting:
		continue the action;
	say "You can't do much to the wrath pulse."

the talk slab is scenery in d13. "While there's writing all over the talk slab, it's convoluted and illegible. It is, however, signed SEA GUY. Perhaps knowing the right word would cut through the combination of the writing and the wrath pulse[if player has pens or player has pen]. Your pen[ifpen] seem drawn to it[end if]."

to say ifpen:
	if player has pens:
		say "s";

d12 is privately-named. printed name of d12 is "Just east[opu]".

d11 is privately-named. printed name of d11 is "Way east[opu]". "You could hear something if you listen closely."

d15 is south of d10. d14 is east of d15. d13 is east of d14. d12 is east of d13. d11 is east of d12. d14 is south of d09. d13 is south of d08. d12 is south of d07. d11 is south of d06.

d20 is south of d15. d19 is east of d20. d18 is east of d19. d17 is east of d18. d16 is east of d17. d19 is south of d14. d18 is south of d13. d17 is south of d12. d16 is south of d11.

d20 is privately-named and multmark. printed name of d20 is "West-south-west[opu]". "You can go any direction here. [if mesh is in d20]The goal now has mesh in it, so whatever game the oafs play, they won't have to fetch a ball[else]A goal sits here. Well, it's two goalposts. They're not connected by anything[end if]."

the goal is scenery in d20. "It's two uprights connected by a crossbar. [if mesh is in d20]The oafs will be able to play whatever sport they play now, thanks to you[else]The goal doesn't have any net that would make it easier for the oafs to chase a ball down after a score. No, not quite a net[get-feel][end if]."

understand "upright/uprights/crossbar/crossbars/goalpost/goalposts/post/posts" and "goal post/posts" as goal.

to say get-feel:
	say "[if down-score is 0]. You get the feeling that if you knew what to do here, this goal would be easy to tweak, since it's stationary[else]. Now you've done something, the goal could, maybe should, be easy to change[end if]"

the mesh is scenery. "The mesh is tied to the goal."

instead of doing something with mesh:
	if action is procedural:
		continue the action;
	say "You put the mesh there. It'd be mean to take it from the oafs before they saw it."

d19 is privately-named. printed name of d19 is "Just southwest[opu]".

d18 is privately-named. printed name of d18 is "Just south[opu]".

d17 is privately-named. printed name of d17 is "Just southeast[opu]". "You hear--well, something. Perhaps it is coming from that glad idol."

the glad idol is scenery in d17. "It looks happy as-is. But it keeps mouthing 'huh-huh.'"

d16 is privately-named. printed name of d16 is "East-southeast[opu]".

d25 is south of d20. d24 is south of d19. d23 is south of d18. d22 is south of d17. d21 is south of d16.

d24 is east of d25. d23 is east of d24. d22 is east of d23. d21 is east of d22.

d25 is privately-named. printed name of d25 is "Way southwest[opu]". "[rough-blah][if x-it is visible]. You also made an exit out of here[end if]."

d24 is privately-named. printed name of d24 is "South-southwest[opu]". "You feel nothing but rank evil here. Plus there's also a [if rift is visible]huge rift[else]small ford[end if]."

the huge rift is scenery in d24. "It'd be scary to fall into, with the vortex of sludge, but fortunately, it's obvious to walk around."

check entering rift:
	say "I won't let you kill yourself that way." instead;

instead of doing something with the vortex:
	if action is procedural:
		continue the action;
	say "You can't do much with the vortex. It'd be easier to deal with the rift."

the vortex is part of the rift. description of vortex is "It's full of sludge and swirling counterclockwise. It's too far away to deal with--but maybe you can close the rift."

the small ford is scenery. "It's less intimidating than the rift but still very cloudy."

check entering ford:
	say "You splash around for a bit. Whee." instead;
	
d23 is privately-named. printed name of d23 is "Way south[opu]". description of d23 is "[rough-blah][if snare is visible]. There's also a snare here. You wonder what got caught in it[end if]."

the snare is scenery in d23. "It seems to be pulsing, as if it caught someone or something, but what?"

d22 is privately-named. printed name of d22 is "South-southeast[opu]".

d21 is privately-named. printed name of d21 is "Way southeast[opu]". description is "[if x-it is visible]There's an exit out of here.[else]The fog to the south and southwest is tough to get around.[end if]"

every turn when player is in d21 and stab bats are in d21:
	say "You feel a bite from stab bats! It's nothing lethal, but it is annoying.";

stab bats are scenery in d21. "You can't see the stab bats, but you can FEEL them biting you."

corner-warn is a truth state that varies.

carry out going when player is in d13 and corner-warn is false:
	if noun is up:
		say "You back out--again, you feel a wind swirl counterclockwise around you, then stop, then swirl back clockwise. Maybe you can do more aboveground.";
	else if the room noun of d13 is nowhere:
		do nothing;
	else:
		say "Boy. This is definitely darker than aboveground. You might not want to walk into any dark corners. Someone might be waiting for a fight. So you may need a plan to get away.";
		now corner-warn is true;

carry out going when up-score is 0:
	let a be the remainder after dividing shiftability of location of player by 5;
	let note-it be false;
	if a is 0:
		if noun is southeast or noun is east or noun is northeast:
			now note-it is true;
	if a is 1:
		if noun is southwest or noun is west or noun is northwest:
			now note-it is true;
	d "[a] [noun].";
	if note-it is true:
		if warp-block is true:
			say "No, that'd be warping to the other side. You can change this option with WARP." instead;
		say "[one of]Hm, weird. The world warps around a bit, and the onyx you thought was behind you now looks to be ahead--and to the side a bit of where you'd expect. You can .[wfak-d][or]You feel that warping again.[or]The warp now feels more natural.[or]Warping, yet again.[stopping]";
	continue the action;

shiftability of d05 is 1.

d05 is downy. d04 is downy. d03 is downy. d02 is downy. d01 is downy.
d10 is downy. d09 is downy. d08 is downy. d07 is downy. d06 is downy.
d15 is downy. d14 is downy. d13 is downy. d12 is downy. d11 is downy.
d20 is downy. d19 is downy. d18 is downy. d17 is downy. d16 is downy.
d25 is downy. d24 is downy. d23 is downy. d22 is downy. d21 is downy.

going east in d01 is mapwarping. going west in d25 is mapwarping.

chapter mine

the Mine is a bzzt room. "You are in a deserted mine. There's a safe with a knob here[if player has fry gun], but you already broke in[end if]. You can only go out."

the safe is scenery in the mine. "[if knob is part of the safe]There's a knob in the center. It doesn't even have a door[else]The wall with the knob has vanished[end if]. You notice numerals on the safe."

the numerals are plural-named. the numerals are part of the safe. description of numerals is "Some combinations are scratched out here: [1-ran], [1-ran], [1-ran], [1-ran], [1-ran]. [if player has fry gun]It may or may not be a mystery who put those numbers there[else]It can't be any one of them. It just can't be that easy[end if]."

to say 1-ran:
	say "[one of]1-14-4[or]18-5-22[or]19-3-8[or]21-12-20[or]a big zero[in random order]";

check closing safe:
	if player has fry gun:
		say "The safe's open for good." instead;

check opening safe:
	say "[if player has fry gun]It already is[else]The right combo would probably do that[end if]." instead;

the knob is part of the safe. description is "It doesn't look broken or anything. You probably just need to TURN it to a number.  (I'll pick up on left or right.) It's labeled with numbers from 1 to 25.". understand "dial" as knob.

a thing called the FRY GUN is a thing. description is "It says FRY GUN, looks heavy duty, and feels heavy.".

chapter shooting

shooting is an action applying to one thing.

understand the command "shoot" as something new.

understand "shoot [something]" as shooting.

check going when player has fry gun:
	if player is in mine:
		continue the action;
	if player is in d13:
		say "Don't chicken out now!" instead;
	unless noun is southeast or noun is east:
		say "No. You aren't going to take a nice leisurely walk carrying this gun. You're pretty sure what it's for. You know, the wrath pulse." instead;
	if noun is east and player is in d09:
		say "That's still too roundabout. You adjust southeast.";
		try going southeast instead;
	if noun is southeast and player is in d14:
		say "That's still too roundabout. You adjust east.";
		try going southeast instead;
	say "Oof! This gun's heavy.";

to say if-hack:
	choose row 6 in the table of accomp;
	if did-you-cheat is false and did-accomp entry is true:
		say ".[paragraph break]But...but...[wfak-d]Your insight tells you there may be a frag-gulf where the wrath pulse was, and you show wisdom beyond basic words and numbers (due to your hacking the save file,) and after you discuss a way to seal it for further protection against the Sea Guy and Undug Elves, the oafs offer you a special delicacy of Green Terra: WAXY MILK! I can't even tell you how delicious it is";

carry out shooting:
	if player does not have fry gun:
		say "No gun." instead;
	if noun is pulse or noun is slab:
		say "You check off on whether using such a weapon might make you a bad person, then you convince yourself you can't be if you took the time to worry.[paragraph break]Then you just fire away at the pulse and the slab, then the slab and the pulse. As they melt, you feel relief, then you hear oafs chatteringing--sorry, chattering in the distance. 'You does'd it! You does'd it!' And you have. The pulse and slab are no more. The oafs are free to frolic. Well, until the next Sea Guy comes along, or whoever[if-hack].[check-ach of 100]";
		choose row with final response activity of nodoing in the table of final question options;
		blank out the whole row;
		end the story finally saying "You REALLY won" instead;
	if noun is player:
		say "Just the thought of those poor oafs crying profusely over being so close yet so far moves you not to pull the trigger. I mean, if your ghost hung around, they'd drive you up the wall with their chatter." instead;
	if noun is air:
		say "Fireworks AFTER you take out the wrath pulse." instead;
	if noun is not a person:
		say "Vandalism is not your thing." instead;
	say "No mere person or animal deserves the Fry Gun." instead;

chapter slaping

slaping is an action applying to one thing.

understand the command "slap" as something new.

understand "slap [something]" as slaping.

does the player mean slaping the stab bats: it is very likely.

carry out slaping:
	if noun is bats:
		say "That's the ticket! You've found how to successfully ward the stab bats off. They quit bugging you.[check-ach of 14]" instead;
	try attacking noun instead;
	the rule succeeds;

chapter diagonals

d09 is southeast of d05. d10 is southwest of d04.
d08 is southeast of d04. d09 is southwest of d03.
d07 is southeast of d03. d08 is southwest of d02.
d06 is southeast of d02. d07 is southwest of d01.

d14 is southeast of d10. d15 is southwest of d09.
d13 is southeast of d09. d14 is southwest of d08.
d12 is southeast of d08. d13 is southwest of d07.
d11 is southeast of d07. d12 is southwest of d06.

d19 is southeast of d15. d20 is southwest of d14.
d18 is southeast of d14. d19 is southwest of d13.
d17 is southeast of d13. d18 is southwest of d12.
d16 is southeast of d12. d17 is southwest of d11.

d24 is southeast of d20. d25 is southwest of d19.
d23 is southeast of d19. d24 is southwest of d18.
d22 is southeast of d18. d23 is southwest of d17.
d21 is southeast of d17. d22 is southwest of d16.

book foggy barrier

the foggy barrier is a backdrop. the foggy barrier is in u01, u02, u03, u04, u05, u06, u10, u11, u15, u16, u20, u21, u22, u23, u24, u25, d05, d04, d03, d02, d01, d10, d06, d15, d11, d20, d16, d25, d24, d23, d22, d21. "It's surprisingly solid. It may just be there so you don't have to worry about more places to go."

instead of doing something with the foggy barrier:
	if action is procedural:
		continue the action;
	say "The barrier's just weird and impenetrable. You probably don't have to worry about it.";

chapter turnto

understand the command "turn [thing] to [number]" as something new.
understand "turn [thing] to [number]" as turntoing.

turntoing is an action applying to one thing and one number.

dial-turns is a number that varies.

dial-1 is a number that varies.
dial-2 is a number that varies.
dial-3 is a number that varies.

does the player mean turntoing the knob: it is very likely;

safe-open is a truth state that varies.

check turntoing:
	if noun is not knob:
		say "You need to turn a dial or something to a number." instead;
	if safe-open is true:
		say "No point, now it's open." instead;
	if number understood > 25 or number understood < 0:
		say "The numbers range from 0 to 25." instead;
	if boxy hulk is visible:
		say "One look from the boxy hulk, and you think better. You can't beat up the hulk yourself, but maybe you can find someone who can." instead;
	if dial-turns is 0:
		say "You turn the knob left to [number understood].";
		now dial-1 is number understood;
		increment dial-turns instead;
	if dial-turns is 1:
		say "You turn the knob right to [number understood].";
		now dial-2 is number understood;
		increment dial-turns instead;
	if dial-turns is 2:
		say "You turn the knob left to [number understood].";
		now dial-3 is number understood;
		if dial-3 is 10 or dial-3 is 3:
			if dial-1 + dial-3 is 13:
				if dial-2 is 13:
					say "[line break]CLICK! The safe opens. In it, you see what must be the FRY GUN, which you take. All three cool dudes in the statue give you a thumbs-up before vanishing. You know what you must do, now.";
					now dudes are in lalaland;
					now safe-open is true;
					now player has fry gun;
					the rule succeeds;
		say "Nothing happens. The dial spins back to zero.";
		now dial-1 is -1;
		now dial-2 is -1;
		now dial-3 is -1;
		now dial-turns is 0 instead;

description of dial is "[if dial-1 is -1]It's at zero, waiting for you to figure its combination.[else if dial-2 is -1]It's at [dial-1] after you turned it left.[else]It's at [dial-2] after you turned it right.[end if]"


book general rooms

description of a room is usually "[rough-blah]."

to say rough-blah:
	if number of nonviable directions is 2:
		say "You're in a corner. The foggy barrier bends [list of nonviable directions] here";
	else if number of nonviable directions is 1:
		say "A foggy barrier spans [perp of random nonviable direction] to the [list of nonviable directions], but you can go any other way";
	else:
		say "You can go any way here, including diagonally to save time";

to say perp of (di - a direction):
	if di is north or di is south:
		say "east and west";
	else:
		say "north and south";

definition: a direction (called di) is nonviable:
	unless di is north or di is south or di is west or di is east, decide no;
	if the room di of the location of the player is nowhere, decide yes;
	decide no;

definition: a direction (called di) is viable:
	if di is up or di is down, decide no;
	if di is inside or di is outside, decide no;
	if the room di of the location of the player is nowhere, decide no;
	decide yes;
	decide no;

check going down in u13 when d13 is unvisited:
	if onyx is in lalaland:
		say "As you climb down, you feel a wind swirling clockwise. It dies down, then begins swirling counterclockwise as you reach the bottom. Down seems like up and up seems like down here, until it doesn't. The hole you just went down--looks down. Everything's a bit reversed.[paragraph break]You know, you're still not sure what this all is ABOUT.";
		now right hand status line is "[up-score]+[down-score] + [frivolous-points]";
	else:
		say "There's something dark and deep beneath the onyx, but you'll need to get rid of the onyx first." instead;

warp-block is a truth state that varies.

the can't go that way rule is not listed in any rulebook.

check going when steed-sled is true (this is the no extra exercise rule) :
	if the room noun of location of player is nowhere:
		say "The steeds pin their ears back. They don't want to run into that foggy barrier." instead;
	if noun is northeast or noun is southwest:
		say "The steeds seem to shake their head, as if that would be a waste of their energy." instead;
	let horiz be the remainder after dividing (slp - 1) by 5;
	let vert be (slp - 1) / 5;
	if slp < 13:
		if noun is northwest or noun is north or noun is west:
			say "The steeds whinny. They don't even consider turning back [noun]." instead;
		if vert is 2:
			if noun is south or noun is southeast or noun is southwest:
				say "[steed-turn of true]." instead;
		if horiz is 2:
			if noun is east or noun is northeast or noun is southeast:
				say "[steed-turn of false]." instead;
	else:
		if noun is southeast or noun is south or noun is east:
			say "The steeds whinny. They don't even consider turning back [noun]." instead;
		if vert is 2:
			if noun is north or noun is northeast or noun is northwest:
				say "[steed-turn of true]." instead;
		if horiz is 2:
			if noun is west or noun is northwest or noun is southwest:
				say "[steed-turn of false]." instead;

to say steed-turn of (bo - a truth state):
	say "The steeds take a step, then freeze up and turn their heads to the [if bo is true]left[else]right[end if]. They whinny slightly, begging, and you just can't leave them there"

check going (this is the barrier block and up-down rule):
	if noun is inside or noun is outside:
		if player is in mine:
			continue the action;
		if mn is not in d10:
			say "You don't need to go in or out in this game...well, except one place that'll be clear." instead;
		if player is not in d10:
			say "The only place to go in is in the Prune Trove, where you opened the mine." instead;
	if noun is down and player is in d13:
		say "Up, down, the hole--it's all the same.";
		try going up instead;
	if noun is up or noun is down:
		if the room noun of the location of the player is nowhere:
			say "You can't [if noun is down]burrow[else]jump[end if] like that." instead;
	if the room noun of the location of the player is nowhere:
		if player is in mine:
			say "You can only go out." instead;
		now bee-nice is true;
		say "The fog is too dense that way. You can go ";
		if location of player is u01 or location of player is d05:
			say "back south-or-east-ish." instead;
		if location of player is u05 or location of player is d01:
			say "back south-or-west-ish." instead;
		if location of player is u21 or location of player is d25:
			say "back north-or-east-ish." instead;
		if location of player is u25 or location of player is d21:
			say "back north-or-west-ish." instead;
		if the room west of location of player is nowhere:
			say "any way but west-ish." instead;
		if the room east of location of player is nowhere:
			say "any way but east-ish." instead;
		if the room south of location of player is nowhere:
			say "any way but south-ish." instead;
		if the room north of location of player is nowhere:
			say "any way but north-ish." instead;
		say "[list of viable directions]." instead;
	if the room noun of location of player is nowhere:
		say "[if barrier is visible]The foggy barrier blocks you[else]You can't go that way, but you should be able to[end if]." instead;

alluppy is a truth state that varies.

box-note is a truth state that varies. stye-note is a truth state that varies.

after printing the locale description when not-note-cheat:
	if player has rev box and box-note is false:
		say "You hear a small whizzing from the rev box. The writing on it looks shifted, now.";
		now box-note is true;
	else if player has hint stye and stye-note is false:
		say "You hear a small whizzing from the hint stye. The writing on it looks shifted, now.";
		now stye-note is true;
	continue the action;

to decide whether not-note-cheat:
	if player has stye and stye-note is false:
		decide yes;
	if player has rev box and box-note is false:
		decide yes;
	decide no;

after printing the locale description when alluppy is false (this is the clue above rule):
	if location of player is uppy:
		if number of unvisited uppy rooms is 1 and location of player is unvisited:
			say "You hear a rumbling from the center where you started: NOWHERE, ABJURER![paragraph break]";
			now alluppy is true;
		else:
			d "[number of unvisited uppy rooms] left.";
			if number of unvisited uppy rooms < 5:
				d "[list of unvisited uppy rooms] left.";
	continue the action;

alldowny is a truth state that varies.

after printing the locale description when alldowny is false and location of player is downy (this is the clue below rule):
	if location of player is downy:
		if number of unvisited downy rooms is 1 and location of player is unvisited:
			if down-score < 2:
				say "You're not sure you've mastered everything here, but it does seem backwards, a bit opposite of above. It can't be too much weirder, though. A voice cries 'Else...hath...' and it seems to be coming from the center.[paragraph break]There was a lot there, as well as by the prune trove. Maybe you can look there for clues what to do[if xyzzy-above is true and xyzzy-below is false], or maybe even try XYZZY down here, too. You never know. It might even be TOO hinty[end if].";
	continue the action;

volume verbs and such

book native verbs

check listening:
	let locpl be location of player;
	if location of player is listeny:
		choose row with rm of locpl in table of listens;
		say "[aud entry][line break]" instead;
	if bee is visible:
		say "You hear a 'Bzz' from the bee." instead;
	if location of player is d10:
		say "You hear music, from dirge to farce and back again." instead;
	if location of player is mine or location of player is downy:
		say "The wrath pulse is filled with ire. 'Duh!' As if responding to a question[if player is not in d13]. You can hear it all the way here[end if]." instead;
	if location of player is uppy:
		if number of unvisited uppy rooms is 0:
			say "'Nowhere, abjurer' still resonates from [if player is in u13]nearby[else]the center, by the onyx[end if]." instead;
	if location of player is downy:
		if number of unvisited downy rooms is 0:
			say "'Nowhere, abjurer' still resonates from [if player is in d13]nearby[else]by the onyx[end if]." instead;
	if player is in u05 or player is in u21:
		if psst is visible:
			say "The PSST is gone, now. Must've been momentary." instead;
	say "You hear nothing unusual." instead;

to say guuo:
	say "[one of]Grungy alohas. [or]'Ugly oafs!' [cycling]But there's more, if you want to listen."

table of listens
rm	aud
u04	"'Open! Stir! Open! Stir!'"
u06	"[guuo]"
u20	"[guuo]"
u07	"Jolly cheer."
u13	"[if number of unvisited uppy rooms is 0]'Oho, bub!'[else]'Onyx! Balk!'[end if] the wind seems to say, for now."
u19	"Jolly cheer."
d11	"'Grit? Crap.'"
d17	"For now, just '[one of]Ooh-aah[or]Huh-huh[or]All odd[in random order].'"

chapter examining

understand the command "[something]" as something new.

understand "[something]" as examining.

book transformations

understand "untie [text]" as a mistake ("There's no need to untie anything.")

chapter attaching

the block tying rule is not listed in any rulebook.

to wheel-to-bikes:
	if wheel is part of bikes:
		say "It already is.";
		continue the action;
	now wheel is part of bikes;
	say "The wheel snaps nicely into the broken bike.";

before taking wheel when wheel is part of the bikes:
	say "Don't undo your hard work, there." instead;

instead of putting on:
	try tying noun to second noun instead;

check inserting it into:
	try tying noun to second noun instead;

check tying chain to:
	if second noun is chain:
		say "That's knot productive." instead;
	if second noun is steeds:
		if steed-sled is true:
			say "Already attached." instead;
		if sled is visible:
			if sled-chain is false:
				say "The steeds walk over to the sled after you tie the chain to them. You hook the chain to the sled, too.";
			try tying sled to steeds instead;
		say "The steeds are pretty tame, so just harnessing them for the sake of it doesn't seem right. Maybe you could hook them up to something, though." instead;
	if second noun is sled:
		if steeds are visible and sled-chain is false and steed-sled is false:
			say "The steeds see what you're doing and walk on over.";
			try tying sled to steeds instead;
		if sled-chain is true or steed-sled is true:
			say "Already attached." instead;
		now sled-chain is true;
		now chain is part of the sled;
		say "You attach the chain to the sled. It'll be a bit easier to lug around now." instead;			
	say "You don't need to lug that around, or a simple chain won't go around it." instead;

check tying:
	if noun is dolls and second noun is hats:
		say "The hats are a bit too big for the dolls." instead;
	if second noun is dolls and noun is hats:
		say "The hats are a bit too big for the dolls." instead;
	if noun is wheel and second noun is bikes:
		wheel-to-bikes instead;
	else if noun is bikes and second noun is wheel:
		wheel-to-bikes instead;
	if noun is second noun:
		say "No need to make a knot in this game." instead;
	if second noun is chain:
		try tying chain to noun instead;
	if noun is sled and second noun is steeds:
		if sled is visible and steeds are visible:
			try tying steeds to sled instead;
	if noun is steeds and second noun is sled:
		if steed-sled is true:
			say "You already did." instead;
		now steed-sled is true;
		now chain is part of the sled;
		say "Now the steeds look up with purpose! Each tilts its head, as if to say, where to go?" instead;
	if noun is sled or noun is steeds or noun is chain:
		say "That doesn't work. Maybe something else will, though." instead;
	if second noun is sled or second noun is steeds or second noun is chain:
		say "That doesn't work. Maybe something else will, though." instead;
	say "You can't see how attaching those two things could work.";

instead of doing something with chain when chain is part of sled:
	if current action is tying:
		continue the action;
	say "The chain is tied to the sled[if steed-sled is true] and steeds. No need to mess with it[else], but maybe you can tie it to something else[end if]."

steed-sled is a truth state that varies.

sled-chain is a truth state that varies.

every turn when steed-sled is true:
	if location of player is not location of steeds:
		say "The steeds, sled in tow, come thundering after you.";
		move steeds to location of player;
		move sled to location of player;
		if player is in u13:
			say "[line break]They go thundering past, in fact, and the sled trailing behind decapitates the onyx! A huge magical flare from the onyx vaporizes ground below and the sled. The steeds, frightened, run off to [if u11 is visited or u15 is visited]the[else]some unseen[end if] zoo, and the sled falls down the hole. After some disturbing howling, one bar from the sled pops back up. You keep it. Maybe it will be useful down there.";
			now player has o-b;
			now onyx is in lalaland;
			now hole is in u13;
			change the down exit of u13 to d13;
			change the up exit of d13 to u13;
			now steeds are zooish;
			now steeds are in lalaland;
			now sled is in lalaland;
			now steed-sled is false;

chapter visions

[after printing the locale description when up-score is 0:
	repeat with rcc running through carried cyclable unshook things:
		if there is a fromf of rcc in table of flippies:
			choose row with fromf of rcc in table of flippies;
			if location of player is adjacent to cr1 entry or location of player is adjacent to cr2 entry:
				say "[The rcc] shake[if rcc is not plural-named]s[end if] a bit.";
				now rcc is shook;
				continue the action;

a thing can be shook or unshook. a thing is usually unshook.]

after printing the locale description when score < 2 and frivolous-points < 2 (this is the psst hint rule):
	if psst is visible:
		say "A voice says 'Psst! Loop.' After a pause, 'OPPOSITE CORNER!'";
	let bothvis be false;
	if player is in u05 and u21 is visited:
		now bothvis is true;
	if player is in u21 and u05 is visited:
		now bothvis is true;
	if bothvis is true:
		say "You've heard that voice before. You wonder what it could be about. It's giving you the run-around, but perhaps it's trying to help.";
	continue the action;

chapter table

to say hulk-to:
	now boxy hulk is in d10;
	
to say have-pyrex:
	now player has pyrex;

to say sapowl:
	say "The sap becomes an owl, which flies off[if u11 is visited or u15 is visited] towards the odd zoo[end if]"

to say zoo-home:
	if u11 is visited or u15 is visited:
		say "the odd zoo";
	else:
		say "some new home";

to say nag-or-ant:
	say "The lye schlurps, grows, and becomes ";
	if player is in u11 or player is in u15: [ant]
		say "an ant, which makes the short journey to the zoo. Others follow behind in short order, and scientific little oafs will enjoy any future ant farm";
	else:
		say "a nag, which potters off to [zoo-home]. [if u11 is visited or u15 is visited]The little oafs will enjoy petting it[else]Hopefully somewhere restful[end if]"

to say an-plur:
	if number of zooish animals in lalaland > 1:
		say "s";

table of flippies [tf]
fromf	tof	b4txt	aftxt	uphash	lohash	cr1	cr2	got-yet	reversible	isrand	aboves	changetext	howsolve
cot	oaf	"cot"	"oaf"	1032	1076	u12	u14	false	false	true	true	"Poof! The cot becomes an oaf, like the others you've seen before."	0
air	--	"air"	"mud"	928	1180	u12	u14	false	false	false	false	"The air the marker floated in becomes mud. Well, things look a bit more normal now.[check-ach of 20]"
lye	nag	"lye"	"nag"	1060	1048	u02	u24	false	false	true	true	"[nag-or-ant]."
lye	ant	"lye"	"ant"	1060	1048	u15	u11	false	false	true	true	"[nag-or-ant]."
tuffet	steeds	"tuffet"	"steeds"	13032917	24036949	u01	u25	false	false	false	true	"The tuffet's trunk extends into legs, and the top bit extends into bodies of two steeds. They nod at you in appreciation for restoring them[if number of zooish animals in lalaland > 0], and they don't go running like the other animal[an-plur] you rescued[else], so maybe they're willing to do a favor in return[end if][if sled is visible], then look at the sled[end if]."
ferns	banjo	"ferns"	"banjo"	922988	502776	u04	u22	false	false	false	true	"There are so many ferns here, what are a few less? The ferns sprout to become a banjo, which you take."
river	arena	"river"	"arena"	777089	648649	u09	u17	false	false	false	true	"The arena crumbles, revealing a river in the process."
pecan	tiger	"pecan"	"tiger"	747993	677771	u04	u22	false	false	true	true	"The pecan bursts out to become a tiger that roars at you! It shakes its head, not ready for a chase. Perhaps you can outrun it while it's still groggy.[tigfo]"
ingot	chain	"ingot"	"chain"	579526	846238	u06	u20	false	false	true	true	"The ingot expands to become a chain, which is surprisingly lightweight, so you take it."
dolls	wheel	"dolls"	"wheel"	674222	751542	u07	u19	false	false	true	true	"The dolls become a more useful wheel."
drum	colt	"drum"	"colt"	28194	26642	d07	d07	false	false	true	false	"The drum's outside sinews reform into a colt[if drum is played], whose muscle memory causes it to look fearfully at you[end if]."
hats	sled	"hats"	"sled"	31446	23390	u11	u15	false	false	true	true	"The hats change into a sled[if player has hats], which you can't carry, but you can push[end if]."
shard	doves	"shard"	"doves"	744964	680800	d23	d23	false	false	true	false	"The shard re-forms into doves, which fly away to a safe home."
wet sap	owl	"sap"	"owl"		934	1174	u22	u04	false	false	true	true	"[sapowl]."
wet sap	owl	"sap"	"owl"		934	1174	u18	u08	false	false	true	true	"[sapowl]."
bee	--	"bee"	"ill"	784	1324	u07	u19	false	false	false	true	"The bee swoops randomly in the air, then flies away for somewhere to lie down. It can't make it to a zoo, but there's enough forestry[hulk-to].[check-ach of 21]"
bee	--	"bee"	"ebb"	784	1324	d07	d07	false	false	false	true	"The bee grows visibly weaker and less mad. It fizzes off, embarrassed and quieter.[check-ach of 21]"
bee	--	"bee"	"loo"	784	1324	u16	u10	false	false	false	true	"The takes evasive action as it realizes something is wrong. It flies up, up, up and then, as it turns into--well, something--that crashes to the ground, you find yourself very glad the bee hadn't had anything to eat recently. We will not speak of it hence.[paragraph break]At the prospect of a Poo Fee for your unsanitary magicking, you figure that if the bee could be changed into--that--it was probably pretty, well, filthy deep down. Perhaps you could've let the bee off easier with a finesse, but hey, you didn't ASK it to attack you.[hulk-to]"
bee	--	"bee"	"gee"	784	1324	u05	u21	false	false	false	false	"The bee's bzz bzz bzz becomes a much less intimidating gee, gee, gee! It suddenly realizes so much it's missed out on, guarding its own hive. It goes off in search of new discoveries to make it say gee.[hulk-to][check-ach of 22]"
bee	--	"bee"	"egg"	784	1324	d07	d07	false	false	false	false	"The bee's bzz bzz bzz becomes the cracking of an egg! It suddenly realizes so much it's missed out on, guarding its own hive. It goes off in search of someone to make a family with.[hulk-to][check-ach of 22]"
bee	--	"bee"	"moo"	784	1324	d15	d15	false	false	false	false	"The bee's bzz bzz bzz becomes the mooing of a cow! This won't scare anyone, and it won't let the bee sneak up on anyone. So the bee goes...out to pasture.[hulk-to][check-ach of 22]"
sky	gym	"sky"	"gym"	1177	931	u07	u19	false	false	false	true	"A gym falls from the sky!"
ovals	hotel	"ovals"	"hotel"	607001	818763	u07	u19	false	false	true	true	"The ovals pop and turn into a hotel. A Pyrex cup clatters out, and you think 'got cup' and pick it up[have-pyrex]."
grid	pens	"grid"	"pens"	25790	29046	d23	d23	false	false	true	false	"The grid warps, with one set of hatches becoming a couple pen covers, and the other becoming the ink tubes that go in. You now have two pens."
thug	serf	"thug"	"serf"	27782	27054	d13	d13	false	false	false	false	"The thug grows weaker, but kinder and more honest-looking, and ashamed of what he has been. He scoots away."
punk	tyro	"punk"	"tyro"	22304	32532	u04	u22	false	false	false	false	"The punk, already tired from his running, collapses. He looks depressingly ordinary, now. He runs away."
snare	diver	"snare"	"diver"	850421	575343	d23	d23	false	false	true	false	"A diver pops out from the snare. And not just any diver! An oaf diver!"
tape	x-it	"tape"	"exit"	23594	31242	d21	d21	false	false	true	false	"The tape expands to become an exit, which blends into the scenery."
hose	hawk	"hose"	"hawk"	23320	31516	d16	d16	false	false	true	false	"The hawk flies off with a nod of gratitude as you release it."
hose	pies	"hose"	"pies"	23320	31516	d24	d24	false	false	false	false	"Two steaming hot pies appear!"
pies	hawk	"pies"	"hawk"	31516	23320	u08	u18	false	false	false	false	"You change the pies to a hawk, which looks none the worse for the wear for having been edible. Perhaps it will be less of a carnivore, now that it has been edible, itself.[check-ach of 12]"
o-b	den	"bar"	"den"	1369	739	d06	d19	false	false	false	false	"The one bar rearranges itself to make a neat den. You're not exactly sure what can go there, but it'll be handy."
keg	ice	"keg"	"ice"	1245	863	u24	u02	false	false	true	false	"The keg turns into ice."
Pyrex	clerk	"pyrex"	"clerk"	635189	790575	u13	u13	false	false	false	true	"The Pyrex turns into a clerk with a hotel for the nametag. Now you'll actually want to stay in the hotel! There'll be something there!"
dune	ribs	"dune"	"ribs"	30032	24804	u12	u14	false	false	false	true	"The dune becomes some much more portable ribs."
bikes	--	"bikes"	"pigmy"	604466	821298	d18	d18	false	false	false	false	"The bikes become a pigmy, with [if wheel is not part of bikes]a missing arm. It (you can't tell the sex) grumbles and limps away, cursing you, the oafs and, well, nearly everything.[else]all limbs intact. It (you can't tell the sex) grabs the arm your wheel fit into, then (you can't tell the sex) shakes your hand. 'Oafs?' You nod. He salutes and bounces away. That was a high-ranking officer, and you have paved the way for peace between the oafs and their neighboring pigmys![check-ach of 23][end if]"
rift	ford	"rift"	"ford"	30137	24699	d24	d24	false	false	false	false	"The rift becomes shallower, and water starts sloshing through it.[if diver is visible][line break][dive-ford][end if]"
gin	kid	"gin"	"kid"	762	1346	d18	d18	false	false	false	false	"The gin bottle shatters in your hand, and--poof--an oaf kid appears! It isn't old enough to have any markings. You pat it on its head, tell it where its parent is, and it goes running past the wrath pulse to the hotel.[check-ach of 27]"
tickets	ape	"tix"	"ape"	1097	1011	u07	u19	false	false	true	false	"Poof! The tickets become a surly ape."
ape	--	"ape"	"pal"	1097	1011	d17	d17	false	false	false	false	"Suddenly, unexpectedly, the ape claps you on the back! Then he gives you a thumbs-up. You direct him to the zoo."
ape	--	"ape"	"pet"	1011	1097	u15	u11	false	false	true	false	"Suddenly, unexpectedly, the ape claps you on the back! Then he gives you a thumbs-up. You direct him to the zoo.[check-ach of 30]"
totem	dodo1	"juju"	"dodo"	25726	28434	u06	u20	false	false	true	false	"An egg pops out from Papa Juju, then rolls nd cracks open. A miniature dodo sprouts from it and flies away home. [dodo-check]"
totem	dodo2	"papa"	"dodo"	25726	28434	u12	u14	false	false	true	false	"An egg pops out from Papa Juju, then rolls nd cracks open. A miniature dodo sprouts from it and flies away home. [dodo-check]"
hay	pig	"hay"	"pig"	1214	894	u08	u18	false	false	true	false	"A pig pops up from the hay and oinks off to comfier pastures. [all-for-hay]"
hay	bus	"hay"	"bus"	1214	894	u06	u20	false	false	true	false	"A cute little mini-bus that is still big enough to fit several oafs chugs on up from the hay pile, then off to some hidden transit station. [all-for-hay]"
[tf]

the bus is a thing. "This should be in the oafs['] secret public transport bunker."

dodo2 is an animal. printed name of dodo2 is "dodo". description is "This animal should be in the zoo."

dodo1 is an animal. printed name of dodo1 is "dodo". description is "This animal should be in the zoo."

to say dodo-check:
	if dodo2 is in lalaland or dodo1 is in lalaland:
		say "Yup! That did it! You created two dodos, and now the species has a shot at un-extinction![check-ach of 33]";
		now totem is in lalaland;
	else:
		say "You released one dodo, but the species will be extinct unless you can release another one! What to do? Where to go?";
	
to say all-for-hay:
	if pig is in lalaland or bus is in lalaland:
		say "Well, that's the last of the hay.[check-ach of 31]";
	else:
		say "[paragraph break]";

the block giving rule is not listed in any rulebook.

check giving:
	if noun is banjo and second noun is punk:
		say "The punk sneers a bit at you, then takes the banjo and smashes it. He looks happy and exhausted after doing this, and fist-pumps with a gaga 'Oi! Oi!' before running off.[check-ach of 26]" instead;
	if second noun is punk or second noun is thug:
		say "The [second noun] looks at you funny and shrugs. You confused them for a bit, but they don't want what you offered." instead;
	if noun is oaf or noun is diver:
		say "The oaf shakes his head at the thought of YOU giving THEM a gift." instead;
	if second noun is wrath pulse or second noun is slab:
		say "Sacrifice isn't the way, here." instead;
	if noun is not a person:
		say "Generally, it's best to bribe animate things." instead;
	say "You don't see what good giving that away would do." instead;

to say dive-ford:
	d "Treasure check.";
	now ford is in location of player;
	treasure-check;

the bikes are a plural-named thing. understand "bike" as bikes. "Two rather small bikes lie here. You might have to lug them around a bit, but they can be carried.". description of bikes is "[if wheel is not part of the bikes]One is missing a front tire. Maybe you could find a decent substitute[else]The bikes both look serviceable, now you repaired one[end if]."

the dune is a tangential. up-room of dune is u12. down-room of dune is u14. "A sandy dune is here. It seems out of place for the climate.". description of dune is "It's not impossible to climb, but it doesn't look like there's anything up there. Maybe it can become something else."

the block climbing rule is not listed in any rulebook.

check climbing:
	if noun is dune:
		say "The dune is fun to climb, but pointless, and a bit exhausting." instead;
	if noun is hole:
		try going down instead;
	if player is in d13:
		say "(going up)[line break]";
		try going up instead;

rule for supplying a missing second noun when climbing: now second noun is sky.
Rule for clarifying the parser's choice of sky when climbing: do nothing.

check climbing:
	if player is in u13:
		try going down instead;
	if player is in d13:
		try going up instead;
	say "You don't need to climb anything, really.";

o-b is a thing. the printed name of o-b is "one bar". understand "one/bar" and "one bar" as o-b. description of o-b is "It looks metallic, like steel or something. Maybe it can be used to build another home somewhere."

the den is scenery. "It will make a decent home for someone or something."

the hose is a thing. "A flexible hose lies here.". description of hose is "The hose appears unusually flexible, though you can't think of any reason to twist it."

the pies are a plural-named takeonflip thing. understand "pie" as pies. description is "Very tasty, but they also smell meaty, and you wonder what animal that was."

the hawk is a zooish animal. description is "You shouldn't see the hawk. It should be in the zoo."

the tape is a thing. "Some tape--the sticky kind, not the recording--is lying around here.". description is "[if player has tape]It's sort of stuck to your hand. Surely it can be used for something better[else]It's not doing anything now, but maybe it has a better use somewhere[end if]."

the x-it is privately-named scenery. "You can EXIT through it and disappoint the oafs severely, if you choose."

before exiting when player has tape:
	if location of player is not d25:
		continue the action;
	say "Foom! The tape becomes an exit. It's up to you whether you want to leave or not, I guess.[check-ach of 30]";
	now tape is in lalaland;
	now x-it is in d25 instead;

the printed name of x-it is "exit". understand "exit" as x-it.

check exiting when x-it is visible:
	say "The heck with these oafs. What did they ever do for you? You ditch the joint.[check-ach of 11]";
	end the story instead;

the diver is a person. "The oaf diver you rescued manages to bounce around here despite its heavy gear.". description is "The oaf diver wears gear that will help it look around in water or something. Maybe you can lead it to some[if ford-dive is true or river-dive is true] more[end if]"

the diver wears the heavy gear. description of gear is "No weirder than the oafs['] fur patterns."

understand "oaf" as diver.

does the player mean doing something with the oaf: it is likely.

the miniature metallic grid is a thing in d10. "A miniature metallic grid lies here.". description is "It's not a huge grid, more like a grid for a screen or something[if player has grid]. You remember the wiry mark it left as you took it, as if it needed to be grasped for an important task[end if]."

after taking the metallic grid:
	say "The grid leaves a wiry mark after you pick it up.";
	the rule succeeds;

the ovals are a plural-named thing. "Ovals lie here. They don't look totally worthless.". description is "They are blank, yet not worth separating."

the hotel is scenery. "It is HOTEL UBGRY. It's not a very big hotel, since it's made for oafs, but it's big enough."

the block drinking rule is not listed in any rulebook.

check drinking:
	if noun is keg:
		say "You aren't depressed enough for that." instead;
	if noun is gin:
		say "That'd be like stealing from the clerk. And oh so hypocritical!" instead;
	if noun is river or noun is ford:
		say "It might be contaminated." instead;
	say "That doesn't seem drinkable. I could be wrong, though." instead;

the bottle of gin is a thing. description is "You can't see what's inside, but it would be nice to banish the evil drink--somehow--from Green Terra."

the kid is a person. description is "This kid doesn't have markings yet. It's not a full-grown oaf."

check opening the bottle of gin:
	say "You don't want to tempt yourself." instead;

check entering the hotel:
	if gin is off-stage:
		say "You check in. The oaf clerk is there. It laments the loss of its youngun--while drinking on the job in the process! Oh, no! You take the bottle of gin away from it, saying it will be okay, and you won't tattle.";
		now player has bottle of gin instead;
	if kid is in lalaland:
		say "There's time for happy reunions later." instead;
	say "You'd disappoint the clerk." instead;

the sky is a backdrop. "You look up at the sky, wondering if you can make anything fall out of it."

The gym is scenery. "[if gym-enter is true]You've no desire to go back[else]You've been neglecting the physical side through all this mental wordplay. Surely it wouldn't take too long to buff up[end if]."

gym-enter is a truth state that varies.

check entering the gym:
	if gym-enter is false:
		say "You feel stronger after entering the gym.";
		now gym-enter is true instead;
	else:
		say "You already had a good workout." instead;

book dumb verbs and places

chapter dumb places

lalaland is a bzzt room. [lalaland is my room to put people who are done with.]

the bullpen is a bzzt room. [the bullpen is a place to put concepts that you need to hint, but you don't ever want to be in play. Or for things that need to be off-stage but you aren't done with. I suppose I could define a person or thing as done-with or done-for-now, but the locations seem more visually relevant.]

the sea guy is a person in the bullpen.

the undug elves are plural-named people in the bullpen.

chapter playing

playing is an action applying to one thing.

understand the command "play" as something new.

understand "play [something]" as playing.

songplay is a truth state that varies.

carry out playing:
	if noun is not banjo and noun is not drum:
		say "You can't play that." instead;
	if noun is dolls:
		say "You silently play with the dolls, too embarrassed to speak aloud. But really, you probably only have time to play with one." instead;
	if player has banjo and player has drum:
		if songplay is true:
			say "You already played a song." instead;
		if river is visible or arena is visible:
			say "You play a banjo/drum duet with your feet doing the percussion bit. It's particularly[if river is visible]soulful[else]pop-oriented[end if]. Hooray for achievements!";
			now songplay is true instead;
		say "This isn't the right place." instead;
	say "[if noun is drum]Boom boom boom. A bit boring by its lonesome[else]Twang twang twang. A bit boring by its lonesome[end if].";
	now noun is played;
	the rule succeeds.

chapter wheeing

wheeing is an action out of world.

understand the command "whee" as something new.

understand "whee" as wheeing.

carry out wheeing:
	if player does not have dolls:
		say "[err-rej]" instead;
	if player is not in u07 and player is not in u19:
		say "This doesn't quite feel like the place to have fun with a doll.";
	choose row with myidx of 29 in table of accomp;
	if did-accomp entry is true:
		say "They aren't so fun any more.";
	else:
		say "You have more fun than you expected! Hero(ine)s need a bit of down time, too.[check-ach of 29]";
	the rule succeeds;

chapter arking

the ribs are plural-named, takeonflip and cyclable. "Some ribs, from some unidentifiable animal, lie here.". description of ribs is "You're not sure what animal they're from."

the oxen are a zooish animal.

description is "They look like they could be the skeleton of an animal or a thing."

arking is an action out of world.

understand the command "ark" as something new.

understand "ark" as arking.

the ark is scenery. "It's at least as big as the zoo to the [if player is in u17]northwest and northeast[else]southeast and southwest[end if]."

check entering ark:
	say "There's no risk of a flood, or anything." instead;

carry out arking:
	if player does not have ribs:
		say "[err-rej]" instead;
	if ark is in u17:
		say "You already made the ark." instead;
	if player is not in u17 and player is not in u09:
		say "That's not the right place to put an ark." instead;
	say "The ribs become the hull of a giant ark, and it fills itself in.[check-ach of 19]";
	now ark is in location of player;
	the rule succeeds;

chapter dumb stuff

instead of swearing obscenely:
	say "Swears aren't very magic.";

instead of swearing mildly:
	say "Swears aren't very magic.";

book when play begins

frivolous-points is a number that varies.

max-up-score is a number that varies. max-up-score is usually 23.
max-down-score is a number that varies. max-down-score is usually 15.

to first-status: (- DrawStatusLine(); -);

did-you-cheat is a truth state that varies.

to read-oafy:
	let you-cheated be 0;
	let q be 1;
	let myrow be 0;
	let special-treat-1 be false;
	let special-treat-2 be false;
	if file of oafdone exists:
		if ready to read file of oafdone:
			read file of oafdone into table of accomp;
			repeat through table of accomp:
				increment myrow;
				now q is q * 613;
				if q > 1111:
					now q is the remainder after dividing q by 1111;
				d "[myrow] [did-accomp entry] [dumhash entry] vs [q].";
				if did-accomp entry is true:
					if q is not dumhash entry and myrow is not 18:
						increment you-cheated;
						d "Row [myrow] is [dumhash entry], should be [q].";
						now did-accomp entry is false;
					else:
						if myrow is 6:
							now special-treat-1 is true;
						if myrow is 27:
							now special-treat-2 is true;
						increment frivolous-points;
			if myrow is not 37:
				say "Uh oh! Ugly Oafs data file is not the right size. You may have an old version. You can play, but to help with the best ending, look for uoa or uoa.glkdata and erase it.";
				wait for any key;
		else:
			say "Sorry, couldn't read the Ugly Oafs data file.";
	if you-cheated > 0:
		now did-you-cheat is true;
		say "A high-pitched voice whines 'Cheaterer! You hackeded the accomplishment table entrieses[if you-cheated > 1] multiple timeses[end if]!'";
		say "[wfak]";
	else:
		if special-treat-1 is true and special-treat-2 is true:
			say "The oafs dance around you. 'We is happy to have you back! You has made Green Terra even betterer! You cared enough to have returnded!' You show a way to deal with any dangerous frag-gulf that might reappear where the wrath pulse was--the answer came in your sleep. They offer you a toast of waxy milk, fresh from near the prune trove. It's surprisingly awesome and delicious.";
			ital-say "This achievement will be deleted, so you can play the game straight-up if you want.";
			choose row 6 in table of accomp;
			now did-accomp entry is false;
			now dumhash entry is 0;
			end the game in victory;
		

report restoring the game (this is the check for cheats when restoring rule):
	read-oafy;
	continue the action;

when play begins (this is the randomize weird drops rule):
[	repeat through table of flippies:
		if aboves entry is true:
			increment max-up-score;
		else:
			increment max-down-score;]
	read-oafy;
	now right hand status line is "[score] + [frivolous-points]";
	now left hand status line is "[location of player] ([if location of player is uppy]above [else]under[end if]ground)";
	first-status;
	say "Well, that was stupid. You'd never been to a D&D session, despite being accused of that in middle school. You got on the wrong side of the Dungeon Master, early. 'I have built a fantasy world!' he yelled, 'It's all so real!' He went on to babbling about dwarf/elf sociology and goblin taxonomies and worse. If you were too lazy to research things, and there's a whole INTERNET for that, you don't deserve to participate. As you exit, he takes a cheap shot about not dealing with ugly oafs. How does he live with himself, you wonder?[paragraph break][wfak-d]You're interrupted by high-pitched voices: 'We is ugly oafs too! From Green Terra!' You don't need any stupid jokes now, and when you whirl around and see them, they're certainly not pretty. Some are striped, some plaid, others polka-dotted. 'Ugly, ugly! Oafs, oafs!' they chant. 'It sees us! It hears us! It is shifty! We needs its help! With simple wordses! Come to the pent crag!'[paragraph break]No, nobody slipped anything in that can of root beer. They couldn't have. You opened it yourself. Nevertheless, you have nothing better to do. The library is closed. 'You must follows us!' And you do, through a cornfield that shouldn't be in this suburb, to wherever Green Terra might be.[paragraph break][wfak-d]'He...and IT...will deport us to Yorpwald and Elvira! And turn us into a sofa!'[wfak-d]As you jump, you ask who HE is. But the oafs chatter about running beyond the golem murks, and about a friend who is in disguise who will help you. Some go northwest-ish, others southeast-ish.";
	say "[wfak-d]";
	let thisrm be u01;
	let count be 0;
	repeat through table of listens:
		now rm entry is listeny;
	now d10 is dumped;
	repeat through table of flippies:
		if fromf entry is not fixed-off:
			now fromf entry is cyclable;
		if there is a tof entry:
			now tof entry is cyclable;
		if isrand entry is true and fromf entry is tangential:
			d "Uh oh, tangential entry [fromf entry] is listed as random.";
		if isrand entry is true and fromf entry is off-stage:
			if fromf entry is fixed-off:
				say "[fromf entry] fixed off.";
			else:
				now count is 0;
				while fromf entry is unshuffled and count < 20:
					increment count;
					if aboves entry is true:
						now thisrm is a random uppy not dumped room;
					else:
						now thisrm is a random downy not dumped room;
				if count is 20:
					d "Not able to separate items.";
				now fromf entry is in thisrm;
				now thisrm is dumped;
				d "[fromf entry] to [thisrm]. [number of uppy not dumped rooms] up left, [number of downy not dumped rooms] down left.";
				if there is no got-yet entry:
					now got-yet entry is false;
		else:
			d "[fromf entry] is in [location of fromf entry].";
	move sky backdrop to all uppy rooms;

the file of oafdone is called "uoa"

to decide whether (cy - a thing) is unshuffled:
	if cy is not cyclable, decide yes;
	if cy is off-stage, decide yes;
	choose row with fromf of cy in table of flippies;
	if there is a cr1 entry and location of cy is cr1 entry, decide yes;
	if there is a cr2 entry and location of cy is cr2 entry, decide yes;
	decide no;

when play begins (this is the initialize shiftability rule):
	repeat through table of shiftval:
		now shiftability of r1 entry is sv entry;
		now shiftability of r2 entry is sv entry;

table of shiftval
r1	r2	sv
u01	d01	1
u02	d02	2
u03	d03	3
u04	d04	4
u05	d05	5
u06	d06	6
u07	d07	7
u08	d08	8
u09	d09	9
u10	d10	10
u11	d11	11
u12	d12	12
u13	d13	13
u14	d14	14
u15	d15	15
u16	d16	16
u17	d17	17
u18	d18	18
u19	d19	19
u20	d20	20
u21	d21	21
u22	d22	22
u23	d23	23
u24	d24	24
u25	d25	25

volume errorlist

understand the command "yes" as something new.
understand the command "no" as something new.

to say lo-ha:
	say "The hats remain motionless. Perhaps they need to become something that can MAKE a long haul"

to say no-mark:
	say "You might not want to change the markers, since--well, markers are generally there to aid travelers"

to say whoas:
	say "Whoah! He doesn't need changing";

to say knowwho:
	say ". If you knew who he was, you'd know that"

to say swurly:
	say "The vortex of sludge keeps swirling. Maybe it would be easier to deal with the rift."

to say croody:
	say "You wouldn't need or want to destroy the crude, er, crood sheet with the tip on it."

to say not-as-cool:
	say "He's not as cool as the middle guy, but he still doesn't need changing. Maybe he can provide a hint."

table of nudges [ton]
textchg	hashval	hashrev	myloc	thingvis	posrule	tosay
"tip"	1115	993	--	crood sheet	--	"[croody]."
"sheet"	747320	678444	--	crood sheet	--	"[croody]."
"sheet"	747320	678444	--	crood sheet	--	"[croody]."
"anna"	27405	27405	--	anna	--	"Anna keeps chanting 'Anna...Anna.'"
"bob"	1041	1041	--	bob	--	"Bob keeps chanting 'Bob...Bob.'"
"box"	1063	1045	--	rev box	--	"Man! The box is too handy to change to something else."
"stye"	19123	35713	--	hint stye	--	"No way! Even if you don't use the stye for reference, it's kind of neat."
"fry"	1034	1074	--	fry gun	--	"You can't really change the fry gun. You can just SHOOT something with it."
"steed"	501266	924498	--	steeds	--	"You don't need to do anything with either steed. They're not attacking you. They're probably helpful."
"left"	31651	23185	--	cool dudes	--	"[whoas]."
"right"	784605	641159	--	cool dudes	--	"[whoas]."
"perry"	740308	685456	--	cool dudes	--	"So you know the middle guy's name. But now you do, you know he's too cool to need change. Maybe he is there to help, instead."
"davy"	34316	20520	--	cool dudes	--	"[not-as-cool]"
"andy"	27169	27667	--	cool dudes	--	"[not-as-cool]"
"middle"	22721055	14348837	--	cool dudes	--	"[whoas][knowwho]."
"center"	13475478	23594414	--	cool dudes	--	"[whoas][knowwho]."
"vortex"	21442307	15627585	--	vortex	--	"[swurly]."
"sludge"	21082139	15987753	--	vortex	--	"[swurly]."
"bottle"	18626118	18443774	--	gin	--	"It is not the bottle but the evil substance inside."
"oaf"	1032	1076	--	diver	--	"You don't need to change the diver oaf."
"oafs"	26837	27999	--	--	always-true rule	"You can't change who, or what, the oafs are. They're okay as-is."
"metal"	796744	629020	--	ingot	--	"You squint at the ingot, but you can't tell what metal it is, or how to change that. But it's still an ingot."
"lump"	24393	30443	--	lye	--	"In Yorpwald, you could change the lump to a plum. But this is Green Terra. Maybe you should consider its lye-ness."
"ground"	17533644	19536248	--	ground	--	"You don't want the ground lurching, now."
"sandy"	630351	795413	--	dune	--	"Dunes can't really be anything other than sandy."
"cool"	26712	28124	--	dudes	--	"[too-cool]."
"dudes"	774088	634100	--	dudes	--	"[too-cool]."
"dude"	29772	24388	--	dudes	--	"[too-cool]."
"guy"	1085	1023	--	dudes	--	"[too-cool]."
"guys"	28223	26613	--	dudes	--	"[too-cool]."
"safe"	24037	30799	--	safe	--	"[no-safe]."
"cup"	1184	924	--	pyrex	--	"The cup doesn't change. It's still Pyrex, too, which is pretty sturdy."
"knob"	20428	34408	--	safe	--	"[no-safe]."
"heavy"	892728	533036	--	diver	--	"You can't make the diver's gear any less heavy. Fortunately, it doesn't seem to mind."
"huge"	27740	27096	--	rift	--	"The rift gapes back. There's no way to make it smaller."
"small"	832696	593068	--	ford	--	"The ford remains impassive."
"small"	832696	593068	--	hats	--	"The hats remain small."
"long"	20380	34456	--	hats	--	"[lo-ha]."
"haul"	31465	23371	--	hats	--	"[lo-ha]."
"gear"	35034	19802	--	diver	--	"The diver's gear was expensive. You probably shouldn't change it."
"knee"	20847	33989	--	--	always-true rule	"You shouldn't mess with your knees. You're not a doctor."
"knees"	542031	883733	--	--	always-true rule	"You shouldn't mess with your knees. You're not a doctor."
"oval"	23346	31490	--	ovals	--	"You can't figure what to do with just one oval."
"mesh"	30624	24212	--	goal	--	"That won't add to the goal[if mesh is visible], and you don't need to, anyway[end if]."
"bike"	23248	31588	--	bikes	--	"Nothing doing. You can't make just one bike, well, busy[if wheel is not part of the bikes]. Perhaps there's another way to fixes the bikes[else]. Anyway, you fixed the bikes[end if]."
"gross"	674323	751441	--	wet sap	--	"You can't change the sap's grossness."
"why"	991	1117	--	pen	--	"The pen can't seem to write anything."
"green"	685446	740318	--	--	always-true rule	"Changing Green Terra won't be THAT easy."
"pie"	1212	896	--	pies	--	"[if hawed is true]There's nothing else to do with the pie. Well, there's something profane, but this isn't that sort of game[else]Maybe you can do something with just one pie, but it's not necessary unless you're a completist[end if]."
"pulse"	578100	847664	d13	--	--	"You can't change the wrath pulse."
"guys"	28223	26613	--	prune trove	--	"The cool guys DEFINITELY don't need to be changed. And if they did, they'd do so themselves."
"slab"	31340	23496	d13	--	--	"You can't change the talk slab."
"shit"	28836	26000	--	--	always-true rule	"[shift-swear]."
"evil"	29882	24954	d24	--	--	"You can't just change EVIL like that."
"hive"	19342	35494	--	bane hive	--	"If you think you can handle it, attack the bane hive instead."
"post"	35261	19575	--	goal	--	"[if-post]."
"posts"	916790	508974	--	goal	--	"[if-post]."
"marker"	18858872	18211020	--	marker	--	"[no-mark]."
"sign"	29480	25356	--	marker	--	"[no-mark]."
"post"	35261	19575	--	marker	--	"[no-mark]."
"obelisk"	483459805	480357415	--	obelisk	--	"The obelisk remains cold, stark. You remember the oafs saying nothing would be THIS tough."
"cold"	26626	28210	--	cold frog	--	"The frog is happy as-is. It ignores your attempts to imitate it with silly noises."
"psst"	20389	34447	--	psst	--	"You try to speak back, but there is no answer."
"onyx"	35448	19388	--	onyx	--	"The onyx cannot be changed."
"hole"	23138	31698	--	hole	--	"[no-turn]."
"shaft"	744642	681122	d13	--	--	"[no-turn]."
"damn"	34071	20765	--	--	always-true rule	"[shift-swear]."
"fuck"	29022	25814	--	--	always-true rule	"[shift-swear]."
"xyzzy"	494236	931528	--	--	always-true rule	"[shift-xyzzy]."
"plugh"	865767	559997	--	--	always-true rule	"[shift-plugh]."
"plover"	22853951	14215941	--	--	always-true rule	"[shift-plugh]."
"frotz"	692635	733129	--	--	always-true rule	"[shift-plugh]."
"foggy"	634160 	791604	--	--	in-border rule	"You don't need to do anything with the foggy barrier."
"barrier"	625904465 	337912755	--	--	in-border rule	"You don't need to do anything with the foggy barrier."
"idol"	32634	22202	--	idol	--	"The idol doesn't need to be changed."
"stab"	19172	35664	--	stab bats	--	"You can't change the bats themselves."
"slap"	31354	23482	--	stab bats	--	"You try, but one of the stab bats still manages to bite."
"bites"	610550	815214	--	stab bats	--	"Focus on one bite at a time."
"end"	962	1146	u01	--	--	"[mark-shake]."
"end"	962	1146	u25	--	--	"[mark-shake]."
"free"	27066	27770	u03	--	--	"[mark-shake]."
"free"	27066	27770	u23	--	--	"[mark-shake]."
"dan"	1311	797	u04	--	--	"[mark-shake]."
"dan"	1311	797	u22	--	--	"[mark-shake]."
"rob"	1311	797	u10	--	--	"[mark-shake]."
"rob"	1311	797	u16	--	--	"[mark-shake]."
"pass"	25796	29040	u07	--	--	"[mark-shake]."
"pass"	25796	29040	u19	--	--	"[mark-shake]."
"log"	802	1306	u08	--	--	"[mark-shake]."
"log"	802	1306	u08	--	--	"[mark-shake]."
"scry"	25695	29141	u09	--	--	"[mark-shake]."
"scry"	25695	29141	u17	--	--	"[mark-shake]."
"hide"	19550	35286	u11	--	--	"[mark-shake]."
"hide"	19550	35286	u15	--	--	"[mark-shake]."
"babe"	35182	18978	u12	--	--	"[mark-shake]."
"babe"	35182	18978	u14	--	--	"[mark-shake]."
"pent"	29047	25789	u13	--	--	"[mark-shake]."
"pony"	35812	19024	d04	--	--	"[mark-shake]."
"info"	22263	32573	d03	--	--	"[mark-shake]."
"anna"	27405	27405	d02	--	--	"[mark-shake]."
"old"	1316	792	d01	--	--	"[mark-shake]."
"foe"	962	1146	d10	--	--	"[mark-shake]."
"end"	962	1146	d09	--	--	"[mark-shake]."
"yoyo"	29111	25049	d08	--	--	"[mark-shake]."
"say"	917	1191	d06	--	--	"[mark-shake]."
"big"	890	1218	d14	--	--	"[mark-shake]."
"row"	1306	802	d12	--	--	"[mark-shake]."
"hey"	1318	790	d20	--	--	"[mark-shake]."
"real"	27321	27515	d20	--	--	"[mark-shake]."
"whew"	25923	28887	d17	--	--	"[mark-shake]."
"ooh"	722	710	d16	--	--	"[mark-shake]."
"all"	1000	1108	d16	--	--	"[mark-shake]."
"lies"	34328	20508	d24	--	--	"[mark-shake]."
"rank"	24954	29882	d23	--	--	"[mark-shake]."
"fun"	1101	1007	d22	--	--	"[mark-shake]."
"mine"	33195	21641	--	prune trove	--	"The prune trove rumbles. Something is under there."
"totem"	844656	563532	--	totem	--	"The totem has an essence. Work with that."
"soap"	33382	21454	--	soap	--	"Soap is never bad! But find something to do with the soap."
[ton]

to say if-post:
	say "[if mesh is off-stage]The posts aren't posts like the markers you've seen. They're some sort of goal[else]The enhanced goal doesn't need any tinkering[end if]"

to say shift-plugh:
	say "Nothing. The wrong sort of magic";

to say mark-shake:
	say "The marker shakes very slightly. You can't hope to change it, but maybe it'll help you figure what to do"

to say too-cool:
	say "Whoah. Bad idea. Seriously, you'd be lucky if those cool dudes deigned to change YOU"

to say no-safe:
	if player has fry gun:
		say "You have the fry gun! You don't need to mess with the safe";
	else:
		say "The safe repels your efforts. You probably need to figure the combination";
this is the in-border rule:
	if the room south of location of player is nowhere:
		the rule succeeds;
	if the room north of location of player is nowhere:
		the rule succeeds;
	the rule fails;

to say no-turn:
	say "You don't want to close off the passage between above- and below-ground, even if it might help temporarily"

this is the in-d13 rule:
	if player is in d13:
		the rule succeeds;
	the rule fails;

this is the frogroom rule:
	if player is in u03 or player is in u23:
		the rule succeeds;
	the rule fails;

to say shift-xyzzy:
	if the player's command matches the regular expression "^<a-g>":
		say "You whistle a tune, wondering if it is in the right key.";
	else:
		say "You try to do stuff with the usual magic word, but you get nowhere";

to say shift-swear:
	say "No matter how shifty you get with swears, it's still swearing";

section fill-in-rev - not for release

to decide what number is revval of (i - a number):
	if i <= 52:
		decide on 80 - i;
	if i <= 1378:
		decide on 2108 - i;
	if i <= 35854:
		decide on 54836 - i;
	if i <= 932230:
		decide on 1325764 - i;
	decide on 0;

when play begins:
	now u13 is visited;
	d "FLIPPIES:";
	repeat through table of flippies:
		unless there is an uphash entry and uphash entry is fhash of b4txt entry:
			d "[b4txt entry]/[aftxt entry] uphash should be [fhash of b4txt entry][if there is an uphash entry] and not [uphash entry][end if].";
		unless there is an lohash entry and lohash entry is rhash of b4txt entry:
			d "[b4txt entry] lohash should be [rhash of b4txt entry][if there is an lohash entry] and not [lohash entry][end if].";
	d "NUDGES:";
	repeat through table of nudges:
		unless there is a hashval entry and hashval entry is fhash of textchg entry:
			d "HASHVAL: [textchg entry] should be [fhash of textchg entry][if there is a hashval entry] and not [hashval entry][end if].";
		unless there is a hashrev entry and hashrev entry is rhash of textchg entry:
			d "HASHREV: [textchg entry] should be [rhash of textchg entry][if there is a hashrev entry] and not [hashrev entry][end if].";

chapter error specifics

up-score is a number that varies. max-up-score is a number that varies.

down-score is a number that varies. max-down-score is a number that varies.

to inc-score:
	increment the score;
	if location of player is uppy:
		increment up-score;
		if up-score is 2:
			say "Man! This is tough. You could use something to give a tip. Maybe if you asked the right way, you could [bold type]get[roman type] a tip.";
	else:
		increment down-score;
		if rev box is off-stage:
			say "From nowhere, you see a small box roll and land at your feet. It's labeled REV BOX, as if it might help you review things[if player has stye]. Maybe it'll be as handy as the stye[end if].";
			now rev box is in location of player;

Rule for printing a parser error when the latest parser error is the only understood as far as error:
	if number of words in the player's command is 2:
		say "You only need the one word ([word number 1 in the player's command]) with that command.";
		the rule succeeds;
	say "That command had too many words. You can cut it down and re-try.";
	the rule succeeds;

rule for printing a parser error when the latest parser error is the not a verb I recognise error:
	let jz be nothing;
	repeat through the table of flippies:
		if word number 1 in the player's command is aftxt entry:
			if fromf entry is visible:
				if location of player is cr1 entry or location of player is cr2 entry:
					if howsolve entry > 0:
						say "You've already done that.";
						reject the player's command;
					if fromf entry is a backdrop:
						if there is a tof entry and tof entry is not off-stage:
							say "You've already done that.";
							reject the player's command;
					say "[changetext entry][line break]";
					if location of player is cr1 entry:
						now howsolve entry is 1;
					else:
						now howsolve entry is 2;
					if there is a tof entry:
						set the pronoun it to tof entry;
					if there is a tof entry and tof entry is plural-named:
						set the pronoun them to tof entry;
					if fromf entry is a person:
						if fromf entry is followy:
							now fromf entry is beat;
					if got-yet entry is false:
						inc-score;
						now got-yet entry is true;
					if fromf entry is lye:
						if ant is off-stage and nag is off-stage:
							say "[line break]Some of the lye is left over, still.";
						else:
							say "[line break]That gets rid of the rest of the lye.[check-ach of 25]";
					else if fromf entry is not a backdrop:
						move fromf entry to lalaland;
					if fromf entry is bee: [this is to reduce max scores based on where bee changed]
						if location of player is uppy:
							decrement max-down-score;
						else:
							decrement max-up-score;
					if there is a tof entry:
						if tof entry is zooish or tof entry is tyro or tof entry is serf or tof entry is clerk or tof entry is kid or tof entry is bus: [can I just use a flag instead? Yup.]
							now tof entry is in lalaland;
						else if tof entry is takeonflip:
							now player has tof entry;
						else:
							move tof entry to location of player;
						if tof entry is zooish:
							see-about-stye;
					follow the show debug hints rule;
					follow the notify score changes rule;
					reject the player's command;
				else:
					now jz is fromf entry;
[		if word number 1 in the player's command is b4txt entry:
			if there is a tof entry and tof entry is visible:
				if reversible entry is false:
					say "No, you don't need to flip that back." instead;
				if location of player is cr1 entry or location of player is cr2 entry:
					say "[changetext entry][line break]";
					set the pronoun it to tof entry;
					if there is a tof entry and tof entry is plural-named:
						set the pronoun them to tof entry;
					if got-yet entry is false:
						increment the up-score;
						now got-yet entry is true;
					move fromf entry to lalaland;
					if tof entry is takeonflip:
						now player has tof entry;
					else:
						move tof entry to location of player;
					follow the show debug hints rule;
					follow the notify score changes rule;
					reject the player's command;
				else:
					now jz is fromf entry;]
	unless jz is nothing:
		say "The [jz] shake[unless jz is plural-named]s[end if] a bit but stay[unless jz is plural-named]s[end if] as-is. Maybe you need to move somewhere else." instead;
	say "[err-rej]";

to see-about-stye:
	let styrm be u11;
	if stye is off-stage:
		let vz be the remainder after dividing (slp + 1) by 5;
		let hz be (slp + 4) / 5;
		if number of zooish animals in lalaland is 3:
			if u11 is unvisited and u15 is unvisited:
				if a random chance of 1 in 2 succeeds:
					now styrm is u15;
			else if u11 is unvisited:
				now styrm is u15;
			else if u15 is unvisited:
				now styrm is u11;
			else if hz < 3:
				now styrm is u11;
			else if hz > 3:
				now styrm is u15;
			else:
				if a random chance of 1 in 2 succeeds:
					now styrm is u15;
			if styrm is location of player:
				say "A small structure labeled 'hint stye' breaks off from the odd zoo and shrinks to a more manageable size. You could take it. The stye, not the zoo.";
			else:
				say "You hear a clunk off to the [whichdir of location of player and styrm].";
			now hint stye is in styrm;
			continue the action;

to say whichdir of (r1 - a room) and (r2 - a room):
	let r1v be (shiftability of r1 + 4) / 5;
	let r2v be (shiftability of r2 + 4) / 5;
	let r1h be the remainder after dividing (shiftability of r1 + 4) by 5;
	let r2h be the remainder after dividing (shiftability of r2 + 4) by 5;
	if r2v is r1v and r2h is r1h:
		say "side";
		continue the action;
	say "[if r2v > r1v]south[else if r2v < r1v]north[end if]";
	say "[if r2h > r1h]east[else if r2h < r1h]west[end if]";

rule for printing a parser error when the latest parser error is the I beg your pardon error:
	say "You clear your mind for a minute.";

rule for printing a parser error when the latest parser error is the didn't understand error:
	say "[err-rej]";

table of ep-pos
flippo	blurb
x-it	". You're unable to shift the landscape"
tiger	". The tiger shrugs. It doesn't seem really violent, so maybe you can find it a home, or someone who deserves to get mangled--well, a little"
diver	". The diver's been through enough, though, and doesn't need to get tied up again";

to say epithet of (et - a thing) :
	repeat through table of ep-pos:
		if flippo entry is et:
			say "[blurb entry]";
			continue the action;
	if et is a person or et is an animal:
		say ". Besides, the [et] shouldn't just lose sentience like that";

to say err-rej:
	let h1 be the fhash of the player's command;
	let h2 be the fhash of word number 1 in the player's command;
	let h3 be the rhash of the player's command;
	let h4 be the rhash of word number 1 in the player's command;
	if h2 is 0 or h4 is 0:
		say "You seem to have started your command with a non-letter. You shouldn't need to do this. If you are transcripting, you can start with a semicolon or asterisk.";
		continue the action;
	repeat through table of nudges:
		if h1 is hashval entry or h2 is hashval entry or h3 is hashrev entry or h4 is hashrev entry:
			if there is a thingvis entry and thingvis entry is visible:
				say "[tosay entry][line break]";
				continue the action;
			if there is a myloc entry and location of player is myloc entry:
				say "[tosay entry]";
				continue the action;
			if there is a posrule entry:
				follow the posrule entry;
				if the rule succeeded:
					say "[tosay entry]";
					continue the action;
	repeat through table of flippies:
		if h1 is uphash entry or h2 is uphash entry:
			if fromf entry is visible:
				say "You feel as though you almost did something, there.";
				continue the action;
		if h3 is uphash entry or h4 is uphash entry:
			if fromf entry is visible:
				say "You feel as though you almost did something, there.";
				continue the action;
	repeat through table of flippies:
		if h1 is uphash entry or h2 is uphash entry:
			if tof entry is visible:
				say "You stretch, but you're unable to change things back[epithet of tof entry].";
				continue the action;
		if h3 is uphash entry or h4 is uphash entry:
			if tof entry is visible:
				say "You stretch, but you're unable to change things back[epithet of tof entry].";
				continue the action;
	d "[the player's command]: [fhash of the player's command] / [rhash of the player's command].";
	if number of characters in word number 1 in the player's command > 6:
		say "Don't worry. There's no need for elaborate (>6 character) words in this game. So you can keep the commands simple, whether they are magic words or not.";
		the rule succeeds;
	say "That's not something you can say, do or see here, and it fizzles as a magic word, too. If you're lost about verbs to use in this game, type VERBS.";

volume amusing

Table of Final Question Options (continued)
final question wording	only if victorious	topic	final response rule	final response activity
"CONTINUE as if you didn't ruin everything for the poor oafs[one of] (like undo, just saves what you found[or][stopping]"	false	"CONTINUE"	oaf-cont rule	nodoing

nodoing is an activity.

this is the oaf-cont rule:
	choose row with final response activity of nodoing in the table of final question options;
	now only if victorious entry is true;
	now escape mode is true;
	resume the story;
	d "Restoring undo.";
	choose row with a final response rule of immediately undo rule in the Table of Final Question Options; 
	now the final question wording entry is "UNDO the last command";
	say "You dismiss what you did as a thought experiment. Or you quickly change back your magic just in time.";

book amuse rule

Rule for amusing a victorious player:
	let any-accomp be false;
	repeat through table of accomp:
		if did-accomp entry is false:
			if any-accomp is false:
				say "Other stuff to try:[line break]";
				now any-accomp is true;
			say "[2da][did-you-try entry][line break]";
	if any-accomp is false:
		say "You found everything funny! Good job!";
	else:
		say "[line break]You may use the command WEIRD to see what weird stuff you have left to do, or WDONE to see what you did.";

book amuse table

table of accomp
myidx	did-accomp	did-you-try (indexed text)	dumhash
1	false	"Showing gratitude to the cold frog"	0
2	false	"Getting a snack around the PSST voice"	0
3	false	"Sending the Boxy Hulk to a town somewhere"	0
4	false	"Making more than one of the bee"	0
5	false	"Find a cheap way to WIN"	0
6	false	"Hacking the save file with the right/wrong number to annoy the oafs"	0
7	false	"Doing something rather animalistic by the zoo"	0
8	false	"Trying to make people behave by the zoo"	0
9	false	"Trying to become a deity"	0
10	false	"Vandalizing something"	0
11	false	"Sneaking out by using the tape, sort of"	0
12	false	"Double-dipping changing the hose"	0
13	false	"Be proud to have one pie"	0
14	false	"Ward off the stab bats['] bite"	0
15	false	"Get sad and drunk and give up"	0
16	false	"Get a snack from the hats, or one of them"	0
17	false	"Give the oafs['] goal a net"	0
18	true	"Just showing up"	0
19	false	"[other-zoo]"	0
20	false	"Fixing the marker(s) just west or east of the onyx"	0
21	false	"Disabling the bee"	0
22	false	"Changing the bee's tune"	0
23	false	"Restoring someone's limb before changing them back into...someone"	0
24	false	"Getting a bunny for the zoo"	0
25	false	"Making two animals from the lye, without a carving knife"	0
26	false	"Gaining the punk's approval by letting him vandalize something"	0
27	false	"Reuniting a young oaf with their parent"	0
28	false	"Finding/using tickets out of here"	0
29	false	"Not being scared to play loudly with dolls"	0
30	false	"Make friends with an almost-human (either way)"	0
31	false	"Make hay with the hay"	0
32	false	"Washing your hands of the oafs, or at least considering it"	0
33	false	"Destroying the totem completely"	0
34	false	"Resisting the urge to GBCW"	0
35	false	"Cheating and getting the FRY GUN for the super-good ending"	0
36	false	"Winning any which way"	0

the totem is cyclable. "There's a totem here. It probably invokes something or other ancient."

the soap is cyclable. "Oh, wow! Some soap is here!". description is "This soap looks ideal if you're sick of getting your hands dirty--literally, or maybe even with this quest."

check quitting the game:
	if soap is visible:
		if player is not in d10:
			say "You consider washing your hands of this whole ordeal with the oafs, but this doesn't seem the right place.";
		else:
			say "Here seems like the right place to melodramatically consider ditching the oafs. Do so (if you're going for all the secrets, you'll have to say no or undo)?[check-ach of 32]";
			if the player consents:
				say "Okay.";
				continue the action;
			else:
				say "You hear a couple oafs cheering in the distance." instead;

to say other-zoo:
	say "Creating a new living space for the animals other than the zoo, crossing Bible stories in the process"

to decide whether bee-problems:
	if player is in u01 or player is in u25:
		if location of bee is location of player:
			decide yes;
	decide no;

understand "thks" as a mistake ("[if frog is in lalaland]No need to overdo your thanks.[else]You thank the frog for his cluing help, whether or not it actually was. He hears you, from his underground den, prompting an orchestra of ribbits![check-ach of 1]") when player is in d23 and cold frog is not in lalaland.

to say frog-lala:
	now frog is in lalaland;

beef1 is scenery.

to say beef-off:
	now beef1 is off-stage;

understand "beef" as a mistake ("[if beef1 is off-stage]Mmm! A piece of jerky appears, and it is too good not to eat right away. You feel refreshed[beef-off].[check-ach of 2][else]You try again, but you sort of feel like you're begging. Nothing happens.[end if]") when player is in u10 or player is in u16.

cant-read-accomp is a truth state that varies.

to say check-ach of (nu - a number):
	if cant-read-accomp is true:
		continue the action;
	if nu is a myidx listed in table of accomp:
		choose row with myidx of nu in table of accomp;
		let nu2 be nu;
		if nu2 is 100:
			now nu2 is number of rows in table of accomp;
		if did-accomp entry is false:
			if nu is not 36: [magic number for just winning]
				say "[paragraph break][italic type]Congratulations! You found something fun and frivolous to do.[roman type][no line break]";
			now did-accomp entry is true;
			increment frivolous-points;
			let l be 1;
			repeat with temp running from 1 to nu2:
				now l is l * 613;
				if l > 1111:
					now l is the remainder after dividing l by 1111;
			now dumhash entry is l;
			write file of oafdone from table of accomp;
			mark file of oafdone as ready to read;
	else:
		say "[paragraph break][italic type][bracket]NOTE: could not save your odd accomplishment to file. You may need to delete an old file named uoa or uoa.glkdata.[close bracket][roman type][paragraph break]";

volume marker-print

marker-warn is a truth state that varies.

after printing the locale description (this is the notify plain marker rule):
	if marker-warn is false:
		repeat through table of markables:
			if location of player is rm1 entry or location of player is rm2 entry:
				continue the action;
		now marker-warn is true;
		ital-say "You note in passing that this marker has nothing written on it. From now on, the game won't mention 'plain' markers, even if they are there, and it won't mention markers with writing you've already seen.";
	continue the action;

volume hashes

to decide what indexed text is the filtered name of (t - a value of kind K):
	let t2 be t in lower case;
	replace the regular expression "<^abcdefghijklmnopqrstuvwxyz>" in t2 with "";	[ a-z would include accented characters]
	decide on t2;

to decide what number is the fhash of (t - a value of kind K):
	let s be the filtered name of t;
	let hash be 0;
	let mymult be 1;
	unless there is a Code corresponding to a Letter of character number 1 in s in the Table of Hashcodes:
		decide on 0;
	let fh be the Code corresponding to a Letter of character number 1 in s in the Table of Hashcodes;
	repeat with c running from 2 to the number of characters in s:
		now hash is hash * 26;
		let nh be the Code corresponding to a Letter of character number c in s in the Table of Hashcodes;
		let dh be nh - fh;
		if dh < 0:
			increase dh by 26;
		increase hash by dh;
	let tmn be tomod of number of characters in s;
	now hash is the remainder after dividing hash by tmn;
	increase hash by tmn;
	decide on hash;

to decide what number is the rhash of (t - a value of kind K):
	let s be the filtered name of t;
	let hash be 0;
	let mymult be 1;
	unless there is a Code corresponding to a Letter of character number 1 in s in the Table of Hashcodes:
		decide on 0;
	let fh be the Code corresponding to a Letter of character number 1 in s in the Table of Hashcodes;
	repeat with c running from 2 to the number of characters in s:
		now hash is hash * 26;
		let nh be the Code corresponding to a Letter of character number c in s in the Table of Hashcodes;
		let dh be fh - nh;
		if dh < 0:
			increase dh by 26;
		increase hash by dh;
	let tmn be tomod of number of characters in s;
	now hash is the remainder after dividing hash by tmn;
	increase hash by tmn;
	decide on hash;

to decide which number is tomod of (n - a number):
	let z be 1;
	let finnum be 0;
	let mul be 1;
	let mymod be 1;
	while z <= n:
		increase finnum by mul;
		now mul is mul * 26;
		increment z;
	decide on finnum;

hint-to-file is a truth state that varies.
ignore-transcript-nag is a truth state that varies.

the file of oafhints is called "oafhints".

after reading a command:
	let XX be indexed text;
	let XX be the player's command in lower case;
	change the text of the player's command to XX;
	if the player's command matches the regular expression "^\p" or the player's command matches the regular expression "^<\*;>":
		if hint-to-file is true:
			append "COMMENT: [the player's command]" to the file of oafhints;
		if currently transcripting:
			say "Noted.";
		otherwise:
			if ignore-transcript-nag is false:
				say "You've made a comment-style command, but Transcript is off. Type TRANSCRIPT to turn it on, if you wish to make notes.[paragraph break]The long version of this nag will only appear once. You may press any key to continue.";
				wait for any key;
				now ignore-transcript-nag is true;
			else:
				say "(Comment not sent to transcript.)";
		reject the player's command;
	if the player's command matches the regular expression "^(change|shift|change to|say|shout|yell)":
		ital-say "If you think you have a magic word, that is the only command you need. So I am cutting the first word.";
		replace the regular expression ".* " in XX with "";
		change the text of the player's command to XX;
	if pull-warn is false:
		if word number 1 in the player's command is "pull":
			ital-say "this game treats pull and push as synonyms.";

pull-warn is a truth state that varies.

table of hashcodes
Letter(indexed text)	Code
"a"	1
"b"	2
"c"	3
"d"	4
"e"	5
"f"	6
"g"	7
"h"	8
"i"	9
"j"	10
"k"	11
"l"	12
"m"	13
"n"	14
"o"	15
"p"	16
"q"	17
"r"	18
"s"	19
"t"	20
"u"	21
"v"	22
"w"	23
"x"	24
"y"	25
"z"	26

volume hints

does the player mean objhinting something off-stage: it is very unlikely.
does the player mean objhinting something in lalaland: it is very unlikely.

instead of objhinting something in lalaland:
	say "That's out of the way now.";

check objhinting (this is the don't hint unvisited items rule):
	if noun is off-stage:
		say "That's not part of the game, yet, or you haven't been to see it." instead;
	if location of noun is lalaland:
		say "You're done with that." instead;
	if location of noun is unvisited:
		say "You haven't visited where the [noun] [if noun is plural-named]are[else]is[end if], yet." instead;

to say w-get-chain:
	say "[if player has chain]With[else]You need to get[end if]";

the can't push unpushable things rule is not listed in any rulebook.

understand the command "pull [something]" as something new.
understand the command "pull [something] [direction]" as something new.
understand the command "pull [something] to [direction]" as something new.

Understand "pull [something]" as pushing.
Understand "pull [something] [direction]" or "pull [something] to [direction]" as pushing it to.

check pushing to a direction:
	if noun is not sled and noun is not steeds:
		say "Most things in this game can either be carried, or they can't be pushed." instead;
	if noun is steeds:
		say "They won't budge. Maybe they need to be led." instead;

table of hintobjs (continued) [toh]
myobj	altobj	mytxt	find-rule	hint-if-vis
--	--	"[first-hint]"	no-score-yet rule
--	--	"You've hooked the steeds up. Lead them to the onyx now!"	steeds-hooked rule
tuffet	--	"[if u01 is unvisited and u25 is unvisited]The tuffet in the northwest/southeast corners is a good thing to start on.[line break][else][one of]The tuffet seems a bit restless, like if you shift it just a bit, it could become something more powerful.[plus][or]The tuffet can become STEEDS.[minus][cycling][end if]"	tuffet-yet rule
--	--	"[one of]You haven't found an item that can be changed into an oaf yet. Perhaps you need to look around more.[plus][or]The cot has an impression of an oaf in it.[plus][or]The cot can become an OAF.[minus][cycling]"	cot-yet rule
cot	--	"[one of]The cot has an impression of an oaf on it.[plus][or]Perhaps you can change it to one--east or west of Terra.[minus][cycling]"	--	true
--	--	"[one of]You need to search for an ingot, now. Well, you don't need to, but it's probably the quickest way through the game. HINT again if you haven't found it.[or]The ingot is in [location of ingot].[stopping]"	ingot-not-found rule
ingot	--	"[one of]The ingot [if location of ingot is not visited], which you haven't found yet, [end if]is valuable, but not in its present form.[plus][or]Go to WWN of Terra, and it can become a CHAIN.[minus][cycling]"	ingot-yet rule
chain	--	"[one of]The chain can tie two things together.[plus][or]First, you have to change the tuffet into steeds.[plus][or]Then, you need to change the ingot into a chain.[minus][cycling]"
--	--	"[one of]You may want to find some hats next. Another HINT will show you where they are.[or]The hats are in [location of hats].[stopping]"	hats-not-found rule
hats	--	"[one of]The hats look like something you'd wear on a long haul.[plus][or]Two west or east of Terra, they become a SLED.[minus][cycling]"	hats-yet rule
--	--	"You now have created a chain, a sled and steeds. Maybe you can bring them together.[line break]"	no-chain-yet rule
--	--	"Go down to your next challenge.[line break]"	chicken-cheep rule
sled	--	"[if chain is part of the sled]Just lead the steeds, now.[line break][else][one of]You can push the sled to different places, but the question is, where?[plus][or]You need someone or something to push it around.[plus][or]Once you've changed the tuffet to steeds, you have something that can pull it, but you need to attach them.[plus][or][w-get-chain] the chain, then TIE SLED TO STEEDS.[minus][cycling][end if]"	--	true
--	--	"[bottom-hint]"	no-bottom-hint-yet rule
--	--	"You may find a grid useful in another form.[line break]"	no-grid rule
grid	--	"[one of]The grid can become something more useful.[plus][or]Two south of the pulse, it can become PENS.[minus][cycling]"	--	true
pens	--	"[one of]You can mess with the pens. You really only need one. The easy way to do this is to DROP the pens.[plus][or][minus][cycling]"	--	true
pen	--	"[one of]The pen can probably write one big, curious word. You need a place to write, and something to write again.[plus][or]By the Wrath Pulse, it can say WHY. This will enrage the Wrath Pulse, winning the game.[minus][cycling]"	--	true
dolls	--	"[one of]You can change the dolls to something else.[plus][or][if up-score > 0]Try all the possibilities.[else]You haven't figured out the game's mechanic, so there's a spoiler ahead.[end if][plus][or]The dolls become a WHEEL.[plus][or]Go just northwest of the onyx.[minus][cycling]"	--
cold frog	--	"The cold frog is scenery that will help you to figure what is going on.[line break]"
ferns	--	"[one of]The ferns can be changed to something. If you understand the game's rules, you'll know what.[plus][or]They can become a BANJO.[minus][cycling]"
pecan	--	"[one of]The pecan's stripes may be a clue.[plus][or]Change it to a TIGER when NNE of Green Terra.[minus][cycling]"
foggy barrier	--	"There's no way around the foggy barrier, but you may notice that it's north of locations marked 1-5 and south of 21-25.[line break]"
pecan	--	"[one of]The ovals can become something else.[plus][or]Like a HOTEL when NW or SE of Green Terra.[minus][cycling]"
bee	--	"[one of]You've annoyed the bee, but you need a way to change it around.[plus][or]There are a lot of quick possibilities to check, and you can change it to two things.[plus][or]You can change it into a LOO...[plus][or]...or, once you realize all parts of speech are okay, it can become ILL if you're NW/SE of Terra.[minus][cycling]"
Bob	--	"There's nothing you can do for, or to, Bob. He's just a clue if you don't know what's going on.[line break]"
oaf	--	"If you TALK TO the oaf, it gives you help based on how far along you are.[line break]"
psst	--	"[one of]The psst is a clue. You can't change it, but it tells you to loop.[plus][or]If you already know the game's mechanics, the psst is useless, but it could give you an extra point.[minus][cycling]"
stab bats	--	"[one of]The stab bats are a palindrome, but that's not significant. Besides, that'd totally be copying Kingdom of Loathing. They are not, however, critical to the game.[plus][or]They do bite, and you don't see the way to get at them.[plus][or]You need to SLAP back at them. You can SLAP, or SLAP BATS.[minus][cycling]"
odd zoo	--	"[one of]The zoo is there for entertainment, and to keep whatever animals you may find. It's a hint that there ARE animals to retrieve. This may or may not help you with what to say.[plus][or]You can do two things by the zoo as well. One polite, and one not so polite.[minus][cycling]"
dudes	--	"[one of]Whoah! Those guys are totally cool! Are you sure you don't know who they are?[plus][or]You can figure who they are, somewhere. Or we are.[plus][or]This is a puzzle I'm not going to hint. You can discover it in the code, if you want, but that's no fun.[minus][cycling]"
left guy	--
middle guy	--
right guy	--
cubed melon	--	"The cubed melon is just a clue.[line break]"
hawk	--	"That animal is safe in the zoo.[line break]"
colt	--	"That animal is safe in the zoo.[line break]"
owl	--	"That animal is safe in the zoo.[line break]"
tiger	--	"That animal is safe in the zoo.[line break]"
doves	--	"That animal is safe in the zoo.[line break]"
hawk	--	"That animal is safe in the zoo.[line break]"
oxen	--	"Those animals are safe in the zoo.[line break]"
wet sap	--	"[one of]The wet sap can become something in two places.[plus][or]N, S, NNE, SSW, it can become an OWL.[minus][cycling]"
wheel	--	"The wheel is just, well, THERE. For now.[line break]"
river	--	"[one of]You can make something appear by the river. Since it's fixed in place--or two places--you can figure what to do.[plus][or]It can become an ARENA, but there's one other thing you can do with it.[plus][or]Once you visit all the locations on the top, the river starts running. You can PUT an item in the river, which will dump the item in the right place to do change it.[minus][cycling]"
bane hive	--	"You can ATTACK the bane hive to get the bee inside to attack you.[line break]"
banjo	--	"[one of]You can play the banjo, of course.[plus][or]With the drum, you can put on a performance [if arena is off-stage]somewhere[else]in the arena[end if]. But it's not critical.[minus][cycling]"
keg	--	"[one of]The keg can be changed to something else a bit cold.[plus][or]Go SSE or NNW of Terra, and you can make it ICE.[minus][cycling]"
ice	--	"[one of]You can put the ice on something to cool it down.[plus][or]Like the HOT BIN.[minus][cycling]"
goal	--	"[one of]The goal is fixed in place, but you can change it if you know what the mechanics are.[plus][or]Add some MESH to it, and the oafs will have more fun playing--whatever they play with the goal.[minus][cycling]"
ovals	--	"[one of]The ovals help you feel relaxed just taking them.[plus][or]They can become a HOTEL if you are NW or SE of Terra.[minus][cycling]"
snare	--	"[one of]Something's trapped in the snare. You need to figure what. Since the snare is fixed, if you understand underground's mechanics, you know what this is.[plus][or]It's a DIVER.[minus][cycling]"
pyrex	--	"[one of]The pyrex fell out of the hotel. It sort of belongs there, but not in that form.[plus][or]If you change the pyrex to a CLERK, it will set things straight.[minus][cycling]"
pies	--	"[one of]You can eat the pies, if you want, or you can change them.[plus][or]North or south of Terra, they become a HAWK.[minus][cycling]"
glad idol	--	"The idol is only useful for helping you understand underground.[line break]"
x-it	--	"You can get a bonus/side point for using it to ditch the oafs.[line break]"
sky	--	"[one of]You may be looking up, waiting for something to fall down to make you stronger.[plus][or]East or West of Terra, you can get a GYM to drop.[minus][cycling]"
yourself	--	"There's nothing really to hint about yourself besides your power.[line break]"
marker	--	"Markers hold hints, both with the number--which sort of helps you map the game out--and what's scribbled on them, which tells the mechanics of the game.[line break]"
gym	--	"You can enter the gym to make yourself stronger.[line break]"
hose	--	"The hose can be converted to two things.[line break]"
tape	--	"[one of]The tape isn't critical, but it can help you ditch the oafs.[plus][or]You can change it to an EXIT 2S2W of the entry.[minus][cycling]"
den	--	"You don't need a den, but it does nice up the place a bit.[line break]"
clerk	--	"You can't really bug the clerk once he's at work.[line break]"
Obelisk	--	"You can't approach it, but animals can. You need to look around.[line break]"
rift	--	"[one of]The rift can become something more manageable. It can't be moved.[plus][or]It can become a FORD.[minus][cycling]"
knob	--	"You need to figure the combination on your own. I'm not telling that.[line break]"
dial	--	"You need to figure the combination on your own. I'm not telling that.[line break]"
prune trove	--	"[one of]The prune trove is not valuable.[plus][or]The boxy hulk kept yelling MINE! MINE![plus][or]But the trove may not have been the hulk's.[plus][or]The hulk was guarding a mine beneath the trove.[plus][or]How can you make the mine appear?[plus][or]WAVE.[minus][cycling]"
shard	--	"[one of]The shard can become an animal.[plus][or]Two south of the Wrath Pulse, it becomes DOVES.[minus][cycling]"
mesh	--	"You can't do anything with the mesh, and you don't need to.[line break]"
o-b	--	"[one of]The one bar can become something different somewhere else.[plus][or]NEE or SW of the wrath pulse, it can become a DEN.[minus][cycling]"
drum	--	"[one of]The drum can be played along with another item.[plus][or]Or it can be made into an animal.[plus][or]You can go NE of the pulse to change the drum to a colt.[minus][cycling]"
steeds	--	"[one of]The steeds need something to pull.[plus][or]A sled is just the thing.[plus][or]Then you need something to attach the steeds to the sled.[minus][cycling]"
arena	--	"You can enter the arena once you have the banjo and the drum.[line break]"
hole	--	"You can just go down the hole.[line break]"
hotel	--	"You can enter the hotel to get a bit of a rest.[line break]"
boxy hulk	--	"[one of]To get rid of the hulk, you need to get an enemy to attack you and run at you. He will start a fight with the hulk.[plus][or]There is the thug.[plus][or]There is also the punk.[plus][or]The tiger counts, too. If you've gotten rid of all three--say, by taking the tiger to the zoo, and pitting the thug against the punk, you can't clear the hulk.[minus][cycling]"
ford	--	"You can enter the ford to ditch the oafs--or not.[line break]"
diver	--	"You can bring the diver back to the river above.[line break]"
dune	--	"[one of][plus][or][minus][cycling]"
ribs	--	"[one of]The ribs can be an animal, or a rib can be something else.[plus][or]The ribs can become an OXEN.[minus][cycling]"
heavy gear	--	"The heavy gear is so the oaf diver can dive.[line break]"
bikes	--	"[one of]You can do two things with the bikes. They can be changed directly.[plus][or]To a pigmy who is missing a limb. Hm, the bikes have three of four tires. Maybe you can find a replacement.[plus][or]If you changed the dolls to a wheel, then PUT WHEEL ON BIKES restores the pigmy fully.[minus][cycling]"
punk	--	"[one of]There are two ways to deal with the punk. One is to get him in touch with someone else who is fighting you, or could fight you.[plus][or]You can also give the punk something he would like to break, for a silly extra point.[plus][or]If you've seen any musical instruments, you'll know.[minus][cycling]"
thug	--	"[one of]There is one way to deal with the thug. Get him in touch with someone else who is fighting you, or could fight you.[plus][or]The thug can fight the punk, [if hulk is off-stage]the bee from the hive[else]the hulk[end if] or the tiger. It's probably least useful for him to take out the tiger or punk, as they aren't guarding anything.[minus][cycling]"
kid	--	"The kid is safe with his family.[line break]"
talk slab	wrath pulse	--
wrath pulse	--	"[one of]The wrath pulse won't let you get a word in, speaking, but what's another way to get a word in?[plus][slab]If you look at the talk slab, you'll see lots of writing![plus][or][if player has pen]Your pen can write something on the talk slab. You may guess what, by where you are[else if player has pens]The pens can be dropped to get a pen, which can write something by the wrath pulse.[else]You need to find the grid, which can become something to write with.[end if][plus][or]Once you have a pen, you can write the three letter question.[plus][or]WHY.[minus][cycling]"
sea guy	--	"You won't deal with the Sea Guy directly. The Wrath Pulse is enforcing his will. His name is a clue.[line break]"
undug elves	--	"You won't deal with the Undug Elves directly. The Wrath Pulse is enforcing his will. Their name is a clue.[line break]"
safe	--	"I don't wish to hint the safe until after IFComp is over. You have all the information you need, and you can also look in the source code for the how or why.[line break]"
fry gun	--	"[if player is in d13]Just shoot the pulse or the slab[else]Carry the fry gun to the wrath pulse in the center, then shoot[end if].[line break]"
ark	--	"The ark is just to give the animals a new place.[line break]"
tyro	--	"The tyro should be off-stage.[line break]"
serf	--	"The tyro should be off-stage.[line break]"
ant	--	"The ant should be happy in the zoo.[line break]"
nag	--	"The nag should be happy in the zoo.[line break]"
mn	--	"[one of]You need a talisman that lets you walk in the mine.[plus][or]You need someone, or someoaf, who can search and find things.[plus][or]The diver inside the snare may help.[plus][or]Talk to the diver and have them move around.[plus][or]The diver can go in the river aboveground.[plus][or]There's also a place belowground. You [if rift is in lalaland]can take the diver to the ford[else]can change the rift into a ford[end if].[minus][cycling]"
air	--	"[one of]The air can be changed in one place.[plus][or][if its-muddy]You already changed the air to mud[else]It can become MUD by the signpost that isn't fully buried[end if].[minus][cycling]"
ground	--	"The ground is just there.[line break]"
bunny	--	"The bunny should be in the zoo. If not, BUG.[line break]"
lye	--	"[one of]The lye can be turned into two animals aboveground.[plus][or][if ant is in lalaland]You already made[else]First is[end if] an ant.[plus][or][if nag is in lalaland]You already made[else]There's also[end if] a nag.[minus][cycling]"
numerals	--	"[one of]The numerals hint something, but it's nothing to do with the game.[plus][or]They're almost an alphabet cipher, but with 0 instead of 26.[plus][or]Link them up, and you get the author's actual name.[minus][cycling]"
bottle of gin	--	"[one of]The oaf who had it lost a child. Maybe the gin can bring it back.[plus][or]ESE of the pulse, the gin can become a KID.[minus][cycling]"
left guy	--	"He has a name. You can figure it out in-game."
middle guy	--	"He has a name. You can figure it out in-game."
right guy	--	"He has a name. You can figure it out in-game."
[toh]

[
	--	"[one of][plus][or][minus][cycling]"
]

to say bottom-hint:
	if number of downy unvisited rooms > 16:
		say "You may want to avoid the corners, but you can poke around all the other rooms to notice what is there. The markers and what they say are, again, helpful. There is enough evidence to figure what to do at the center.";
		continue the action;
	say "[one of]You may suspect the mechanic is similar to the top. [plus][or]The undug elves and sea guy are a bit beyond, and this may provide a clue. [plus][or]So may some of the location names elsewhere. [plus][or]S=letter 19, G=letter 7. E=letter 5, U=letter 21. A=letter 1, Y=letter 25. [plus][or]You flip words based on if they, and another word, sum to the same alphabetical letter. In other words, you pivot around a certain letter. [minus][cycling]";

to say first-hint:
	if location of player is uppy:
		if number of uppy unvisited rooms > 0:
			say "You will get a small hint if you visit all the rooms. Or you can HINT (OBJECT) for a specific clue.";
			continue the action;
		if up-score is 0:
			say "[one of]There are a lot of frivolous points to pick up in the game, and I hope they're fun. But there are a few important ones. [plus][or]'Nowhere, abjurer' once you visited all the rooms is a clue. [plus][or]So is 'Oho, bub,' back at Green Terra. As is when you balk at the onyx. [plus][or]So are some of the stationary objects you don't need to bother with. The cold frog NN of Green Terra in particular. [plus][or]There's a reason the frog's in two places. Did you notice the marker numbers?[plus][or]The markers are numbered from 1 to 25. By the cold frog, the marker is 3, or 23. [plus][or]Which is the distance between the letters C and F, backwards or forwards. [plus][or]Also between O and R. [plus][or]And L and O, and D and G. [plus][or]Aboveground's mechanic is letter shifting. A good first task might be to figure what can become an oaf. That oaf will help you in the future. [plus][or]The cot can become an oaf. [plus][or]O is letter 15, A is letter 1. So you need to go to the area with marker 14 or 12 to change it. [plus][or]Go just west or just east of the onyx and say OAF. [plus][or]That's all you should need to get started. The hints will now cycle. [minus][cycling]";
			continue the action;
	say "You shouldn't be seeing this hint. You've already scored a point. Try hinting objects instead.";

this is the chicken-cheep rule:
	if steeds are in lalaland and d13 is unvisited:
		the rule succeeds;
	the rule fails;

this is the no-chain-yet rule:
	if steed-sled is false:
		if steeds are not in lalaland:
			the rule succeeds;
	the rule fails;

this is the steeds-hooked rule:
	if chain is part of the sled:
		if room below u13 is nothing:
			the rule succeeds;
	the rule fails;

this is the no-grid rule:
	if player has grid or grid is in lalaland or location of grid is visited:
		the rule fails;
	the rule succeeds;

this is the ingot-not-found rule:
	if player has ingot or ingot is in lalaland or location of ingot is visited:
		the rule fails;
	the rule succeeds;

this is the hats-not-found rule:
	if player has hats or hats are in lalaland or location of hats is visited:
		the rule fails;
	the rule succeeds;

this is the hats-yet rule:
	if hats are in lalaland:
		the rule fails;
	the rule succeeds;

this is the ingot-yet rule:
	if ingot is in lalaland:
		the rule fails;
	the rule succeeds;

this is the tuffet-yet rule:
	if tuffet is in lalaland:
		the rule fails;
	the rule succeeds;

this is the cot-yet rule:
	if tuffet is in lalaland:
		the rule fails;
	the rule succeeds;

this is the no-bottom-hint-yet rule:
	if d07 is not visited:
		the rule fails;
	if down-score is 0:
		the rule succeeds;
	the rule fails;

this is the no-score-yet rule:
	if up-score is 0 and frivolous-points is 0:
		the rule succeeds;
	the rule fails;

every turn:
	follow the no-score-yet rule;

check requesting the score:
	say "You've scored [up-score] of [max-up-score] points aboveground[if d13 is visited] and [down-score] of [max-down-score] belowground[end if]--it's possible to get a winning ending with just 3 and 2. You've found [frivolous-points] totally frivolous point[if frivolous-points is not 1]s[end if]. Well, this whole game's frivolous, but those are DOUBLE frivolous.[paragraph break]";
	if number of animals in lalaland > 0:
		say "You've managed to get [number of animals in lalaland] animals to the oafs['] odd zoo[if u11 is unvisited and u15 is unvisited] you haven't visited yet[end if].[paragraph break]";
	if oaf is off-stage:
		say "That representative the oafs told you about still hasn't turned up. You haven't found its disguise. Maybe if you found it, or something that could become one, you could get help.";
	else:
		if oaf is visible:
			say "You can hit up the oaf right here for chat.";
		else:
			say "You can check back with the oaf to see about what to do next.";
	if river-can-hint:
		say "If you're lost, you may want to throw something in the river and see where it goes.";
	the rule succeeds;

volume hinty stuff

to one-line:
	repeat with x running from 1 to 26:
		say "[character number x + 64]";
	say "[line break]";

the hint stye is a thing. "A small structure labeled a HINT STYE has appeared! It appears written on.". description of hint stye is "You shouldn't see this."

understand "structure" as hint stye.

stye-hint is a number that varies. box-hint is a number that varies.

check opening hint stye:
	say "That might break the clues it's giving." instead;
	
check opening rev box:
	say "That might break the clues it's giving." instead;

check examining hint stye:
	say "You look at the hint stye. It's cute and cottage-y with no way to open it, but it has two lines of writing:[paragraph break][fixed letter spacing]";
	let y be 0;
	increment stye-hint;
	one-line;
	repeat with x running from 1 to 26:
		now y is x + shiftability of location of player + 64;
		if y > 90:
			now y is y - 26;
		say "[character number Y]";
	say "[roman type][line break]";
	the rule succeeds;

the rev box is a thing. "A tiny box labeled REV BOX is here. It appears written on.". description of rev box is "You shouldn't see this."

check examining rev box:
	let z be 0;
	if location of player is downy:
		now z is shiftability of location of player;
	else:
		say "The lettering on the rev. box appears faded right now." instead;
	let y be 0;
	increment box-hint;
	say "[one of]Hm, rev. Short for reverse. [or][stopping]You look at the rev box, and you see...[paragraph break][fixed letter spacing]";
	one-line;
	repeat with x running from 1 to 26:
		now y is 90 - x + z;
		if y <= 64:
			now y is y + 26;
		if y > 90:
			now y is y - 26;
		say "[character number Y]";
	say "[roman type][line break]";
	the rule succeeds;

To say character number (N - a number): (- print (char) {N}; -)

chapter z2ding

z2ding is an action applying to nothing.

understand the command "z2d" as something new.

understand "z2d" as z2ding.

carry out z2ding:
	say "You speak the magic command, and as you do so, fire and lightning spark. Oafs surround you, hands raised. 'We is defeating the sea guy! And the undug elves!'[paragraph break]'VIP REX!' they cry, lifting you up and escorting you to a wonderful villa just west of the Wrath Pulse. You're labeled as sort of an honorary leader, and you don't have to do much except make sure you don't step on any oafs.[paragraph break]Congratulations! You figured the crood sheet's code and got the really good ending!";
	choose row with final response activity of nodoing in the table of final question options;
	blank out the whole row;
	end the game in victory;
	the rule succeeds;

volume epilogue jazz

escape mode is a truth state that varies.

Include (-

[ ASK_FINAL_QUESTION_R;
	print "^";
	(+ escape mode +) = false;
	while ((+ escape mode +) == false) {
		CarryOutActivity(DEALING_WITH_FINAL_QUESTION_ACT);
		DivideParagraphPoint();
	}
];

-) instead of "Ask The Final Question Rule" in "OrderOfPlay.i6t".

volume beta testing - not for release

[ this is only included procedurally. I didn't let my testers do any tricks. I didn't give them the time. Still, as a general programming tip, it's useful to have this to help testers skip around without letting them PURLOIN or sending them through the tests you run automatically]

volume testing - not for release

chapter whereing

whereing is an action out of world.

understand the command "where" as something new.

understand "where" as whereing.

carry out whereing:
	repeat through table of flippies:
		if player has fromf entry or player has tof entry:
			do nothing;
		else:
			say "[fromf entry] in [location of fromf entry], [tof entry] in [location of tof entry].";
	the rule succeeds;

chapter ezuping

ezuping is an action out of world.

understand the command "ezup" as something new.

understand "ezup" as ezuping.

carry out ezuping:
	urploin wet sap;
	urploin hats;
	urploin dolls;
	urploin cot;
	urploin pecan;
	urploin shard;
	urploin grid;
	urploin hose;
	urploin ingot;
	urploin ovals;
	urploin pyrex;
	now onyx is in lalaland;
	now hole is in u13;
	now d13 is below u13;
	now u13 is above d13;
	the rule succeeds;

to urploin (urp - a thing):
	if urp is in lalaland:
		say "[urp] already dealt with.";
	else:
		say "Got [urp].";
		now player has urp;

chapter ezding

ezding is an action out of world.

understand the command "ezd" as something new.

understand "ezd" as ezding.

carry out ezding:
	urploin hose;
	urploin grid;
	urploin keg;
	urploin shard;
	now thug is in d05;
	now punk is in d01;
	the rule succeeds;

chapter waysing

waysing is an action out of world.

understand the command "ways" as something new.

understand "ways" as waysing.

carry out waysing:
	say "From [location of player] [shiftability of location of player]:[line break]";
	repeat with Q running through directions:
		if noun is up or noun is down or noun is inside or noun is outside:
			do nothing;
		else if the room q of location of player is nowhere:
			say "[q]: nowhere.";
		else:
			say "[q]: [room q of location of player], [shiftability of room q of location of player].";
	the rule succeeds;

chapter wipeing

wipeing is an action out of world.

understand the command "wipe" as something new.

understand "wipe" as wipeing.

carry out wipeing:
	d "Clearing all entries.";
	now frivolous-points is 0;
	let thisrow be 0;
	repeat through table of accomp:
		increment thisrow;
		if thisrow is not 18:
			now did-accomp entry is false;
			now dumhash entry is 0;
		else:
			now did-accomp entry is true;
			now dumhash entry is 0;
	write file of oafdone from table of accomp;
	the rule succeeds;

chapter wooing

[* WOOing ends the story.]

wooing is an action applying to nothing.

understand the command "woo" as something new.

understand "woo" as wooing.

carry out wooing:
	end the story finally;
	the rule succeeds;

chapter anping

anping is an action out of world.

understand the command "anp" as something new.

understand "anp" as anping.

carry out anping:
	say "[list of animals].";
	say "[list of zooish animals in lalaland].";
	the rule succeeds;

chapter xtest

xtesting is an action out of world.

understand the command "xtest" as something new.

understand "xtest" as xtesting.

to say ftxt of (rm1 - a room) and (myd - a direction):
	unless the room myd of rm1 is nothing:
		let Q be shiftability of the room myd of rm1;
		say "[if Q < 10]0[end if][Q]";
	else:
		say "00";

to dir-compare (myr - a room) and (qq - a direction):
	if the room qq of myr is nothing:
		continue the action;
	if qq is down or qq is up or qq is inside or qq is outside:
		continue the action;
	let a be shiftability of myr;
	let b be shiftability of room qq of myr;
	let magic-number be 0;
	if qq is north:
		now magic-number is 5;
	if qq is south:
		now magic-number is -5;
	if qq is west:
		if myr is uppy:
			now magic-number is 1;
		else:
			now magic-number is -1;
	if qq is east:
		if myr is uppy:
			now magic-number is -1;
		else:
			now magic-number is 1;
	if qq is southwest:
		if myr is uppy:
			now magic-number is -4;
		else:
			now magic-number is -6;
	if qq is southeast:
		if myr is uppy:
			now magic-number is -6;
		else:
			now magic-number is -4;
	if qq is northeast:
		if myr is uppy:
			now magic-number is 4;
		else:
			now magic-number is 6;
	if qq is northwest:
		if myr is uppy:
			now magic-number is 6;
		else:
			now magic-number is 4;
	if qq is north:
		if magic-number is not 5:
			say "North of [myr], [a], is [b], should be [a - 5].";
	if qq is south:
		if magic-number is not -5:
			say "Sorth of [myr], [a], is [b], should be [a + 5].";
	if qq is west:
		if myr is uppy:
			if magic-number is not 1:
				say "West of [myr], [a], is [b], should be [a - 1].";
		if myr is downy:
			if magic-number is not -1:
				say "West of [myr], [a], is [b], should be [a + 1].";
	if qq is east:
		if myr is uppy:
			if magic-number is not -1:
				say "West of [myr], [a], is [b], should be [a + 1].";
		if myr is downy:
			if magic-number is not 1:
				say "West of [myr], [a], is [b], should be [a - 1].";
	
carry out xtesting:
	repeat with myr running through rooms:
		repeat with qq running through directions:
			dir-compare myr and qq;
	if location of player is uppy:
		repeat with myr running through uppy rooms:
			say "[myr][line break]";
			say "[fixed letter spacing]";
			say "[ftxt of myr and northwest] [ftxt of myr and north] [ftxt of myr and northeast][line break]";
			say "[ftxt of myr and west] [if shiftability of myr < 10]0[end if][shiftability of myr] [ftxt of myr and east][line break]";
			say "[ftxt of myr and southwest] [ftxt of myr and south] [ftxt of myr and southeast][line break]";
			say "================[roman type][line break]"; 
	if location of player is downy:
		repeat with myr running through downy rooms:
			say "[myr][line break]";
			say "[fixed letter spacing]";
			say "[ftxt of myr and northwest] [ftxt of myr and north] [ftxt of myr and northeast][line break]";
			say "[ftxt of myr and west] [if shiftability of myr < 10]0[end if][shiftability of myr] [ftxt of myr and east][line break]";
			say "[ftxt of myr and southwest] [ftxt of myr and south] [ftxt of myr and southeast][line break]";
			say "================[roman type][line break]"; 
	the rule succeeds;

chapter fcing

fcing is an action out of world.

understand the command "fc" as something new.

understand "fc" as fcing.

carry out fcing:
	repeat through table of flippies:
		if there is a tof entry:
			if tof entry is takeonflip:
				say "You take [tof entry].";
			else:
				say "You don't take [tof entry].";
	the rule succeeds;

book tests

test chai with "test tkit/w/w/sled/push n/chain"

test stee with "test tkit/w/w/sled/push n/chain/push n/steeds/tie steeds to sled/sw/w/nw/n/ne"

test 4cor with "nw/nw/e/e/e/e/s/s/s/s/w/w/w/w/ne/ne"

test tkb with "take all/w/take all/n/take all/e/take all/e/take all/s/take all/s/take all/w/take all/w/take all/w/take all/n/take all/n/take all/n/take all/e/take all/e/take all/e/take all/e/take all/s/take all/s/take all/s/take all/s/take all/w/take all/w/take all/w/take all/w/take all/ne/ne"

test hatty with "test tkit/ne/put hats in river/nw"

test spiral with "w/n/e/e/s/s/w/w/w/n/n/n/e/e/e/e/s/s/s/s/w/w/w/w"

test wdeath with "ezup/w/oaf/win/continue/talk to oaf/god/continue"

test qd with "wipe/ezup/w/oaf/win/continue/god/continue/s/hotel/n/w/pee/shh/bun/sled/push sled n/chain/push sled n/steeds/tie sled to steeds/se/wheel/se/clerk/n/owl/e/arena/n/banjo/w/thks/s/s/d/ezd"

test w2 with "purloin cot/nw/w/win/continue/win/continue"

test qb with "w/nw/attack hive/e/se/u/nw/ill/se/d/nw/w/reno/e/se"

test qb2 with "s/sw/pies/e/diver/doves/pens/n/n/u/w/w/etch/e/e/d/why"

test itall with "test qd/test qb/test qb2"

test fite with "test qu/nw/w/attack hive/e/se/u/nw/ill/se/d/ezd/nw/nw/s"

test sofar with "ezup/w/w/pee/shh/ne/ne/thks/s/oaf/sw/w/sled/se/arena/ne/d/sw/s/doves/n/n/nw/attack hive/e/se/u/nw/ill/w/w/tiger/sw/sw/d/w/nw"

test qsta with "ezgo/d/s/sw/pens/drop pens/n/ne/why/u/n/oaf/talk to oaf"

chapter walkthrough

test qw with "test tkit/w/ribs/w/sled/push sled n/chain/push sled n/steeds/tie sled to steeds/tie steeds to sled/tie chain to sled/tie sled to chain/se/se/d/test 4cor/test tkit/s/s/pens/get pens/drop pens/n/n/why"

test qw2 with "test tkit/w/ribs/w/sled/push sled n/chain/push sled n/steeds/tie sled to steeds/tie steeds to sled/tie chain to sled/tie sled to chain/se/se/d/ezd/nw/w/hit hive/s/moo/n/n/s/wave/se/se/s/doves/diver/talk to diver/y/w/ford/ne/n/u/ne/sw/d/nw/w/in/turn dial to 3/turn dial to 13/turn dial to 10/out/e/se/shoot pulse"

test qu with "test tkit/w/w/sled/push sled n/chain/push sled n/steeds/tie sled to steeds/tie steeds to sled/tie chain to sled/tie sled to chain/se/se/d"

chapter hinttest

test lkit with "x marker/w/x marker/n/x marker/e/x marker/e/x marker/s/x marker/s/x marker/w/x marker/w/x marker/w/x marker/n/x marker/n/x marker/n/x marker/e/x marker/e/x marker/e/x marker/e/x marker/s/x marker/s/x marker/s/x marker/s/x marker/w/x marker/w/x marker/w/x marker/w/x marker/ne/ne"

test thinx with "x marker/think/w/x marker/think/n/x marker/think/e/x marker/think/e/x marker/think/s/x marker/think/s/x marker/think/w/x marker/think/w/x marker/think/w/x marker/think/n/x marker/think/n/x marker/think/n/x marker/think/e/x marker/think/e/x marker/think/e/x marker/think/e/x marker/think/s/x marker/think/s/x marker/think/s/x marker/think/s/x marker/think/w/x marker/think/w/x marker/think/w/x marker/think/w/x marker/think/ne/ne"

chapter auxiliary

test cheatall with "qu/u/purloin stye/x stye/w/x stye/w/x stye/s/x stye/s/x stye/ne/x stye/s/x stye/e/x stye/e/x stye/n/x stye/w/x stye/ne/x stye/w/x stye/nw/x stye/w/x stye/w/x stye/n/x stye/n/x stye/e/x stye/s/x stye/ne/x stye/s/x stye/s/x stye/e/x stye/n/x stye/n/x stye/e/x stye/s/x stye/s/x stye/w/w/d"

test tkit with "take all/w/take all/n/take all/e/take all/e/take all/s/take all/s/take all/w/take all/w/take all/w/take all/n/take all/n/take all/n/take all/e/take all/e/take all/e/take all/e/take all/s/take all/s/take all/s/take all/s/take all/w/take all/w/take all/w/take all/w/take all/ne/ne"


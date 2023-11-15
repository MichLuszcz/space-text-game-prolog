Welcome to SWI-Prolog (threaded, 64 bits, version 7.6.4)
SWI-Prolog comes with ABSOLUTELY NO WARRANTY. This is free software.
Please run ?- license. for legal details.

For online help and background, visit http://www.swi-prolog.org
For built-in help, use ?- help(Topic). or ?- apropos(Word).

['/home/olek/studia/parp/PARP-23Z-projekt-prolog/src/giga.pl'].
?- ['/home/olek/studia/parp/PARP-23Z-projekt-prolog/src/giga.pl'].
true.

?- start.

Enter commands using standard Prolog syntax.
Available commands are:
start.             -- to start the game.
n.  s.  e.  w.     -- to go in that direction.
take(Object).      -- to pick up an object.
drop(Object).      -- to put down an object.
use(Object1, Object2). -- to use an Object1 on Object2.
open(Object).      -- to open Object if it's possible.
type_code(Object, code) -- to enter a 4 digit code into an Object
kick(Object)       -- to kick an Object
check_inventory.   -- to list the objects you are holding.
inspect(Object).   -- to inspect an object.
look.              -- to look around you again.
instructions.      -- to see this message again.
halt.              -- to end the game and quit.


A loud crashing sound wakes you up in you bed inside the engineering crew bedroom. You look around and see that the room is in a mess. A vent in the east corner of the room swings wide open. Blaring alarms can be heard from the main corridor on the south side. You see a locker, a desk and a bed. You need to act, fast.

You are at the crew bedroom.


There is one *bed* here.
There is one *desk* here.
There is one *locker* here.
There is one *security_door* here.
true.

?- inspect(bed).

There is nothing special on this bed, aside from a *thick_blanket*. I wonder if it could be useful later.

true.

?- take(thick_blanket).

You took the thick_blanket.

true.

?- s.

You can't go that way.
true.

?- w.

You went w

You crawl into a rather spatious crew bedroom vent. There it is! This is where you *desk_key* went! Good thing it didn't fall deeper or you would be stuck in here for ever.


There is one *desk_key* here.
There is one *space_latch* here.
true.

?- take(desk_key).

You took the desk_key.

true.

?- e.

You went e

You are in the crew bedroom, there is a security door on the south, and a vent entrance on the west.


There is one *desk* here.
There is one *locker* here.
There is one *security_door* here.
true.

?- use(desk_key, desk).

You unlock the desk with the key you found in the vent. Inside you see your *crew_access_card*.

true.

?- take(crew_access_card).

You took the crew_access_card.

true.

?- use(crew_access_card, security_door).

You swipe your crew access card on the security door and hear the metal latch inside loudly open. Good thing the electronics on the ship still work.

true.

?- open(security_door).

The security door, now unlocked, opens smoothly. In front of you, you see the main corridor shrouded in smoke.

true.

?- s.

You went s

You decide it's finally time to leave your quarters. Staying here definetely won't help you find out what's going on.
You enter the main corridor, but you can barely see anything. You can see the reason now why the alarms are going off.
A fire is raging only a few meters in front of you. 'Probably just an overcharged e-box' - your engineer's instinct tells you. However you still can't pass through it. You need to find a way to put it out.

Behind your back, at the west end, there is a supply cabinet, but the east end of the corridor lays behind the fire.


There is one *flaming_electric_box* here.
There is one *supply_cabinet* here.
true.

?- inspect(flaming_electric_box).

The electric box is on fire. You need to put it out somehow.

true.

?- use(thick_blanket, flaming_electric_box).

Why didn't you think about that earlier! Of course, suppressing the fire with this thick wooly blanket put it down.

The fire is down and you can finally go through, but your blanket is burnt to a crisp.

After the fire went down and the smoke cleared out a little bit, the rest of the corrdior becomes visibile, but you will look around later.
Finally you see someone alive! It's , Qaux'ods, *wounded_engineering_chief* from the planet Luzxore.
He is hurt, but he looks like he is trying to tell you something.


true.

?- talk(wounded_engineering_chief).

You: Hey, chief, are you okay? What happened?

Qaux'ods: ⟟⏁'⌇ ⊬⍜⎍ ⎎⟟⋏⏃⌰⌰⊬! ⌇⍜⋔⟒⏁⊑⟟⋏☌ ⊑⏃⌿⌿⟒⋏⎅! ⌰⟒⏁ ⋔⟒ ⊑⟒⌰⌿ ⊬⍜⎍!!!
You: I can't understand anything. God, if I only knew Luzxorian...

true.

?- look.

You are in the main corridor of the living section.


There is one *supply_cabinet* here.
There is one *electric_box* here.
There is one *south_corridor_exit_door* here.
There is one *wounded_engineering_chief* here.
There is one *cantine_entrance_door* here.
true.

?- inspect(supply_cabinet).

The supply cabinet is wrapped in a chain and locked with a padlock. There is now way there is a key here.

true.

?- n.

You went n

You are in the crew bedroom, there is a security door on the south, and a vent entrance on the west.


There is one *locker* here.
There is one *security_door* here.
true.

?- inspect(locker).

You look inside your locked hoping to find some of your tools.
Unfortunately, all of the electronic tools got damaged. However your trusty hammer only came apart. I bet you could stick the *hammer_head* and the *hammer_handle* togheter and fix it up.
true.

?- take(hammer_head).

You took the hammer_head.

true.

?- take(hammer_handle).

You took the hammer_handle.

true.

?- s.

You went s

You are in the main corridor of the living section.


There is one *supply_cabinet* here.
There is one *electric_box* here.
There is one *south_corridor_exit_door* here.
There is one *wounded_engineering_chief* here.
There is one *cantine_entrance_door* here.
true.

?- craft(hammer_head, hammer_handle).

Those two came togheter easily! Now you've got a full *hammer*!

true.

?- look.

You are in the main corridor of the living section.


There is one *supply_cabinet* here.
There is one *electric_box* here.
There is one *south_corridor_exit_door* here.
There is one *wounded_engineering_chief* here.
There is one *cantine_entrance_door* here.
true.

?- inspect(supply_cabinet).

The supply cabinet is wrapped in a chain and locked with a padlock. There is now way there is a key here.

true.

?- use(hammer, supply_cabinet).

Ah yes, brute force. Always a good solution.

After smashing the cabinet open with a hammer, you can look for anything useful that you can find inside.


true.

?- inspect(supply_cabinet).

Inside a heap of junk you find a *space_suit_gloves* and a *space_suit_jacket*. Those will definetly be useful.
There is also a *universal_speech_translator* here. It will come in handy if you encounter other crew members... or aliens.

true.

?- take(universal_speech_translator).

You took the universal_speech_translator.

true.

?- take(space_suit_gloves).

You took the space_suit_gloves.

true.

?- take(space_suit_jacket).

You took the space_suit_jacket.

true.

?- look.

You are in the main corridor of the living section.


There is one *electric_box* here.
There is one *south_corridor_exit_door* here.
There is one *wounded_engineering_chief* here.
There is one *cantine_entrance_door* here.
true.

?- use(universal_speech_translator, wounded_engineering_chief).

You point the pointy end of the translator at Qaux'ods and press the button. The translator starts to hum and glow.
It seems like it's working, maybe now you can talk to him.

true.

?- talk(wounded_engineering_chief).

You: Hey, chief, are you okay? What happened?

Qaux'ods: I'm not sure. I was in the cantine, eating grapes at table 9, when the ship started shaking. I ran out to see what's going on and I saw a bright flash of light.
The captain told me through the radio that something hit the ship, but as soon as he started explaining, the radio went silent.
I ran to the main corridor to see if I can help anyone, but I was hit by a piece of debris. I'm not sure how long I can hold on.

You: I'm sure I can help you somehow! We can get out of here togheter!

Qaux'ods: No, I'm afraid it's too late for me. You need to go on and survive. The ship took a heavy blow, it won't hold on for long.
Take my access card, it will open up my office, it will help you get to the escape pod. Get there and escape.
My cyber-key was shatterd when I fell in the initial impact, but here's a piece, maybe you can find the rest of it.

You: Thank you, chief. I will never forget what you've done for me.

Qaux'ods: It's nothing but my duty. Now go on, I need to rest.

An *engineering_chief_access_card* and a *cyber_key_handle* were added into your inventory.

true.

?- s.

You can't go that way.
true.

?- e.

You can't go that way.
true.

?- w.

You can't go that way.
true.

?- n.

You went n

You are in the crew bedroom, there is a security door on the south, and a vent entrance on the west.


There is one *security_door* here.
true.

?- s.

You went s

You are in the main corridor of the living section.


There is one *electric_box* here.
There is one *south_corridor_exit_door* here.
There is one *wounded_engineering_chief* here.
There is one *cantine_entrance_door* here.
true.

?- open(cantine_entrance_door).

The door swung open freely, you can now enter the cantine.

true.

?- e.

You went e


There is one *table_21* here.
There is one *table_8* here.
There is one *table_5* here.
There is one *table_12* here.
There is one *table_91* here.
There is one *table_9* here.
There is one *table_1* here.
There is one *table_34* here.
There is one *locked_safety_box* here.
true.

?- inspect(table_21).

You find some powdered scrambled eggs and a burnt toast. But nothing useful.

true.

?- inspect(table_8).

At this table there is some spilled gravy and a bowl of mashed potatos. Nothing useful though.

true.

?- inspect(table_5).

This table is empty. There is nothing here.

true.

?- inspect(table_12).

This table is empty. There is nothing here.

true.

?- inspect(table_91).

On this table there is nothing but little squared carrots and peas. Someone's a picky eater.

true.

?- inspect(table_9).

On this table you find some half-eaten grapes.
After searching on the ground, you see a *cyber_key_shaft* laying there.

true.

?- take(cyber_key_shaft).

You took the cyber_key_shaft.

true.

?- inspect(locked_safety_box).

You see a *locked_safety_box*, with wires on the control panel ripped apart.
It won't open right now, but maybe if you reconnect the wires you could open it.

There are 3 sockets and 3 cables. You need to connect them in the right order.
 Blue - b
 Red - r
 Yellow - y

Use the command box_wiring(cable1, cable2, cable3). to connect the wires.

true.

?- box_wiring(b,r,y).

Hmmm, that doesn't seem to be working.' Try again.

true.

?- box_wiring(y, b, r).

That's it! The wires crackled and the box opened! You should see what's inside.

true.

?- look.


There is one *table_21* here.
There is one *table_8* here.
There is one *table_5* here.
There is one *table_12* here.
There is one *table_91* here.
There is one *table_9* here.
There is one *table_1* here.
There is one *table_34* here.
There is one *open_safety_box* here.
true.

?- inspect(open_safety_box).

Inside the box you find a *cyber_key_head*! It payed off to fiddle with the cables.

true.

?- take(cyber_key_head).

You took the cyber_key_head.

true.

?- check_inventory.

You have one *desk_key* in your bag.

You have one *crew_access_card* in your bag.

You have one *hammer* in your bag.

You have one *universal_speech_translator* in your bag.

You have one *space_suit_gloves* in your bag.

You have one *space_suit_jacket* in your bag.

You have one *engineering_chief_access_card* in your bag.

You have one *cyber_key_handle* in your bag.

You have one *cyber_key_shaft* in your bag.

You have one *cyber_key_head* in your bag.
false.

?- craft(cyber_key_head, cyber_key_shaft, cyber_key_handle).

Hmm, seems almost right, maybe in a diffrent order?

true.

?- craft(cyber_key_handle, cyber_key_shaft, cyber_key_head).

You put the three pieces of the cyber key togheter and they magnetically snap into place.
Now you've got a full *cyber_key*!

true.

?- look.


There is one *table_21* here.
There is one *table_8* here.
There is one *table_5* here.
There is one *table_12* here.
There is one *table_91* here.
There is one *table_9* here.
There is one *table_1* here.
There is one *table_34* here.
There is one *open_safety_box* here.
true.

?- s.

You can't go that way.
true.

?- n.

You can't go that way.
true.

?- e.

You can't go that way.
true.

?- w.

You went w

You are in the main corridor of the living section.


There is one *electric_box* here.
There is one *south_corridor_exit_door* here.
There is one *wounded_engineering_chief* here.
There is one *cantine_entrance_door* here.
true.

?- s.

You can't go that way.
true.

?- open(south_corridor_exit_door).
The doors swung right open, they lead to the engine room, this is probably your only route to get out of here.
true.

?- s.

You went s
Damn, ship must have taken a really heavy blow, these engines look like they will explode in any second now.
Security protocol must have kicked in, because the bridge in the engine room is lifted to the ceeling, you need to find some way to lower it down.
Maybe this *control_panel* might help.

There is one *control_panel* here.
true.

?- use(cyber_key, control_panel).
The key seemes to fit perfectly, you hear a loud noise, and the bridge starts lowering down...
It is making a loud noise, engine room must have really taken a lot of damage.
SNAP! The bridge broke down, and fell to the bottom. On its way it made a hole in nearby vent.
After the bridge felt down, it left *bridge_gap* and opened entrance to the *nearby_vent*, that looks like it could be crawled into.

Hint: You can use crawl(Somwhere), to crawl inside of somehere!

There is one *nearby_vent* here.
There is one *bridge_gap* here.

true.

?- crawl(ds).
false.

?- inspect(bridge_gap).

It is what it is, nothing special about it.

true.

?- inspect(nearby_vent).

It is what it is, nothing special about it.

true.

?- crawl(nearby_vent).
You crawled into the vent, there are two directions. One leads east and the other west.
true.

?- w.

You went w
You crawled to the *vent_cover*, check whats behind it.

true.

?- e.

You went e
I can *exit_vent*, or go only in two directions from here, weast and east.

true.

?- e.

You went e
Vent gets too narrow in here, I should probably try the other way.

true.

?- w.

You went w
I can *exit_vent*, or go only in two directions from here, weast and east.

true.

?- w.

You went w
You crawled to the *vent_cover*, check whats behind it.

true.

?- inspect(vent_cover).

There is no vent_cover here.
true.

?- inspect(vent_cover).

There is no vent_cover here.
true.

?- e.

You went e
I can *exit_vent*, or go only in two directions from here, weast and east.

true.

?- w.

You went w
You crawled to the *vent_cover*, check whats behind it.

true.

?- kick(vent_cover).
You kicked the vent cover with all your might, and it fell down. The futher path west is no longer obstructed.
true.

?- look.
You crawled to the vent cover that you kick opened.

true.

?- w.

You went w
You are in the service room, It was used by ships technicians.

There is one *window* here.
There is one *locker_1* here.
There is one *locker_2* here.
There is one *locker_3* here.
There is one *locked_crate* here.
There is one *service_room_doors* here.
There is one *service_room_vent* here.
true.

?- inspect(window).
You look through the window, and you see the *ladder* laying just outside the space latch. It might be of some use to you.
true.

?- inspect(locker_1).
Just some junk... but wait there is some *schematic* laying here as well.
true.

?- inspect(locker_2).
Nothing in here. Some nuts and bolts...
true.

?- inspect(locker_3).
Huh?, a *uv_flashlight*, maybe It will be of some use.
true.

?- look.
You are in the service room, It was used by ships technicians.

There is one *window* here.
There is one *locked_crate* here.
There is one *service_room_doors* here.
There is one *service_room_vent* here.
There is one *schematic* here.
There is one *uv_flashlight* here.
true.

?- take(schematic).

You can't pick up the schematic.

true.

?- inspect(schematic).
Space suit assebly guide:
Required parts: *space_suit_trousers*, *space_suit_jacket*, *space_suit_gloves*, *space_suit_helmet*.
true.

?- take(uv_flashlight).

You took the uv_flashlight.

true.

?- inspect(locked_crate).
It has an electronic lock on, that required 4 digits. You can try to guess it, but without some info it will can be a tedious task. `type_code(locked_create, *your code*)`
true.

?- look.
You are in the service room, It was used by ships technicians.

There is one *window* here.
There is one *locked_crate* here.
There is one *service_room_doors* here.
There is one *service_room_vent* here.
There is one *schematic* here.
true.

?- type_code(locked_crate, 2222)
|    .
Wrong code.
true.

?- use(uv_flashlight, locked_crate).
You shine the flashlight on the crate, and you see some fingerprints on the 9 and 1 buttons.
true.

?- type_code(locked_crate, 9111).
Wrong code.
true.

?- type_code(locked_crate, 9911).
Nice!. The code worked. Inside lays a *space_suit_trousers* and *space_suit_helmet*.
true.

?- take(space_suit_trousers).

You took the space_suit_trousers.

true.

?- take(space_suit_helmet).

You took the space_suit_helmet.

true.

?- inspect(schematic).
Space suit assebly guide:
Required parts: *space_suit_trousers*, *space_suit_jacket*, *space_suit_gloves*, *space_suit_helmet*.
true.

?- check_inventory.

You have one *desk_key* in your bag.

You have one *crew_access_card* in your bag.

You have one *hammer* in your bag.

You have one *universal_speech_translator* in your bag.

You have one *space_suit_gloves* in your bag.

You have one *space_suit_jacket* in your bag.

You have one *engineering_chief_access_card* in your bag.

You have one *uv_flashlight* in your bag.

You have one *space_suit_trousers* in your bag.

You have one *space_suit_helmet* in your bag.
false.

?- craft(space_suit_trousers, space_suit_jacket, space_suit_gloves, space_suit_helmet).

You put all the pieces togheter, and you have a full *space_suit*. Now it is safe for you to walk in the outer space.

?- look.
You are in the service room, It was used by ships technicians.

There is one *window* here.
There is one *service_room_doors* here.
There is one *service_room_vent* here.
There is one *schematic* here.
true.

?- crawl(service_room_vent).
You crawled back into the vent.
true.

?- e.

You went e
I can *exit_vent*, or go only in two directions from here, weast and east.

true.

?- exit_vent.
You crawled back into the engine room.
true.

?- look.
After the bridge felt down, it left *bridge_gap* and opened entrance to the *nearby_vent*, that looks like it could be crawled into.

Hint: You can use crawl(Somwhere), to crawl inside of somehere!

There is one *nearby_vent* here.
There is one *bridge_gap* here.
true.

?- n.

You went n

You are in the main corridor of the living section.


There is one *electric_box* here.
There is one *south_corridor_exit_door* here.
There is one *wounded_engineering_chief* here.
There is one *cantine_entrance_door* here.
true.

?- n.

You went n

You are in the crew bedroom, there is a security door on the south, and a vent entrance on the west.


There is one *security_door* here.
true.

?- look.

You are in the crew bedroom, there is a security door on the south, and a vent entrance on the west.


There is one *security_door* here.
true.

?- w.

You went w

You crawl into a rather spatious crew bedroom vent. There it is! This is where you *desk_key* went! Good thing it didn't fall deeper or you would be stuck in here for ever.


There is one *space_latch* here.
true.

?- open(space_latch).

Suited up, you open the space latch, you can now go outside to the void. However if you do, you better find another latch quickly.

true.

?- look.

You crawl into a rather spatious crew bedroom vent. There it is! This is where you *desk_key* went! Good thing it didn't fall deeper or you would be stuck in here for ever.


There is one *space_latch* here.
true.

?- w.

You went w
From the outside you can really see the scale of the destruction, something must have hit the ship really hard.

There is one *ladder* here.
true.

?- take(ladder).

You took the ladder.

true.

?- e.

You can't go that way.
true.

?- look.
From the outside you can really see the scale of the destruction, something must have hit the ship really hard.

true.

?- w.

You went w

You crawl into a rather spatious crew bedroom vent. There it is! This is where you *desk_key* went! Good thing it didn't fall deeper or you would be stuck in here for ever.


There is one *space_latch* here.
true.

?- e.

You went e

You are in the crew bedroom, there is a security door on the south, and a vent entrance on the west.


There is one *security_door* here.
true.

?- s.

You went s

You are in the main corridor of the living section.


There is one *electric_box* here.
There is one *south_corridor_exit_door* here.
There is one *wounded_engineering_chief* here.
There is one *cantine_entrance_door* here.
true.

?- s.

You went s
After the bridge felt down, it left *bridge_gap* and opened entrance to the *nearby_vent*, that looks like it could be crawled into.

Hint: You can use crawl(Somwhere), to crawl inside of somehere!

There is one *nearby_vent* here.
There is one *bridge_gap* here.
true.

?- use(ladder, bridge_gap).
You put the ladder in the gap, and you can now cross the bridge to the east.
true.

?- e.

You went e
The workshop is where most engineering on the station happens.It's dark, with the ocasional sparks flying out from damaged equipment
There is a door leading north into the engineering chief's office and a path south.
A black mass is blocking the path south

There is one *black_sludge* here.
There is one *engineering_chief_office_door* here.
There is one *toolbox* here.
There is one *workshop_window* here.
There is one *small_fire* here.
There is one *table* here.
true.

?- inspect(black_sludge).
A strange black mass near the *workshop_window* blocks the path south. It pulsates slightly, as if breathing.
Underneath it you see one of your collegues being slowly absorbed by what you assume to be some kind of alien intruder.
A familiar smell of fuel fumes seems to be eminating from the creature.
true.

?- inspect(workshop_window).
You look at the window and into space. You see pieces of debris coming from the ship as well as some strange black round objects you can't identify
Can be broken with enough force. Last time this happened 2 workers got sucked out into space
true.

?- inspect(table).
An old wooden table. One of its legs seems to be barely holding on.You might be able to detach it if you had the proper tool
true.

?- inspect(toolbox).
Standard-issue toolbox. Some tools seem to be missing but you see some *electrical_tools* and a *hand_saw*.The saw seems to be covered in rust, but it might be good for a single use.
They may be useful later so you decide to take them.
true.

?- take(electrical_tools).

You're already holding it!
true.

?- take(hand_saw).

You're already holding it!
true.

?- inspect(small_fire).
A small electical fire seems to have broken out in the corner of the room
true.

?- look.
The workshop is where most engineering on the station happens.It's dark, with the ocasional sparks flying out from damaged equipment
There is a door leading north into the engineering chief's office and a path south.
A black mass is blocking the path south

There is one *engineering_chief_office_door* here.
There is one *workshop_window* here.
There is one *small_fire* here.
There is one *table* here.
There is one *alien_mass* here.
true.

?- look.
The workshop is where most engineering on the station happens.It's dark, with the ocasional sparks flying out from damaged equipment
There is a door leading north into the engineering chief's office and a path south.
A black mass is blocking the path south

There is one *engineering_chief_office_door* here.
There is one *workshop_window* here.
There is one *small_fire* here.
There is one *table* here.
There is one *alien_mass* here.
true.

?- inspect(alien_mass).
The mass blocking the path next to the *workshop_window* pulsates slowly.
You still feel the fumes similar to rocket fuel. It migth be flammable
true.

?- open(engineering_chief_office_door).
cannot open
true.

?- inspect(engineering_chief_office_door).
The door to the chief's office, locked by an access card
true.

?- check_inventory.

You have one *desk_key* in your bag.

You have one *crew_access_card* in your bag.

You have one *hammer* in your bag.

You have one *universal_speech_translator* in your bag.

You have one *engineering_chief_access_card* in your bag.

You have one *uv_flashlight* in your bag.

You have one *space_suit* in your bag.

You have one *electrical_tools* in your bag.

You have one *hand_saw* in your bag.
false.

?- use(hand_saw, table).
You manage to sever the loose leg with your saw. The second the leg comes off the saw breaks.You take the *wooden_table_leg*
true.

?- use(hammer, workshop_window).
The hammer bounces off the reinforced glass. You're going to need something heavier
true.

?- use(wooden_table_leg, workshop_window).

You can't figure out how to use the wooden_table_leg on the workshop_window.

true.

?- look.
The workshop is where most engineering on the station happens.It's dark, with the ocasional sparks flying out from damaged equipment
There is a door leading north into the engineering chief's office and a path south.
A black mass is blocking the path south

There is one *engineering_chief_office_door* here.
There is one *workshop_window* here.
There is one *small_fire* here.
There is one *alien_mass* here.
true.

?- s.

You can't go that way.
true.

?- n.

You can't go that way.
true.

?- e.

You can't go that way.
true.

?- w.

You went w
You are in the engine room and ladder is covering the gap in the bridge, go south to cross it.

There is one *nearby_vent* here.
true.

?- e.

You went e
The workshop is where most engineering on the station happens.It's dark, with the ocasional sparks flying out from damaged equipment
There is a door leading north into the engineering chief's office and a path south.
A black mass is blocking the path south

There is one *engineering_chief_office_door* here.
There is one *workshop_window* here.
There is one *small_fire* here.
There is one *alien_mass* here.
true.

?- use(wooden_table_leg, small_fire).
You put the table leg near the fire and wait for the end of it to catch on fire
You create a *makeshift_torch*
true.

?- use(makeshift_torch, alien_mass).
You set the alien mass on fire, clearing the path south into the escape pod bay
The mass slowly burns away, leaving only the partly-digested corpse of one of your coworkers


true.

?- look.
The workshop is where most engineering on the station happens.It's dark, with the ocasional sparks flying out from damaged equipment
There is a door leading north into the engineering chief's office and a path south.


There is one *engineering_chief_office_door* here.
There is one *workshop_window* here.
There is one *small_fire* here.
true.

?- s.

You went s
This room is designed to hold the emergency evacuation modules for the engineering staff.
All of them have either already been deployed, or are now covered in an alien, dark grey substance similar to the one that blocked the entrance to this room.
All except for one. You have to move fast.
The pods must first be lowered using the console.Then, once inside one of the pods, access to launch has to be granted by entering a code known to the managers of a given branch of the station.

There is one *broken_console* here.
true.

?- inspect(broken_console).
A console used for lowering the escape pods, broken. Looks like it short-circuted.
You spot some black matter between the wires. This must be what caused the break.
Needs specialised tools to be fixed
true.

?- use(electrical_tools, broken_console).
You manage to fix the console and use it to lower down the remaining escape pod
You can now access the *escape_pod_launch_console* inside the pod and get out of here.

true.

?- look.
This room is designed to hold the emergency evacuation modules for the engineering staff.
All of them have either already been deployed, or are now covered in an alien, dark grey substance similar to the one that blocked the entrance to this room.
All except for one. You have to move fast.
The pods must first be lowered using the console.Then, once inside one of the pods, access to launch has to be granted by entering a code known to the managers of a given branch of the station.

There is one *escape_pod_launch_console* here.
true.

?- inspect(escape_pod_launch_console).
Inside the pod is a big screen with a prompt that reads:
PLEASE ENTER LAUNCH AUTHORISATION CODE TO INITIATE LAUNCH SEQUENCE


true.

?- dsfsd.
ERROR: Undefined procedure: dsfsd/0 (DWIM could not correct goal)
?- look.
This room is designed to hold the emergency evacuation modules for the engineering staff.
All of them have either already been deployed, or are now covered in an alien, dark grey substance similar to the one that blocked the entrance to this room.
All except for one. You have to move fast.
The pods must first be lowered using the console.Then, once inside one of the pods, access to launch has to be granted by entering a code known to the managers of a given branch of the station.

There is one *escape_pod_launch_console* here.
true.

?- n.

You went n
The workshop is where most engineering on the station happens.It's dark, with the ocasional sparks flying out from damaged equipment
There is a door leading north into the engineering chief's office and a path south.


There is one *engineering_chief_office_door* here.
There is one *workshop_window* here.
There is one *small_fire* here.
true.

?- check_inventory.

You have one *desk_key* in your bag.

You have one *crew_access_card* in your bag.

You have one *hammer* in your bag.

You have one *universal_speech_translator* in your bag.

You have one *engineering_chief_access_card* in your bag.

You have one *uv_flashlight* in your bag.

You have one *space_suit* in your bag.

You have one *electrical_tools* in your bag.
false.

?- use(engineering_chief_access_card, engineering_chief_office_door).
You slide the card through the reader and the door opens automatically, revealing an office in dissaray
true.

?- look.
The workshop is where most engineering on the station happens.It's dark, with the ocasional sparks flying out from damaged equipment
There is a door leading north into the engineering chief's office and a path south.


There is one *engineering_chief_office_door* here.
There is one *workshop_window* here.
There is one *small_fire* here.
true.

?- s.

You went s
This room is designed to hold the emergency evacuation modules for the engineering staff.
All of them have either already been deployed, or are now covered in an alien, dark grey substance similar to the one that blocked the entrance to this room.
All except for one. You have to move fast.
The pods must first be lowered using the console.Then, once inside one of the pods, access to launch has to be granted by entering a code known to the managers of a given branch of the station.

There is one *escape_pod_launch_console* here.
true.

?- n.

You went n
The workshop is where most engineering on the station happens.It's dark, with the ocasional sparks flying out from damaged equipment
There is a door leading north into the engineering chief's office and a path south.


There is one *engineering_chief_office_door* here.
There is one *workshop_window* here.
There is one *small_fire* here.
true.

?- e.

You can't go that way.
true.

?- w.

You went w
You are in the engine room and ladder is covering the gap in the bridge, go south to cross it.

There is one *nearby_vent* here.
true.

?- e.

You went e
The workshop is where most engineering on the station happens.It's dark, with the ocasional sparks flying out from damaged equipment
There is a door leading north into the engineering chief's office and a path south.


There is one *engineering_chief_office_door* here.
There is one *workshop_window* here.
There is one *small_fire* here.
true.

?- open(engineering_chief_office_door).
cannot open
true.

?- look.
The workshop is where most engineering on the station happens.It's dark, with the ocasional sparks flying out from damaged equipment
There is a door leading north into the engineering chief's office and a path south.


There is one *engineering_chief_office_door* here.
There is one *workshop_window* here.
There is one *small_fire* here.
true.

?- n.

You went n
The office is in heavy dissaray. An open computer sits on the desk. Next to one of the bookshelves lays a broken glass table.
Something heavy must've fallen on it from one of the shelves.

There is one *computer* here.
There is one *metal_statue* here.
true.

?- inspect(computer).
You open the computer sitting on the desk.
You find an open email titled ESCAPE POD CODE UPDATE:
Hi, Qaux'ods, please remember about the annual escape pod tests.
We've changed all the codes to *1867* for this week to make the process easier. Please have the report done by next week. Cheers.
true.

?- inspect(metal_statue).
A heavy metal statue seems to have fallen down from one of the shelves and broken through a glass table.
It's just small enough for you to pick up and seems to be some kind of award given to the engineering chief.
true.

?- take(metal_statue).

You took the metal_statue.

true.

?- s.

You went s
The workshop is where most engineering on the station happens.It's dark, with the ocasional sparks flying out from damaged equipment
There is a door leading north into the engineering chief's office and a path south.


There is one *engineering_chief_office_door* here.
There is one *workshop_window* here.
There is one *small_fire* here.
true.

?- s.

You went s
This room is designed to hold the emergency evacuation modules for the engineering staff.
All of them have either already been deployed, or are now covered in an alien, dark grey substance similar to the one that blocked the entrance to this room.
All except for one. You have to move fast.
The pods must first be lowered using the console.Then, once inside one of the pods, access to launch has to be granted by entering a code known to the managers of a given branch of the station.

There is one *escape_pod_launch_console* here.
true.

?- n.

You went n
The workshop is where most engineering on the station happens.It's dark, with the ocasional sparks flying out from damaged equipment
There is a door leading north into the engineering chief's office and a path south.


There is one *engineering_chief_office_door* here.
There is one *workshop_window* here.
There is one *small_fire* here.
true.

?- use(metal_statue, workshop_window).
You hurl the statue at the window, breaking it.The air begins to get sucked out the room at an incredible speed. The fire goes out.You quickly grab onto the nearest pipe and the space suit lets you survive the pressure drop and lack of oxygenAll loose objects in the room fly out of the windowand the alien mass gets sucked out with them, leaving the path south clear.
true.

?- s.

You went s
This room is designed to hold the emergency evacuation modules for the engineering staff.
All of them have either already been deployed, or are now covered in an alien, dark grey substance similar to the one that blocked the entrance to this room.
All except for one. You have to move fast.
The pods must first be lowered using the console.Then, once inside one of the pods, access to launch has to be granted by entering a code known to the managers of a given branch of the station.

There is one *escape_pod_launch_console* here.
true.

?- inspect(escape_pod_launch_console).
Inside the pod is a big screen with a prompt that reads:
PLEASE ENTER LAUNCH AUTHORISATION CODE TO INITIATE LAUNCH SEQUENCE


true.

?- type_code(escape_pod_launch_console, 1867).
You punch in the code. The door to the pod closes behind you and you hear a robotic voice come from the console:
Voice: Launch sequence initiated. Please take a seat and fasten your seatbelts.
You sit down and hope for the best.
After a 20 second countdown the pod begins to shake and propels itself out of the station.

You made it. As you're leaving the station you see the ship is covered in a moving blanket of black material.
You live to tell the tale. You try contacting the closest colony and explain the situation. You get permission for emergency landing.

Congratulations! You managed to escape the station!
The game is over. Please enter the "halt." command.

true.

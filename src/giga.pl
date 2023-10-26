% ============= funkcjonalne=====================
:- (dynamic i_am_at/1, at/2, have/1, path/3, pickable/1, locked/1, progress_point/1, talkable/1, talked_to/1).
:- retractall(at(_, _)),
   retractall(i_am_at(_)),
   retractall(alive(_)).
:- discontiguous i_am_at/1, at/2, have/1, path/3, pickable/1, describe/1,
    inspectable/1, inspect/1, locked/1, open/1, use/2, progress_point/1, talkable/1, talked_to/1.

progress_point(intro).

take(X) :-
    have(X),
    nl, write('You\'re already holding it!'), !,
    nl.

take(X) :-
    i_am_at(Place),
    at(X, Place),
    pickable(X),
    retract(at(X, Place)),
    assert(have(X)),
    nl, write('You took the '),
    write(X),
    write('.'),
    nl, !,
    nl.

take(X) :-
    i_am_at(Place),
    at(X, Place),
    nl, write('You can''t pick up the '), write(X), write('.'), nl,
        !, nl.

take(_) :-
    nl, write('I don\'t see it here.'),
    nl.


/* These rules describe how to put down an object. */
drop(X) :-
    have(X),
    i_am_at(Place),
    retract(have(X)),
    assert(at(X, Place)),
    nl, write('You dropped the '),
    write(X),
    write('.'),
    nl, !,
    nl.

drop(_) :-
    nl, write('You aren\'t have it!'),
    nl.

% shortcuts for go
n :-
    go(n).

s :-
    go(s).

e :-
    go(e).

w :-
    go(w).


%  This rule tells how to move in a given direction.
go(Direction) :-
    i_am_at(Here),
    path(Here, Direction, There),
    retract(i_am_at(Here)),
    assert(i_am_at(There)), !,
    nl, write("You went "),
    write(Direction), write(". "), nl,
    nl,
    look.

go(_) :-
    nl, write("You can't go that way.").

% look logic
look:-
    i_am_at(Place),
    describe(Place),
    nl,
    notice_objects_at(Place).


% notice objects at places
notice_objects_at(Place) :-
    at(X, Place),
    write("There is a/an *"),
    write(X),
    write("* here."),
    nl,
    fail.

notice_objects_at(_).

check_inventory() :-
    have(X),
    nl, write('You have one *'), write(X), write('* in your bag.'), nl,
    fail.

check_inventory().


/* This rule tells how to die. */

die :-
    finish.


finish :-
    nl,
    write('The game is over. Please enter the "halt." command.'),
    nl.

/* This rule just writes out game instructions. */

instructions :-
    nl,
    write('Enter commands using standard Prolog syntax.'), nl,
    write('Available commands are:'), nl,
    write('start.             -- to start the game.'), nl,
    write('n.  s.  e.  w.     -- to go in that direction.'), nl,
    write('take(Object).      -- to pick up an object.'), nl,
    write('drop(Object).      -- to put down an object.'), nl,
    write('use(Object1, Object2). -- to use an Object1 on Object2.'), nl,
    write('open(Object).      -- to open Object if it''s possible.'), nl,
    write('check_inventory.   -- to list the objects you are holding.'), nl,
    write('inspect(Object).   -- to inspect an object.'), nl,
    write('look.              -- to look around you again.'), nl,
    write('instructions.      -- to see this message again.'), nl,
    write('halt.              -- to end the game and quit.'), nl,
    nl.

start :-
    instructions,
    look.





% ===============================================





% =================jedrek===================================
% My location
i_am_at(crew_bedroom).

% Descriptions

% crew_bedroom
describe(crew_bedroom):-
    progress_point(intro),
    nl, write("A loud crashing sound wakes you up in you bed inside the engineering crew bedroom. You look around and see that the room is in a mess. A vent in the east corner of the room swings wide open. Blaring alarms can be heard from the main corridor on the south side. You see a locker, a desk and a bed. You need to act, fast."), nl, nl,
    write("You are at the crew bedroom."), nl, nl,
    retract(progress_point(intro)),
    assert(progress_point(main_c)), !.

describe(crew_bedroom):-
    nl, write("You are back in the crew bedroom, there is a security door on the south, and a vent entrance on the east."), nl, !, nl.

% crew_bedroom_vent
describe(crew_bedroom_vent):-
    nl, write("You crawl into a rather spatious crew bedroom vent. There it is! This is where you *desk_key* went! Good thing it didn\'t fall deeper or you would be stuck in here for ever."), nl, !, nl.

% main_corridor
describe(main_corridor):-
    progress_point(main_c),
    nl, write("You decide it\'s finally time to leave your quarters. Staying here definetely won\'nt help you find out what\'s going on. "), nl, write("You enter the main corridor, but you can barely see anything. You can see the reason now why the alarms are going off. "), nl, write("A fire is raging only a few meters in front of you.\'Probably just an overcharged electric box\' - your engineer\'s instinct tells you. However you still can\'t pass through it. You need to find a way to put it out."), nl, nl,
    write("Behind your back, at the east end, there is a supply cabinet, but the west end of the corridor lays behind the fire. "), nl,
    retract(progress_point(main_c)),
    assert(progress_point(todo)), !, nl.

describe(main_corridor):-
    nl, write("You enter the main corridor once again."), nl, !, nl.




% Crafting
craft(hammer_head, hammer_handle):-
    have(hammer_head),
    have(hammer_handle),
    retract(have(hammer_head)),
    retract(have(hammer_handle)),
    assert(have(hammer)),
    nl, write("Those two came togheter easily! Now you\'ve got a full *hammer*!"), nl, !, nl.



% Crew Bedroom ================================================================

% Paths at crew_bedroom
% crew_bedroom n<=>s main_corridor
% has to be unlocked

% crew_bedroom w<=>e crew_bedroom_vent
path(crew_bedroom, e, crew_bedroom_vent).
path(crew_bedroom_vent, w, crew_bedroom).


% Objects at crew_bedroom
at(bed, crew_bedroom).
at(desk, crew_bedroom).
locked(desk).
at(locker, crew_bedroom).

at(security_door, crew_bedroom).
locked(security_door).

% Use cases - Crew Bedroom
use(crew_access_card, security_door):-
    have(crew_access_card),
    locked(security_door),
    retract(locked(security_door)),
    nl, write("You swipe your crew access card on the security door and hear the metal latch inside loudly open. Good thing the electronics on the ship still work."), nl, !, nl.

use(crew_access_card, security_door):-
    have(crew_access_card),
    nl, write("The security door is already unlocked."), nl, !, nl.

open(security_door):-
    locked(security_door),
    nl, write("The security door is locked. It won\'t budge."), nl, !, nl.

open(security_door):-
    nl, write("The security door, now unlocked, opens smoothly. In front of you you see the main corridor shrouded in smoke."), nl,
    assert(path(crew_bedroom, s, main_corridor)),
    assert(path(main_corridor, n, crew_bedroom)),
    !, nl.

use(desk_key, desk):-
    have(desk_key),
    locked(desk),
    retract(locked(desk)),
    retract(at(desk, crew_bedroom)),
    assert(at(crew_access_card, crew_bedroom)),
    assert(pickable(crew_access_card)),
    nl, write("You unlock the desk with the key you found in the vent. Inside you see your *crew_access_card*."), nl, !, nl.


% Inspects - Crew Bedroom
inspect(bed):-
    nl, write("There is nothing special on this bed, aside from a *thick_blanket*. I wonder if it could be useful later."), nl,
    assert(at(thick_blanket, crew_bedroom)),
    assert(pickable(thick_blanket)),
    retract(at(bed, crew_bedroom)),
    !, nl.

inspect(desk):-
    locked(desk),
    nl, write("The desk is locked. There should be a key on it, but maybe it flew somewhere during the crash."), nl, !, nl.

inspect(locker):-
    nl, write("You look inside your locked hoping to find some of your tools. "),
    nl, write("Unfortunately, all of the electronic tools got damaged. However your trusty hammer only came apart. I bet you could stick the *hammer_head* and the *hammer_handle* togheter and fix it up."),
    assert(at(hammer_head, crew_bedroom)),
    assert(at(hammer_handle, crew_bedroom)),
    assert(pickable(hammer_head)),
    assert(pickable(hammer_handle)),
    retract(at(locker, crew_bedroom)),
    !, nl.

inspect(security_door):-
    locked(security_door),
    nl, write("The door leading out of your room to the main corridor remains locked. You need your own *crew_access_card* to unlock it."), nl, !, nl.

inspect(security_door):-
    nl, write("The door leading out of your room to the main corridor is unlocked. You can now go to the main corridor."), nl, !, nl.

% ====================================================

% Crew Bedroom Vent
at(desk_key, crew_bedroom_vent).
pickable(desk_key).

at(space_latch, crew_bedroom_vent).

% Paths at crew_bedroom_vent
path(void, w, crew_bedroom_vent).


% Inspects - Crew Bedroom Vent
inspect(space_latch):-
    have(space_suit),
    nl, write("With a *space_suit* you can exit through the space_latch and traverse from one point on the ship to another quickly, and avoid a lot of obstacles!"), nl,
    !, nl.

inspect(space_latch):-
    nl, write("This space latch is a way outside the ship. However, going through it without proper equipment may end very poorly for you."), nl, !, nl.

open(space_latch):-
    have(space_suit),
    nl, write("Suited up, you open the space latch, you can now go outside to the void. However if you do, you better find another latch quickly."), nl,
    assert(path(crew_bedroom_vent, e, void)),
    !, nl.

open(space_latch):-
    nl, write("You open the space latch and enter the void outside of the ship. Going out there without proper equipment was not your brightest idea... You feel the air being sucked out of your lungs. You die."), nl,
    die,
    !, nl.

% ====================================================

% Main Corridor
at(flaming_electric_box, main_corridor).

at(supply_cabinet, main_corridor).
locked(supply_cabinet).


% Inspects - Main Corridor
inspect(flaming_electric_box):-
    nl, write("The electric box is on fire. You need to put it out somehow."), nl, !, nl.

inspect(supply_cabinet):-
    locked(supply_cabinet),
    nl, write("The supply cabinet is wrapped in a chain and locked with a padlock. There is now way there is a key here."), nl,
    write("But maybe you can somehow force your way inside..."), nl, !, nl.

inspect(supply_cabinet):-
    nl, write("Inside a heap of junk you find a *right_space_suit_glove* and a *space_suit_jacket*. Those will definetly be usefull."), nl,
    write("There is also a *universal_speech_translator* here. It will come in handy if you encounter other crew members... or aliens."), nl,
    assert(at(right_space_suit_glove, main_corridor)),
    assert(at(space_suit_jacket, main_corridor)),
    assert(at(universal_speech_translator, main_corridor)),
    !.

extend_env_main_c :-
    % Create the reset of the corridor
    assert(at(west_corridor_exit_door, main_corridor)),
    assert(locked(west_corridor_exit_door)),

    assert(at(wounded_engineering_chief, main_corridor)),

    assert(at(cantine_entrance_door, main_corridor)),
    nl, write("After the fire went down and the smoke cleared out a little bit, the rest of the corrdior becomes visibile."), nl,
    write("Finally you see someone alive! It\'s the chief of your engineering crew, Qaux\'ods from the planet Luzxore."), nl,
    write("He is wounded, but he looks like he is trying to tell you something."),
    nl, !, nl.

% Use cases - Main Corridor

use(hammer, supply_cabinet):-
    nl, write("Ah yes, brutal force, always a good solution."), nl,
    nl, write("After smashing the cabinet open with a hammer, you get a look at what usefull you can find inside."), nl,
    retract(locked(supply_cabinet)), nl, !, nl.



use(thick_blanket, flaming_electric_box):-
    have(thick_blanket),
    retract(at(flaming_electric_box, main_corridor)),
    assert(at(electric_box, main_corridor)),
    nl, write("Why didn\'t you think about that earlier! Of course, suppressing the fire with this thick wooly blanket put it down."), nl,
    nl, write("The fire is down and you can finally go through, but your blanket is burnt to a crisp."), nl,
    retract(have(thick_blanket)),
    extend_env_main_c,
    !, nl.

use(universal_speech_translator, wounded_engineering_chief):-
    talkable(wounded_engineering_chief),
    have(universal_speech_translator),
    nl, write("It seems like your speech translator already picked up on Luzxorian. You should already be able to talk to the chief."),
    !, nl.

use(universal_speech_translator, wounded_engineering_chief):-
    have(universal_speech_translator),
    nl, write("You point the pointy end of the translator at Qaux\'ods and press the button. The translator starts to hum and glow."), nl,
    write("It seems like it\'s working, maybe now you can talk to him."), nl,
    assert(talkable(wounded_engineering_chief)),
    !, nl.

talk(wounded_engineering_chief):-
    talked_to(wounded_engineering_chief),
    talkable(wounded_engineering_chief),
    nl, write("Qaux\'ods: I\'ve already told you all I could. Now go on young one, survive, there is nothing you can do for me now."), nl,
    !, nl.

talk(wounded_engineering_chief):-
    talkable(wounded_engineering_chief),
    nl, write("You: Hey, chief, are you okay? What happened?"), nl,
    write("Qaux\'ods: I\'m not sure. I was in the cantine when the ship started shaking. I ran out to see what\'s going on and I saw a bright flash of light."), nl,
    write("The captain told me through the radio (plot subjectible to change) that the ship was struck by some kind of an object, but as soon as he started explaining, the radio went silent."), nl,
    write("I ran to the main corridor to see if I can help anyone, but I was hit by a piece of debris. I\'m not sure how long I can hold on."), nl,
    write("You: I\'m sure I can help you somehow! We can get out of here togheter!"), nl,
    write("Qaux\'ods: No, I\'m afraid it\'s too late for me. You need to go on and survive. The ship took a heavy blow, it won't hold on for long."), nl,
    write("Take my access card, it will open up the escape pod control room. Get there and escape."), nl,
    write("My cyber-key was shatterd when I fell in the initial impact, but here\'s a piece, maybe you can find the rest of it."), nl,
    write("You: Thank you, chief. I will never forget what you\'ve done for me."), nl,
    write("Qaux\'ods: It\'s nothing but my duty. Now go on, I need to rest."), nl, nl,
    assert(have(engineering_chief_access_card)),
    assert(have(cyber_key_handle)),
    assert(talked_to(wounded_engineering_chief)),
    write("An *engineering_chief_access_card* and a *cyber_key_handle* were added into your inventory."),
    !, nl.

talk(wounded_engineering_chief):-
    nl, write("You: Hey, chief, are you okay? What happened?"), nl,
    nl, write("Qaux\'ods: ⟟⏁'⌇ ⊬⍜⎍ ⎎⟟⋏⏃⌰⌰⊬! ⌇⍜⋔⟒⏁⊑⟟⋏☌ ⊑⏃⌿⌿⟒⋏⎅! ⌰⟒⏁ ⋔⟒ ⊑⟒⌰⌿ ⊬⍜⎍!!!"),
    nl, write("You: I can\'t understand anything. God, if I only knew Luzxorian..."), nl, !, nl.





% =================jedrek===================================



% =================olek===================================
%i_am_at(bridge).
path(bridge, n, void).
at(bridge, vent). % at(thing, place) btw
inspectable(vent).


describe(bridge) :-
    write("You are at the bridge. You see a vent in the north corner of the room."), nl, !, nl.

inspect(vent) :-
    assert(i_am_at(vent)),
    write("It seems to be really high, should i *jump* in?"), !,
    nl.

jump(vent) :-
    i_am_at(vent),
    assert(i_am_at(garbage_room)),
    write("You jumped in!"), !,
    look.

% =================olek===================================




% =================michal===================================
/* starts in workshop. */
% path(cargo_bay, w, escape_pod)
/* the player goes into the last sector,
Objectives:
1. put out the fire in the corridor between the workshop area and cargo bay
OR find space suit and then vent the room of air.


2. Find the last piece of a code for something in section 2

 3. fix broken escape pod control console
 4. Escape


 Workshop:
    - Wardrobe with space suit that's opened with item from some previous sector
    - Toolbox (closed, unlocked):
        - Electrical tools
    - Path to Spacewalk airlock
    - Window
    -
 */






% =================michal===================================


describe(_) :-
    nl.
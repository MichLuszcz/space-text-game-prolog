% ============= funkcjonalne=====================
:- (dynamic i_am_at/1, at/2, have/1, path/3, pickable/1, locked/1).
:- retractall(at(_, _)),
   retractall(i_am_at(_)),
   retractall(alive(_)).
:- discontiguous i_am_at/1, at/2, have/1, path/3, pickable/1, describe/1,
    inspectable/1, inspect/1, locked/1, open/1, use/2.

take(X) :-
    have(X),
    write('You\'re already holding it!'), !,
    nl.

take(X) :-
    i_am_at(Place),
    at(X, Place),
    pickable(X),
    retract(at(X, Place)),
    assert(have(X)),
    write('You took the '),
    write(X),
    write('.'),
    nl, !,
    nl.

take(X) :-
    i_am_at(Place),
    at(X, Place),
    write('You can''t pick up the '), write(X), write('.'), nl,
        !, nl.

take(_) :-
    write('I don\'t see it here.'),
    nl.


/* These rules describe how to put down an object. */
drop(X) :-
    have(X),
    i_am_at(Place),
    retract(have(X)),
    assert(at(X, Place)),
    write('You dropped the '),
    write(X),
    write('.'),
    nl, !,
    nl.

drop(_) :-
    write('You aren\'t have it!'),
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
    write("You went "),
    write(Direction),
    nl,
    look.

go(_) :-
    write("You can't go that way.").

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
    write('You have one *'), write(X), write('* in your bag.'), nl,
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
describe(crew_bedroom):-
    nl, write("A loud crashing sound wakes you up in you bed inside the engineering crew bedroom. You look around and see that the room is in a mess. A vent in the east corner of the room swings wide open. Blaring alarms can be heard from the main corridor on the south side. You see a locker, a desk and a bed. You need to act, fast."), nl, nl,
    write("You are at the crew bedroom."), nl, !, nl.

describe(crew_bedroom_vent):-
    nl, write("You crawl into a rather spatious crew bedroom vent. There it is! This is where you *desk_key* went! Good thing it didn\'t fall deeper or you would be stuck in here for ever."), nl, !, nl.

% Paths
% crew_bedroom n<=>s main_corridor
% has to be unlocked

% crew_bedroom w<=>e crew_bedroom_vent
path(crew_bedroom, e, crew_bedroom_vent).
path(crew_bedroom_vent, w, crew_bedroom).



% Crafting
craft(hammer_head, hammer_handle):-
    have(hammer_head),
    have(hammer_handle),
    retract(have(hammer_head)),
    retract(have(hammer_handle)),
    assert(have(hammer)),
    nl, write("Those two came togheter easily! Now you\'ve got a full *hammer*!"), nl, !, nl.



% Crew Bedroom ================================================================

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
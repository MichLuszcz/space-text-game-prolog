% ============= funkcjonalne=====================
:- (dynamic i_am_at/1, at/2, have/1, path/3, pickable/1).
:- retractall(at(_, _)),
   retractall(i_am_at(_)),
   retractall(alive(_)).


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
look :-
    i_am_at(Place),
    describe(Place),
    nl,
    notice_objects_at(Place).

% describing places

describe(bridge) :-
    write("you are the bridge."), !.



% notice objects at places
notice_objects_at(Place) :-
    at(X, Place),
    write("There is *"),
    write(X),
    write("* here."),
    nl,
    fail.

notice_objects_at(_).

check_inventory() :-
    have(X),
    write('You have one '), write(X), write(' in your bag.'), nl,
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
    write('use_on(Object1, Object2). -- to use an Object1 on Object2.'), nl,
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
describe(crew_bedroom):-
    write("A loud crashing sound wakes you up in you bed inside the engineering crew bedroom. You look around and see that the room is in a mess. A vent in the east corner of the room swings wide open. Blaring alarms can be heard from the corridor outside. You see a locker, a desk and a bed. You need to act, fast."), nl, nl,
    write("You are at the crew bedroom."), nl, !, nl.

% Paths
path(main_corridor, n, crew_bedroom).
path(crew_bedroom, s, main_corridor).
path(crew_bedroom, e, crew_bedroom_vent).
path(crew_bedroom_vent, w, crew_bedroom).

% Object at crew_bedroom
at(crew_bedroom, bed).
at(crew_bedroom, desk).
at(crew_bedroom, locker).

% Pickable objects at crew_bedroom
at(desk_key, crew_bedroom).
pickable(desk_key).








% =================jedrek===================================



% =================olek===================================
path(bridge, n, void).
at(bridge, vent).
inspectable(vent).


inspect(vent) :-
    write("It seems to be really high, should i *jump* in?"), !,
    nl.

jump(vent) :-
    assert(i_am_at(garbage_room)),
    write("You jumped in!"), !,
    look.

% =================olek===================================




% =================michal===================================
% path(cargo_bay, w, escape_pod)
%






% =================michal===================================


describe(_) :-
    nl.
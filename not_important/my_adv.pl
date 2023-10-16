:- (dynamic i_am_at/1, at/2, have/1, wearables/1, pipboy/1).

i_am_at(cryosleep_room).
at(oxygenbootle, cryosleep_room).
at(screwdriver, cryosleep_room).

path(cryosleep_room, n, corridor).
path(corridor, n, cryosleep_room).


start :-
    intro.

intro :-
    write("Spaceship just crashed, you have woken up from cryosleep and the ship's hull is ruptured."),
    nl,
    write("You have only your pip-boy on to help you. Maybe start with it..."),
    nl.

take(X) :-
    have(X),
    write("You already have it!"), !,
    nl.

take(X) :-
    i_am_at(Place),
    at(X, Place),
    retract(at(X, Place)),
    assert(have(X)),
    write("You have taken "),
    write(X),
    nl,
    picked_up(X), !,
    nl.

take(_) :-
    write("There is no such item here."),
    nl.

picked_up(oxygenbootle) :-
    write("You can wear it, but remember to monitor its level!"),
    assert(wearables(oxygenbootle)), !.

picked_up(_) :-
    nl.

wear(X) :-
    have(X),
    wearables(X),
    retract(have(X)),
    write("You are now wearing "),
    write(X),
    nl,
    wearing(X),
    nl, !.

wearing(oxygenbootle) :-
    write("You have put on oxygen bootle, you can now breathe!"),
    assert(pipboy(oxygenbootle)), !,
    nl.

pipboy :-
    write("take. - to take an item."),
    nl,
    write("use. - to use an item."),
    nl,
    write("look. - to look around."),
    nl,
    write("inventory. - to check your inventory."),
    nl,
    write("atmosphere. - to check the atmosphere."),
    nl,
    pipboy_commands(_).

% pipboy_commands(X) :-
%     pipboy(X),
%     write("oxygen. - to check oxygen level."),
%     nl.
pipboy_commands(oxygenbootle) :-
    pipboy(oxygenbootle),
    write("oxygen. - to check oxygen level."),
    nl.

pipboy_commands(_) :-
    nl.

oxygen :-
    pipboy(oxygenbootle),
    write("Oxygen level: 100%"),
    nl.

atmosphere :-
    write("Warning! Atmosphere highly toxic! Proceed only with oxygen bootle!"),
    nl.

look :-
    i_am_at(Place),
    describe(Place),
    nl,
    notice_objects_at(Place).


notice_objects_at(Place) :-
    at(X, Place),
    write("There is a "),
    write(X),
    write(" here."),
    nl,
    fail.

notice_objects_at(_).

describe(cryosleep_room) :-
    write("You are in cryosleep room, you have woken up here."),
    nl.

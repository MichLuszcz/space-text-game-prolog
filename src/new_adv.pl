:- (dynamic have/1, usable/1, additional_commands_req/1, at/2, i_am_at/1).


i_am_at(cryosleep_room).
at(oxygenbootle, cryosleep_room).
at(screwdriver, cryosleep_room).
at(wounded_nav_crew_member, nav_room).

pickable(oxygenbootle).
pickable(screwdriver).

talkable(wounded_nav_crew_member).

path(cryosleep_room, e, corridor_a4).
path(corridor_a4, w, cryosleep_room).
path(corridor_a4, e, nav_room).
path(nav_room, w, corridor_a4).

not_pickable(X) :-
    \+ pickable(X).

not_talkable(X) :-
    \+ talkable(X).

not_usable(X) :-
    \+ usable(X).


% Talking logic
talk(X) :-
    not_talkable(X),
    write("You can't talk to that."), !,
    nl.

talk(X) :-
    i_am_at(Place),
    at(X, Place),
    nl, !,
    handle_talk_to(X),
    nl.

% Handle talking to objects
handle_talk_to(wounded_nav_crew_member) :-
    write("Ty: Wszystko wpożądku?"),
    nl,
    write("On: Bywało lepiej. Mocno mnie poturbowało przy lądowaniu i kończy mi się tlen."),
    nl,
    write("Ty: Co tu się stało? Co ja robię na tym statku? I gdzie jest reszta załogi?"),
    nl,
    write("On: Spokojnie, nie wszystko naraz."),
    nl,
    write("On: Lecieliśmy przez pas meteorytów, statek oberwał, trzeba było awaryjnie lądować, jak widzisz nie wyszło to za dobrze."),
    nl,
    write("To mała załoga, reszta jest pewnie w części B, ale nie mogę tam przejść bo śluza się zamknęła, taki protokół bezpieczeństwa."),
    nl,
    write("Ty: Jasne, ale co ja robiłem w tej kriokomorze?"),
    nl,
    write("On: ...yhm, nie wiem, miałem przewieść tylko kilka mrożonek, a reszta mnie nie interesowała."),
    nl,
    write("On: Słuchaj, jeśli mamy stąd wyjść cali, to musimy dostać się do reszty i wezwać pomoc. Znam sposób na otwarcie tych drzwi, ale musisz mi pomóc, bo ja nie mogę nawet stanąć na nogach."),
    nl,
    write("On: Na końcu korytarza jest szatnia załogi, gdzieś tam musi być regulator serwisowy, jak podepniemy go do śluzy, to powinna się otworzyć."),
    nl,
    write("On: Jeszcze jedno weź to, to mapa statku, będzie ci łatwiej się tu orientować."),
    nl,
    assert(pickable(ship_map)),
    assert(at(ship_map, nav_room)),
    take(ship_map), !.


% Taking logic
take(X) :-
    have(X),
    write("You already have "), !,
    nl.

take(X) :-
    not_pickable(X),
    write("You can't take that."), !,
    nl.

take(X) :-
    i_am_at(Place),
    at(X, Place),
    retract(at(X, Place)),
    assert(have(X)),
    write("You have taken "),
    write(X),
    nl, !,
    handle_took(X),
    nl.

take(_) :-
    write("I don't see it here."),
    nl.


% look logic
look :-
    i_am_at(Place),
    describe(Place),
    map_info(Place),
    nl,
    notice_objects_at(Place).

% Map info
map_info(cryosleep_room) :-
    have(ship_map),
    write("Corridor A4 on east."), !,
    nl.

map_info(corridor_a4) :-
    have(ship_map),
    write("Cryosleep room on west, navigation room on east, Corridor A3 on south, Corridor B1 on north."), !,
    nl.

map_info(_).

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


% Using logic
use(X) :-
    have(X),
    usable(X),
    write("You have used "),
    write(X),
    nl, !,
    handle_used(X),
    nl.

use(_) :-
    write("You can't use it."),
    nl.

use(_).



start :-
    intro.

intro :-
    write("Spaceship just crashed, you have woken up from cryosleep and the ship's hull is ruptured."),
    nl,
    write("You have only your pip-boy on to help you. Maybe start with it..."),
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
    additional_commands(_).

% Handle taking items
handle_took(screwdriver) :-
    nl,
    fail.

handle_took(oxygenbootle) :-
    write("You can use it, but remember that it will run out of oxygen."),
    assert(usable(oxygenbootle)),
    nl,
    fail.

handle_took(ship_map) :-
    write("Podniosłeś mapę statku. Teraz jak się rozejrzysz, będziesz dokładniej wiedział gdzie jesteś."),
    nl,
    fail.

handle_took(_).


% Handle using items
handle_used(oxygenbootle) :-
    write("You are now wearing new oxygen bootle."),
    retract(have(oxygenbootle)),
    retract(usable(oxygenbootle)),
    assert(additional_commands_req(oxygenbootle)),
    nl,
    fail.

handle_used(_).

% Handle additional commands
additional_commands(oxygen) :-
    additional_commands_req(oxygenbootle),
    write("oxygen - to check your oxygen level."),
    nl,
    fail.

additional_commands(_) :-
    nl.

oxygen :-
    additional_commands_req(oxygenbootle),
    write("Your oxygen level is 100%."),
    nl.

atmosphere :-
    write("The atmosphere is toxic, you need to wear oxygen bootle."),
    nl.

inventory :-
    have(X),
    write(X),
    nl,
    fail.

inventory.

% describing places
describe(cryosleep_room) :-
    write("You are in cryosleep room, you have woken up here."), !,
    nl.

describe(corridor_a4) :-
    write("You are in corridor A4 outside cryo-room. North doors are sealed."), !,
    nl.

describe(nav_room) :-
    write("You are in navigation room."), !,
    nl.

describe(_) :-
    nl.


% notice objects at places
notice_objects_at(Place) :-
    at(X, Place),
    write("There is "),
    write(X),
    write(" here."),
    nl,
    fail.

notice_objects_at(_).

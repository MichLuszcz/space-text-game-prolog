
% ============= funkcjonalne=====================
:- dynamic i_am_at/1, at/2, have/1, path/3.
:- retractall(at(_, _)), retractall(i_am_at(_)), retractall(alive(_)).

i_am_at(entrance).

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
describe(entrance) :-
    write("you are at entrance EXAMPLE."), !,
    nl.

describe(_) :-
    nl.

% notice objects at places
notice_objects_at(Place) :-
    at(X, Place),
    write("There is *"),
    write(X),
    write("* here."),
    nl,
    fail.

notice_objects_at(_).

% ===============================================





% =================jedrek===================================

end


% =================jedrek===================================



% =================olek===================================
path()
% =================olek===================================




% =================michal===================================
%




% =================michal===================================


% ============= funkcjonalne=====================
:- dynamic i_am_at/1, at/2, have/1, path/3.
:- retractall(at(_, _)), retractall(i_am_at(_)), retractall(alive(_)).


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
    map_info(Place),
    nl,
    notice_objects_at(Place).
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

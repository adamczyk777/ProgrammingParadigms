porownaj([_,_,X,Y|_]) :-
    X = Y.

zamien([A,B,C,D|E], [A,B,D,C|E]).

nalezy(X,[X|_]).
nalezy(X,[_|Yogon]) :-
	nalezy(X,Yogon).

dlugosc([],0).
dlugosc([_|Ogon],Dlug) :-
	dlugosc(Ogon,X),
	Dlug is X+1.
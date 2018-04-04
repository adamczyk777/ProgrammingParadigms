porownaj([_,_,D,D|_]).


zamien([A,B,X,Y|C],[A,B,Y,X|C]).


nalezy(X,[X|_]).

nalezy(X,[_|Yogon]) :-
	nalezy(X,Yogon).


dlugosc([],0).
dlugosc([_|Ogon],Dlug) :-
	dlugosc(Ogon,X),
	Dlug is X+1.


a2b([],[]).
a2b([a|Ta],[b|Tb]) :- 
   a2b(Ta,Tb).


sklej([],X,X).
sklej([X|L1],L2,[X|L3]) :-
	sklej(L1,L2,L3).


nalezy1(X,L) :-
	sklej(_,[X|_],L).


ostatni(E,L) :-
	sklej(_,[E],L).


del3last(L1, L2) :-
	sklej(L1, [_,_,_], L2).


del3first(L1,L2) :-
	sklej([_,_,_],L2,L1).


parzysta([]).

parzysta([_|L]) :- 
	nieparzysta(L).


nieparzysta([_|L]) :- 
	parzysta(L).


odwroc([],[]).

odwroc([H|T],L) :-
	odwroc(T,R),
	sklej(R,[H],L).


palindrom(L) :-
	odwroc(L,L).

przesun(L,L1) :-
	sklej(L, [X], [X|L1]).


przeloz([],[]).

przeloz([A|L],[X|Y]) :-
	znaczy(A,X).
	przeloz(L,Y).

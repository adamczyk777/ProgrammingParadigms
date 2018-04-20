student(szymon, agh).
student(krzysiek, agh).
student(weronika, agh).
student(kasia, agh).
student(szymon, agh).
fajni_studenci :- 
    student(X,agh),
    write(X),
    fail,
    write(' nie jest fajny'),
    !.    
fajni_studenci :- 
    write('oni sa fajni'). 






% Powyższy program nie działą tak jak w założeniu. Popraw jego działanie wstawiając w odpowiednia miejsce klauzulę 'fail'

dynamic(kobieceImie/1).
dynamic(slowo/1).

%There has to be at least 1 name in the DB at the begining.
kobieceImie(anna).

dodajImie(I):-
  kobieceImie(I),
  !,
  print('To imie juz istnieje w bazie.').

dodajImie(I):-
  Term =.. [kobieceImie, I],
  assert(Term).






ksiazka(16, 'Flatlandia', autor('Edvin Abbot', 1838-1926),wydanie('Sell & Co',1884)).
ksiazka(16, 'Flatlandia', autor('Edvin Abbot', 1838-1926),wydanie('Sell & Co',1884)).
ksiazka(28, 'R. U. R.', autor('Karel Capek', 1890-1938),wydanie('Palyers Press',2002)).
ksiazka(34, 'Kobieta z wydm', autor('Kobo Abe', 1924-1993),wydanie('Wydawnictwo Znak',2007)).
ksiazka(36, 'Zamek', autor('Frans Kafka', 1883-1924),wydanie('Zielona Sowa',2001)).
ksiazka(37, 'Gargantua i Pantagruel', autor(' François Rabelais', 1494- 1553),wydanie('Siedmioróg',2004)).

% napisać klauzule dlaL
% 1. książki wydane po śmierci swojego autora
% odp. ksiazka(_,Ksiazka,autor(_,_-Smierc),wydanie(_,Wydanie)),Smierc<Wydanie.

wydaniePoSmierci() :-
    ksiazka(_,X,autor(_,_-Smierc),wydanie(_,Wydanie)),
    Smierc<Wydanie,
    write(X),
    fail.

% 2. autorów, którzy mieli szansę się spotkać(żyli w tym samym czasie)
% odp.

spotkaliSie(X,Y) :-
    ksiazka(_,_,autor(X,U1-Z1),_),
    ksiazka(_,_,autor(Y,U2-Z2),_),
    X \= Y,
    U2<Z1,
    Z2>U1.

% 3. listę wszystkich autorów żyjących(należy zastosować predykaty agregacyjne)
% odp.

% ???
wydawnictwo(Wyd) :-
    ksiazka(_,_,autor(_,U-_),wydanie(Wyd,_)),
    U >1800,
    U =< 1900.

wydawnictwa(Wydawnictwa) :-
    setof(X,wydawnictwo(X), Wydawnictwa).





% lista list

trzecizdrugiej([_,[_,_,X|_],[_,Y|_]|_]) :-
    write(X), nl,
    write(Y), nl.





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




mergeSorted([],[],[]).
mergeSorted([X],[],[X]).
mergeSorted([],[Y],[Y]).
mergeSorted([X|Tail1],[Y|Tail2],[X|Tail]) :-
    X =< Y,
    mergeSorted(Tail1, [Y|Tail2], Tail).
mergeSorted([X|Tail1],[Y|Tail2],[Y|Tail]) :-
    X > Y,
    mergeSorted([X|Tail1], Tail2, Tail).




% Napisać operator o priorytecie 80, który będzie robił tak, że będzie działało sokrates jest czlowiek zamiast jest(czlowiek,sokrates) , jest to ten operator.
:- op(80,xfx,jest).

:- op(90,xfy,ma).

kuba ma batona.
batona ma czekolade.




slowo(penis).

dodajslowo(X) :-
    slowo(X), !,
    write('Takie slowo juz istnieje w bazie wiedzy'), nl.

dodajslowo(X) :-
    Slowo =.. [slowo, X],
    assertz(Slowo),
    write('dodano slowo'), nl.

poznajslowo :-
    write('Proszę podać trudne słowo:'), nl,
    read(Slowo),
    dodajslowo(Slowo). 




    kocha(marcellus, mia).
kocha(vincent,mia).
zazdrosny(X,Y) :-
    kocha(X,Z),kocha(Y,Z).

% Narysuj drzewo przeszukiwania dla zapytania: zazdrosny(X,Y). 
% Jakie wyniki da zapytanie: zazdrosny(X,mia)?

% Jakie wyniki da zapytanie: zazdrosny(X,mia)?
% odp. false

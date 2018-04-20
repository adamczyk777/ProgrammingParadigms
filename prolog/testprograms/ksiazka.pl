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

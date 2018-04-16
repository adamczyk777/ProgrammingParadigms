kocha(marcellus, mia).
kocha(vincent,mia).
zazdrosny(X,Y) :-
    kocha(X,Z),kocha(Y,Z).

% Narysuj drzewo przeszukiwania dla zapytania: zazdrosny(X,Y). 
% Jakie wyniki da zapytanie: zazdrosny(X,mia)?

% Jakie wyniki da zapytanie: zazdrosny(X,mia)?
% odp. false

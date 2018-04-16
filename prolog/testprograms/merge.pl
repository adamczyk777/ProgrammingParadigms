mergeSorted([],[],[]).
mergeSorted([X],[],[X]).
mergeSorted([],[Y],[Y]).
mergeSorted([X|Tail1],[Y|Tail2],[X|Tail]) :-
    X =< Y,
    mergeSorted(Tail1, [Y|Tail2], Tail).
mergeSorted([X|Tail1],[Y|Tail2],[Y|Tail]) :-
    X > Y,
    mergeSorted([X|Tail1], Tail2, Tail).
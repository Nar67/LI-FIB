flip([], []).
flip([[X,Y]|L], [[X,Y]|F]):- flip(L, F).
flip([[X,Y]|L], [[Y,X]|F]):- flip(L, F).

check([]).
check([_]).
check([[_,Y],[Y,Z]|L]):- check([[Y,Z]|L]).

chain([],[]).
chain(L, R):- flip(L, R), check(R).

subst([], []).
subst([_|L], R):- subst(L,R).
subst([X|L], [X|R]):- subst(L,R).

allChains(L):- subst(L, S), chain(S, R), write(R), nl, fail.


%examen2


path(_, S, S):- !.
path(G, S, D):- select([S,S2], G, R), path(R, S2, D), !.


negate(\+X,X):-!.
negate(X,\+X).

sat(N,S):-
   findall([NX,Y],(member([X,Y], S), negate(X, NX)) , G1 ),
   findall([NY,X],(member([X,Y], S), negate(Y, NY)), G2 ),  append(G1,G2,G),
   \+badCycle(N,G).

   

badCycle(N,G):- between(1,N,I), negate(I,Neg),  path(G, I, Neg), path(G, Neg, I).
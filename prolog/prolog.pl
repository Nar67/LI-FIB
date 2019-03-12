prod([], 1).
prod([X|L], R):- prod(L, P1), R is P1 *X.

pert(X, [X|_]).
pert(X, [_|L]):- pert(X, L).


pescalar([],[], 0).
pescalar([X|L1], [Y|L2], P):- pescalar(L1, L2, P1), P is P1 + X*Y. 


intersection([], _, []).
intersection([X|L1], L2, [X|L3]):- pert(X,L2), !, intersection(L1, L2, L3).
intersection([_|L1], L2, L3):- intersection(L1, L2, L3).

union([],L1,L1).
union([X|L1], L2, L3):- pert(X,L2), union(L1, L2, L3).
union([X|L1], L2, [X|L3]):- union(L1, L2, L3).

ultimo([X|_], X).
ultimo([X|L], R):- ultimo(L, R). 
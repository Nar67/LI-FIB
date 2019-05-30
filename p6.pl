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

conc([], L, L).
conc([X|L1], L2, [X|L3]):- conc(L1, L2, L3).

ultimconc(L, X):- conc(_,[X],L).

ultimo([X|[]], X).
ultimo([_|L], R):- ultimo(L, R).	


reverse([], []).
reverse(L, [X|L1]):- conc(L2, [X], L), reverse(L2, L1).

fib(1, 1).
fib(2, 1).
fib(X, R):- X1 is X-1, X2 is X-2, fib(X1, R1), fib(X2, R2), R is R1+R2.

dados(0, 0, []).
dados(P, N, [X|L]):- N > 0, pert(X, [1,2,3,4,5,6]), P1 is P-X, N1 is N-1, dados(P1, N1, L).

pert_con_resto(X,L,R) :- concat(L1,[X|L2],L), concat(L1,L2,R).

sumaList([], 0).
sumaList([X|L], R):- sumaList(L, R1), R is X+R1. 

sumaDemas(L):- pert_con_resto(X, L, R), sumaList(R, X), !. %exclamation because if we find one we stop

sumaAnts(L):- conc(L1, [X|_], L), sumaList(L1, X).

isSorted([]).
isSorted([_]):- !.
isSorted([X,Y|L]):- X =< Y, isSorted([Y|L]).

permutacion([],[]).
permutacion(L,[X|P]) :- pert_con_resto(X,L,R), permutacion(R,P).

sortPerm(L1, L2):- permutacion(L1, L2), isSorted(L2).

insertion(X, [], [X]).
insertion(X, [Y|L1], [X, Y|L1]):- X =< Y.
insertion(X, [Y|L1], [Y|L2]):- X > Y, insertion(X, L1, L2).

sorting([], []).
sorting([X|L1], L2):- insertion(X, L1, L2), sorting(L1, L2).

split([], [], []).
split([X], [X], []).
split([A,B|L1], [A|L2], [B|L3]):- split(L1, L2, L3).

merge(L, [], L):- !.
merge([], L, L).
merge([X|L1], [Y|L2], [X|L3]):- X=<Y, !, merge(L1, [Y|L2], L3).
merge([X|L1], [Y|L2], [Y|L3]):- merge([X|L1], L2, L3).

mergeSort([], []):-!.
mergeSort([X], [X]):-!.
mergeSort(L1, R):-split(L1,L2,L3), mergeSort(L2, L2R), mergeSort(L3, L3R), merge(L2R, L3R, R). 

palindromos(L):- permutacion(L, P), esPalindromo(P), write(P), nl, fail.
palindromos(_).

esPalindromo([]).
esPalindromo([_]):- !.
esPalindromo([X|L]):- conc(L1, [X], L), esPalindromo(L1).  


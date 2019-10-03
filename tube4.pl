
/* tube4.pl */

/* recursive route planner */

route(S1,S2) :- sameline(S1,S2,L), write('travel direct '),
		write(S1), write(' to '), write(S2),nl.

route(S1,S2) :- online(S1,L1),
		interchange(L1,L2,Sx),
		write('take '),write(L1),write(' line'),
		nl,write('change at '),write(Sx),nl,
		route(Sx,S2).

test :- route(holburn,angel).


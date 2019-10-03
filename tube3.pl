

/* tube3.pl */


/* This file contains a simple route planner. It
   must be used in conjunction with tube1.pl's
   facts and the rules of tube2.pl.

   The first rule succeeds if both stations are
   on the sameline. It then has the effect of 
   printing out the direct route onto the sreen.

   If the first rule fails, the second may be 
   invoked. The first sub-goal in its body binds
   Line1 to Station1's line. The second finds any
   interchange station X on that line, and the 
   third checks to see if the destination is on 
   the line leading off the interchange. 

   If the correct interchange is not picked on
   the first attempt then sub-goal sameline will
   fail and interchange will be re-invoked (i.e.
   backtracking takes place)                    */

route(Station1,Station2) :-
	sameline(Station1,Station2,Line1),
	nl,write('use '),write(Line1),write(' direct'),nl.
route(Station1,Station2) :-
	online(Station1,Line1),
	interchange(Line1,Line2,StationX),
	sameline(Station2,StationX,Line2),
	nl,write('use '),write(Line1),
	nl,write('change at '),write(StationX),
	nl,write('then use '),write(Line2).


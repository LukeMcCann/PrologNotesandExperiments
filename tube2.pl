
/* tube2.pl */
/* this file contains rules about the underground network */


/* The sameline rule will succeed if
   Station1 and Station2 are on Line1.

   This rule takes the place of an exhaustive list 
   of station combinations that are on the same line. */


sameline(Station1,Station2,Line1) :-
		online(Station1,Line1),
		online(Station2,Line1).



/* Interchange will succeed if Line1
   and Line2 both pass through Station1,

   -alternatively every station which has > 1 line
   passing through it will satisfy this rule. */


interchange(Line1,Line2,Station1) :-
		online(Station1,Line1),
		online(Station1,Line2).



/*  This procedure specifies that the cost of travel
    between two stations is 40 (pence) if they are in
    the same zone, or is 60 otherwise.        */


cost(Station1,Station2,40) :-
		zone(Station1,N),
		zone(Station2,N).

cost(Station1,Station2,60).


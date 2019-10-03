
/* tube5.pl */

/* more sophisticated representation for tube station facts */


line(northern, 	 [london_bridge,
			bank,
			moorgate,
			old_street,
			angel,
			kings_cross,
			euston,
			camdon_town ]  ).

line(circle,	 [euston_square,
			kings_cross,
			farringdon,
			barbican,
			moorgate,
			liverpool_street ]  ).

line(central,	[ holborn,
			chancery_lane,
			st_pauls,
			bank,
			liverpool_street,
			bethnal_green ]   ).

line(piccadilly,[leicester_square,
			covent_garden,
			holborn,
			russel_square,
			kings_cross,
			caledonian_road ] ).


online(Station,Line) :- line(Line,Stationlist),
                        member(Station,Stationlist).

/* rules about the underground network */

/* if Station1 and Station2 are on Line1
   then the sameline rule will succeed */

sameline(Station1,Station2,Line1) :-
	online(Station1,Line1),
	online(Station2,Line1).


/* if Line1 and Line2 both pass through
   Station1 then interchange will succeed   */

interchange(Line1,Line2,Station1) :-
	online(Station1,Line1),
	online(Station1,Line2),
        \+ ( Line1 = Line2 ).


/* if we can travel direct from Station1
   to station2 then direct will succeed   */

direct(Station1,Station2) :-
	sameline(Station1,Station2,_).

/* this procedure writes to the screen
   simple routes between Station1 and
   Station2.                           */


route(Station1,Station2,_) :-
	sameline(Station1,Station2,Line1),
	nl,write('use '),write(Line1),write(' direct'),nl.

route(Station1,Station2,StationX) :-
	online(Station1,Line1),
	interchange(Line1,Line2,StationX),
	sameline(Station2,StationX,Line2),
	nl,write('take  '),write(Line1),write(' '),
	nl,write('change at '),write(StationX),
	nl,write('then take '),write(Line2),write(' ').


t1(X) :- route(holborn,angel,X).


/* utility procedure */

member(El,[El | Rest] ).
member(El,[_  | Rest] ) :- member(El,Rest).




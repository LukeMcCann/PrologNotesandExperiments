

/* tube6.pl */
/* more sophisticated representation for tube station facts */

line(northern, north, [	london_bridge, bank, moorgate, old_street,
			angel, kings_cross, euston, camdon_town ]  ).

line(circle, east, [	euston_square, kings_cross, farringdon,
			barbican, moorgate, liverpool_street ]  ).
line(central,east,[ holborn,
			chancery_lane, st_pauls, bank,
			liverpool_street, bethnal_green ]   ).
line(piccadilly,north,[	leicester_square, covent_garden, holborn,
			russel_square, kings_cross, caledonian_road ] ).

online(Station,Line) :- line(Line,_,Stationlist), member(Station,Stationlist).

/* rules about the underground network */
/* if Station1 and Station2 are on Line1
   then the sameline rule will succeed */
sameline(Station1,Station2,Line1) :-
	online(Station1,Line1), online(Station2,Line1).

/* if Line1 and Line2 both pass through
   Station1 then interchange will succeed   */
interchange(Line1,Line2,Station1) :-
	online(Station1,Line1), online(Station1,Line2),
        \+ ( Line1 = Line2 ).

/* if Station1 to Station2 on Line1 is in direction
   Dir then heading will succeed         */
heading(Line1,Station1,Station2,Dir) :- 
	line(Line1,Linedir,List),
	position(Station1,List,N),
	position(Station2,List,M),
	( (M > N) , ! ,Dir = Linedir  ;
	 opposite(Linedir,Dir) ).

/* utility procedures */
member(El,[El | Rest] ).
member(El,[_  | Rest] ) :- member(El,Rest).
position(X,[X | L],1).
position(X,[_ | L],M) :- position(X,L,N), M is N +1.
opposite(north,south).
opposite(east,west).

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
	heading(Line1,Station1,StationX,Dir1),
	heading(Line2,StationX,Station2,Dir2),
	nl,write('take  '),write(Line1),write(' '),write(Dir1),
	nl,write('change at '),write(StationX),
	nl,write('then take '),write(Line2),write(' '),write(Dir2).



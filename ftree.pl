

/* ftree.pl */

/* This file contains (incomplete) family tree 
   information and rules defining family
   relationships */

father(abraham,ishmael).
father(abraham,isaac).
father(isaac,jacob).
father(isaac,esau).
father(isaac,elsie).
father(jacob,fred).
father(jacob,freda).
father(jacob,frank).
mother(freda,dick).
mother(elsie,bill).
married(isaac,jane).
married(jacob,janice).
married(esau,jenny).
married(bob,freda).
married(dave,elsie).

male(abraham).
male(ishmael).
male(isaac).
male(jacob).
male(esau).
female(elsie).
male(fred).
male(jacob).
female(freda).
male(frank).
male(dick).
female(elsie).
male(bill).
female(jane).
female(janice).
female(jenny).
male(bob).
male(dave).


/* rules */

parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).

grandad(X,Y) :- father(X,Z),parent(Z,Y).


descendant(X,Y) :- parent(X,Y).
		/* - X has descendant Y if X is the parent of Y */
descendant(X,Y) :- parent(X,Z), descendant(Z,Y).
		/* - X has descendant Y if X is the parent of someone
		     who has decendant Y */




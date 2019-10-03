parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).
grandad(X,Y) :- father(X,Z),parent(Z,Y).
father(jacob,freda).
mother(freda,frank).
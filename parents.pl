:- initialization(main).

parent(alice,bob).
parent(alice,charlie).
parent(adam,subhan).
parent(subhan,ali).
grandparent(A,C):-parent(A,B),parent(B,C).
sibling(Y,Z):-parent(X,Y),parent(X,Z),Y\=Z.

main :-
    sibling(BRO,SIS),
    write(BRO),
    write(' is SIBLING of '),
    write(SIS), nl,
    grandparent(GP,GC),
    write(GP),
    write(' is grandparent of '),
    write(GC), nl,
    fail.

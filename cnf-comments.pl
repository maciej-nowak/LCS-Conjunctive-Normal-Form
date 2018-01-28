/**------------------------------------------------------------------------------------*/
:-op(110, fy, ~).
:-op(120, xfy, and).
:-op(120, xfy, or).
:-op(130, xfy, =>).
:-op(130, xfy, <=>).


/**------------------------------------------------------------------------------------*/
elimination(~A, ~C) :- write('1. elimination:  '), write(~A), nl, !, elimination(A, C).
elimination(A => B, ~C or D) :- write('2. elimination: '), write(A => B), nl, !, elimination(A, C), elimination(B, D).
elimination(A <=> B, (~C or D) and (C or ~D)) :- write('3. elimination: '), write(A <=> B), nl, !, elimination(A, C), elimination(B, D).
elimination(A and B, C and D) :- write('4. elimination: '), write(A and B), nl, !, elimination(A, C), elimination(B, D).
elimination(A or B, C or D) :-write('5. elimination: '),  write(A or B), nl, !, elimination(A, C), elimination(B, D).
elimination(A, A) :- write('6. elimination: '), write(A), nl.


/**------------------------------------------------------------------------------------*/
movement(~(~A), C) :- write('1. movement: '), write(~(~A)), nl, !, movement(A, C).
movement(~(A and B), C or D) :- write('2. movement: '), write(~(A and B)), nl, !, movement(~A, C), movement(~B, D).
movement(~(A or B), C and D) :- write('3. movement: '), write(~(A or B)), nl, !, movement(~A, C), movement(~B, D).
movement(A and B, C and D) :- write('4. movement: '), write(A and B), nl, !, movement(A, C), movement(B, D).
movement(A or B, C or D) :- write('5. movement: '), write(A or B), nl, !, movement(A, C), movement(B, D).
movement(A, A) :- write('6. movement: '), write(A), nl.


/**------------------------------------------------------------------------------------*/
separation(A or (B and C), (A or B) and (A or C)) :- write('1. separation: '), write(A or (B and C)), nl, !.
separation((A and B) or C, (A or C) and (B or C)) :- write('2. separation: '), write((A and B) or C), nl, !.
separation(A and B, (C and B)) :- write('3. separation: '), write(A and B), nl, separation(A, C).
separation(A and B, (A and D)) :- write('4. separation: '), write(A and B), nl, separation(B, D).
separation(A or B, (C or B)) :- write('5. separation: '), write(A or B), nl, separation(A, C).
separation(A or B, (A or D)) :- write('6. separation: '), write(A or B), nl, separation(B, D).


/**------------------------------------------------------------------------------------*/
separate(A, C) :- separation(A, B), !, separate(B, C).
separate(A, A).


/**------------------------------------------------------------------------------------*/
cnf(A, D) :- elimination(A, B), movement(B, C), separate(C, D).


/**------------------------------------------------------------------------------------*/
start() :- write('Operators: ~, and, or, =>, <=>'), nl, write('Write command in schema: cnf(formula, X).'), nl, write('To see examples just write: test(nr, X). where nr is 1-6').

test(1, X) :- write(cnf(~(p and q) => (q => r), X)), nl, cnf(~(p and q) => (q => r), X).
test(2, X) :- write(cnf(((p => q) and p) => q, X)), nl, cnf(((p => q) and p) => q, X).
test(3, X) :- write(cnf(((a and b) or (c and d) or e), X)), nl, cnf(((a and b) or (c and d) or e), X).
test(4, X) :- write(cnf(~((~p => ~q) and ~r), X)), nl, cnf(~((~p => ~q) and ~r), X).
test(5, X) :- write(cnf(((p and q) or (r and s)) or t, X)), nl, cnf(((p and q) or (r and s)) or t, X).
test(6, X) :- write(cnf(p <=> (r and s), X)), nl, cnf(p <=> (r and s), X).
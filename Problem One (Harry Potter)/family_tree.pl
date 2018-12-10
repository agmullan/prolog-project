/*
  author: Francine Dennehy
  author: Alexandra Mullan
  Project Five
  version 2.0
  Part One

  Questions to answer:

  1. Who is the father of Harry Potter?

  2. Who is the mother of Ginny Weasley?

  3. Who are Harry Potter's siblings?

  4. Who are Ginny Weasley's siblings?

  5. Does Harry Potter have a grandmother? Great grandmother?

  6. Does Harry Potter have a cousin? Who is it?

  7. Who are Harry Potter's aunts and uncles?

  8. Who is Bill Weasley married to? Who is Ron Weasley married to?

  9. Who are the greatgrandchildren of Mr. and Mrs. Potter (Mr. and Mrs. Potter are James
  Potter's parents)?

  10. Who are the greatgrandchildren of Septimus/Cederella Weasley?
*/

/*
  Notes:
  , means and
  \= mean not equal
  ;  means or

 	Querries:
    1. ?- parent(X, harry_potter), male(X).

    2. ?- parent(X, ginevra_weasley), female(X).

    3. ?- sibling(harry_potter, X).

    4. ?- sibling(ginevra_weasley, X).

    5. ?- grandmother(harry_potter, X) ; greatgrandmother(harry_potter, Y).

    6. ?- cousin(harry_potter, Y).

    7. ?- auntoruncle(harry_potter, Y,Z).

    8. ?- married(william_weasley, X), married(ronald_weasley, Y).

    9. ?- greatgrandchildren(mr_potter, mrs_potter, X).

   10. ?- greatgrandchildren(septimus_weasley, cedrella_black, X).

 */
/* DATABASE

    male(x): x is a male
    female(x): x is a female
    parent(x, y): x is a parent of y
    married(x, y): x is married to y

*/
:- discontiguous
        male/1,
        female/1,
        married/2,
        parent/2.

/* version 1.0
 * This method finds X's cousin Y. It does this by first finding the parent of X, which is
 * defined as A. Then it finds A's parent B. Next other children of B are found and it is
 * expressed that A cannot be equal to the other children found of B. Finally it sees it the sibling
 * of A has a child. If the answer is yes the cousin's name is returned. If the answer is no false is
 * returned. This method is performed for all instances of A found.
 */
cousin(X,Y) :-
    parent(A, X), parent(B,A), parent(B,C), C\= A, parent(C,Y).

/* version 1.0
 * This method finds any and all siblings Y of X. It does this through first finding the parent of
 * X and seeing if the parent A had another child that is not equal to X. If a sibling if found
 * then the name is returned. If a sibling is not found then false is returned.
 * This method is performed for all instances of A found.
 */
sibling(X,Y) :-
    parent(A, X), parent(A, Y),  X \= Y.

/* version 1.0
 * This method finds the grandmother Y of X. It does this through finding the parent A of X. Then
 * the method says that it want the female parent of A. If a grandmother is found than the name is
 * returned. If no grandmother is found then false is returned.
 * This method is performed for all instances of A found.
 */
grandmother(X,Y) :-
     parent(A, X),female(Y), parent(Y, A).

/* version 1.0
 * This method finds the great grandmother Y of X. It does this through finding the parent A of X. Then
 * the method finds the female parent of the grandparent found. If a great grandmother is found
 * than the name is returned. If no great grandmother is found then false is returned.
 * This method is performed for all instances of A found and B meaning it search the father's
 * side and the mother's side.
 * */
greatgrandmother(X,Y) :-
     parent(A, X),female(Y), parent(B, A), parent(Y,B).

/* version 1.0
 * This method finds any and all aunts Y and uncles Z of X. It does this through first finding
 * the parent A of X the finding A's siblings. If a sibling of A is found then the names of the sibling
 * and their spouse are returned. If the aunt or uncle is single just the name of
 * the blood relation is returned. If a sibling is not found then false is returned.
 * This method is performed for all instances of A found.
 */
auntoruncle(X,Y,Z) :-
    parent(A,X), sibling(A, Y), A \= Y, ( married(Y, Z) ; married(Z, Y) ;
                                        not(married(Y,Z)) ; not(married(Z,Y))).



/* version 1.0
 * This method finds all great grandchildren Z of X and Y. It does this through first finding
 * the children of X and Y. Then finding A's children and finally finding B's children. If a great
 * grandchild is found then the name is return. If no great grandchild is found then false is return.
 */
greatgrandchildren(X,Y,Z) :-
    parent(X, A), parent(Y, A), parent(A, B), parent(B, Z).


/* Root of Weasley family */
male(septimus_weasley).
female(cedrella_black).

married(septimus_weasley, cedrella_black).

parent(septimus_weasley, arthur_weasley).
parent(cedrella_black, arthur_weasley).

/* Arthur's branch of Weasley family */
male(arthur_weasley).
female(molly_prewett).
male(william_weasley).
male(charles_weasley).
male(percy_weasley).
male(fred_weasley).
male(george_weasley).
male(ronald_weasley).
female(ginevra_weasley).

married(arthur_weasley, molly_prewett).

parent(arthur_weasley, william_weasley).
parent(molly_prewett, william_weasley).

parent(arthur_weasley, charles_weasley).
parent(molly_prewett, charles_weasley).

parent(arthur_weasley, percy_weasley).
parent(molly_prewett, percy_weasley).

parent(arthur_weasley, fred_weasley).
parent(molly_prewett, fred_weasley).

parent(arthur_weasley, george_weasley).
parent(molly_prewett, george_weasley).

parent(arthur_weasley, ronald_weasley).
parent(molly_prewett, ronald_weasley).

parent(arthur_weasley, ginevra_weasley).
parent(molly_prewett, ginevra_weasley).


/* Fleur's family tree */
male(monsieur_delacour).
female(apolline_delacour).
female(fleur_delacour).
female(gabrielle_delacour).

married(monsieur_delacour, apolline_delacour).

parent(monsieur_delacour, fleur_delacour).
parent(apolline_delacour, fleur_delacour).

parent(monsieur_delacour, gabrielle_delacour).
parent(apolline_delacour, gabrielle_delacour).

/* William's branch of Weasley family */
female(victorie_weasley).
female(dominique_weasley).
male(louis_weasley).

married(william_weasley, fleur_delacour).

parent(william_weasley, victorie_weasley).
parent(fleur_delacour, victorie_weasley).

parent(william_weasley, dominique_weasley).
parent(fleur_delacour, dominique_weasley).

parent(william_weasley, louis_weasley).
parent(fleur_delacour, louis_weasley).

/* Percy's branch of Weasley family */
female(audrey_weasley).
female(molly_weasley).
female(lucy_weasley).

married(percy_weasley, audrey_weasley).

parent(percy_weasley, molly_weasley).
parent(audrey_weasley, molly_weasley).

parent(percy_weasley, lucy_weasley).
parent(audrey_weasley, lucy_weasley).

/* George's branch of Weasley family */
female(angelina_johnson).
male(fred_weasley_ii).
female(roxanne_weasley).

married(george_weasley, angelina_johnson).

parent(george_weasley, fred_weasley_ii).
parent(angelina_johnson, fred_weasley_ii).

parent(george_weasley, roxanne_weasley).
parent(angelina_johnson, roxanne_weasley).

/* Ronald's branch of Weasley family */
female(hermione_granger).
female(rose_weasley).
male(hugo_weasley).

married(ronald_weasley, hermione_granger).

parent(ronald_weasley, rose_weasley).
parent(hermione_granger, rose_weasley).

parent(ronald_weasley, hugo_weasley).
parent(hermione_granger, hugo_weasley).

/* Ginevera's branch of Weasley family */
male(harry_potter).
male(james_potter_ii).
male(albus_potter).
female(lily_potter).

married(harry_potter, ginevra_weasley).

parent(harry_potter, james_potter_ii).
parent(ginevra_weasley, james_potter_ii).

parent(harry_potter, albus_potter).
parent(ginevra_weasley, albus_potter).

parent(harry_potter, lily_potter).
parent(ginevra_weasley, lily_potter).

/* Evans' family*/
male(mr_evans).
female(mrs_evans).
female(petunia_evans).
female(lily_evans).

married(mr_evans, mrs_evans).

parent(mr_evans, petunia_evans).
parent(mrs_evans, petunia_evans).

parent(mr_evans, lily_evans).
parent(mrs_evans, lily_evans).

/* Dursley family root */
male(mr_dursley).
female(mrs_dursley).
female(marjorie_dursley).
male(vernon_dursley).

married(mr_dursley, mrs_dursley).

parent(mr_dursley, marjorie_dursley).
parent(mrs_dursley, marjorie_dursley).

parent(mr_dursley, vernon_dursley).
parent(mrs_dursley, vernon_dursley).

/* Vernon's branch of Dursley family*/
male(dudley_dursley).

married(vernon_dursley, petunia_evans).

parent(vernon_dursley, dudley_dursley).
parent(petunia_evans, dudley_dursley).

/* Potter famliy root */
male(mr_potter).
female(mrs_potter).
male(james_potter).

married(mr_potter, mrs_potter).

parent(mr_potter, james_potter).
parent(mrs_potter, james_potter).

/* James' branch of Potter family */
married(james_potter, lily_evans).

parent(james_potter, harry_potter).
parent(lily_evans, harry_potter).

% Student exercise profile
:- set_prolog_flag(occurs_check, error).        % disallow cyclic terms
:- set_prolog_stack(global, limit(8 000 000)).  % limit term space (8Mb)
:- set_prolog_stack(local,  limit(2 000 000)).  % limit environment space

% Your program goes here

/*
  author: Francine Dennehy
  author: Alexandra Mullan
  Project Five
  Part One

*/

/*
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

 	Querries:
    1. ?- parent(X, harry_potter), male(X).

    2. ?- parent(X, ginevra_weasley), female(X).

    3. ?- parent(james_potter, X), parent(lily_evans, X) , harry_potter \= X.

    4. ?- parent(arthur_weasley, X), parent(molly_prewett, X) , ginevra_weasley \= X.

    5.
      a)
       ?- female(A), female(C), male(B), female(D), married(B,A), parent( B, harry_potter),
          parent(C, B), parent(D, A).
       ?- female(A), female(B), parent(A, lily_evans), parent(B, james_potter).

      b)
       ?- female(A), female(C), male(B), female(D), female(E), female(F), married(B,A),
          parent(B, harry_potter), parent(C, B), parent(D, A), parent(E, C), parent(F, D).
       ?- female(A), female(B), female(C), female(D), parent(A, lily_evans),
          parent(B, james_potter), parent(C, A), parent(D, B).

      a & b)
       ?- female(A), male(B), female(C), female(D), parent( B, harry_potter),
          parent(A, harry_potter), married(B,A), parent(C, B), parent(D, A) ;
          female(A), female(C), male(B), female(D), female(E), female(F), married(B,A),
          parent(B, harry_potter), parent(C, B), parent(D, A), parent(E, C), parent(F, D).

    6. ?- female(A), parent(A, harry_potter), parent(B, A), parent(B, C), C \= A, parent(C, D).
       ?- female(A), parent(A, harry_potter), parent(B, A), parent(B, C), C \= A, parent(C, D)
       ; male(M), parent(M, harry_potter), parent(N, M), parent(N, O), O \= M, parent(O, P).

    7. ?- female(A), parent(A, harry_potter), parent(B, A), parent(B, C), A \= C,
       (married(C, D) ; married(D, C)) ;
       male(A), parent(A, harry_potter), parent(B, A), parent(B, C), A \= C,
       (married(C, D) ; married(D, C)).

    8. ?- married(william_weasley, X), married(ronald_weasley, Y).

    9. ?- parent(mr_potter, A), parent(mrs_potter, A), parent(A, B), parent(B, C).

   10. ?- parent(septimus_weasley, A), parent(cedrella_black, A), parent(A, B), parent(B, C).
 */
/* DATABASE

    male(x): x is a male
    female(x): x is a femaleparent(james_potter, X), parent(lily_evans, X) , Y = harry_potter, Y \= X.
    parent(x, y): x is a parent of y
    married(x, y): x is married to y

*/
:- discontiguous
        male/1,
        female/1,
        married/2,
        parent/2.

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

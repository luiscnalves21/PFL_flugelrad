:- use_module(library(between)).

init_random_state :-
  now(X),
  setrand(X).

choose_difficulty(Bot) :-
  format('Please select ~a status:\n', [Bot]),
  write('1 - Easy\n'),
  write('2 - Hard\n'),
  get_option(1, 2, 'Difficulty', Option), !,
  asserta((difficulty(Bot, Option))).

get_line(Result, Acc):-
  get_char(Char),
  Char \= '\n',
  append(Acc, [Char], Acc1),
  get_line(Result, Acc1).

get_line(Result, Acc):-
    atom_chars(Result, Acc).

get_name(Player):-
  format('Hello ~a, what is your name? ', [Player]),
  get_line(Name, []),
  asserta(name_of(Player, Name)).

read_number(X):-
  read_number_aux(X,0).

read_number_aux(X,Acc):- 
  get_code(C),
  between(48, 57, C), !,
  Acc1 is 10*Acc + (C - 48),
  read_number_aux(X,Acc1).
  read_number_aux(X,X).

get_option(Min, Max, Context, Value):-
  format('~a between ~d and ~d: ', [Context, Min, Max]),
  repeat,
  read_number(Value),
  between(Min, Max, Value), !.
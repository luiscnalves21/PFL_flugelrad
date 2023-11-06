:- use_module(library(between)).

init_random_state :-
  now(X),
  setrand(X).

% clear_console/0
% Clears console
clear_console:- 
  write('\33\[2J'). 

% clear_data/0
% removes all name_of, color_of, vertice, last_move and valid_move from the fact base for the next game
clear_data :-
  retractall(name_of(_, _)),
  retractall(color_of(_, _)),
  retractall(vertice(_, _, _, _)),
  retractall(last_move(_)),
  retractall(valid_move(_)),
  retractall(counter(_,_)),
  retractall(game_over_bool(_)).

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

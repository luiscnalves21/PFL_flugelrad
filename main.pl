:- use_module(library(random)).
:- consult(configurations).
:- consult(board).

play :-
  clear_console,
  configurations(GameState),
  game_cycle(GameState),
  clear_data, !.

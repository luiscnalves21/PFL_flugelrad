:- use_module(library(random)).
:- consult(configurations).
:- consult(board).

% play/0
% Predicate to start and play the game
play :-
  clear_console,
  configurations(GameState),
  game_cycle(GameState),
  clear_data, !.

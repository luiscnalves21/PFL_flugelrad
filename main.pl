:- use_module(library(random)).
:- consult(configurations).
:- consult(board).

% clear_console/0
% Clears console
clear_console:- 
  write('\33\[2J'). 

display_game(GameState-Player) :-
  clear_console,
  board_state(Board),
  display_board(Board).

game_cycle(GameState-Player):-
  game_over(GameState, Winner), !,
  congratulate(Winner).

game_cycle(GameState-Player):-
  choose_move(GameState, Player, Move),
  move(GameState, Move, NewGameState),
  next_player(Player, NextPlayer),
  display_game(NewGameState-NextPlayer), !,
  game_cycle(NewGameState-NextPlayer).

play :-
  clear_console,
  configurations(GameState), !.
  /*display_game(GameState-Player),
  game_cycle(GameState-Player).*/
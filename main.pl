:- use_module(library(random)).
:- consult(configurations).
:- consult(board).

% clear_console/0
% Clears console
clear_console:- 
  write('\33\[2J'). 

display_game([Board|_]) :-
  clear_console,
  display_board(Board).

%game_cycle(GameState):-
    %game_over(GameState, Winner), !,
    %display_game(GameState),
    %show_winner(GameState, Winner).

game_cycle(GameState):-
    display_game(GameState),
    print_turn(GameState),
    choose_move(GameState, Move),
    valid_move(Valid),
    (Valid = 1 -> move(GameState, Move, NewGameState), !; NewGameState = GameState),
    game_cycle(NewGameState).

play :-
  clear_console,
  configurations(GameState),
  game_cycle(GameState).

:- use_module(library(between)).
:- use_module(library(system), [now/1]).
:- consult(utils).
:- consult(data).

option(1):-
  write('Human vs Human\n'),
  get_name(player_1), get_name(player_2).

option(2):-
  write('Human vs Bot\n'),
  get_name(player_1),
  asserta((name_of(player_2, 'Bot'))), !, 
  choose_difficulty(player_2).

option(3):-
  write('Bot vs Bot\n'),
  asserta((name_of(player_1, 'Bot_1'))),
  asserta((name_of(player_2, 'Bot_2'))), !,
  choose_difficulty(player_1),
  choose_difficulty(player_2).

% flugelrad/0
% Game header
flugelrad:-
  write('=====================\n'),
  write('Welcome to Flugelrad!\n'),
  write('=====================\n').

% menu/0
% Main menu
menu:-  
  write('Please select game mode:\n'),
  write('1 - Human  vs  Human\n'),
  write('2 - Human  vs  Bot\n'),
  write('3 - Bot    vs  Bot\n').

choose_player(Player):-
  name_of(player_1, Name1),
  name_of(player_2, Name2),
  format('~a starts first!\n', [Name1]),
  format('~a starts second!\n', [Name2]),
  Player = player_1.

% set_mode/0
% Game mode choice
set_mode :-
  menu,
  get_option(1, 3, 'Mode', Option), !,
  option(Option).

configurations([Board, Player, [], 0]) :-
  flugelrad,
  set_mode,
  init_random_state,
  choose_player(Player).
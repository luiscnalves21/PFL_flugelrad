:- use_module(library(between)).
:- use_module(library(system), [now/1]).
:- consult(utils).
:- consult(data).

option(1, Player):-
  write('\nHuman vs Human\n\n'),
  get_name(player_1), get_name(player_2),
  choose_color,
  choose_player(Player).

option(2, Player):-
  write('\nHuman vs Bot\n\n'),
  get_name(player_1),
  asserta((name_of(player_2, 'Bot'))), !, 
  choose_difficulty(player_2),
  choose_color,
  choose_player(Player).

option(3, Player):-
  write('\nBot vs Bot\n\n'),
  asserta((name_of(player_1, 'Bot_1'))),
  asserta((name_of(player_2, 'Bot_2'))), !,
  choose_difficulty(player_1),
  choose_difficulty(player_2),
  asserta((color_of(player_1, blue))),
  asserta((color_of(player_2, green))),
  format('\n~a, you are the ~a marbles!\n', ['Bot_1', blue]),
  format('~a, you are the ~a marbles!\n', ['Bot_2', green]),
  format('\n~a starts first!\n', ['Bot_1']),
  Player = player_1.

% flugelrad/0
% Game header
flugelrad:-
  write('=====================\n'),
  write('Welcome to Flugelrad!\n'),
  write('=====================\n\n').

% menu/0
% Main menu
menu :-  
  write('\nPlease select game mode:\n'),
  write('1 - Human  vs  Human\n'),
  write('2 - Human  vs  Bot\n'),
  write('3 - Bot    vs  Bot\n\n').

choose_color :-
  name_of(player_1, Name1),
  name_of(player_2, Name2),
  format('\n~a, choose your color:\n', [Name1]),
  write('1 - Blue\n'),
  write('2 - Green\n'),
  get_option(1, 2, 'Color', Option), !,
  other_color(Option, Other),
  color(Color1, Option),
  color(Color2, Other),
  asserta((color_of(player_1, Color1))),
  asserta((color_of(player_2, Color2))),
  format('\n~a, you are the ~a marbles!\n', [Name1, Color1]),
  format('~a, you are the ~a marbles!\n', [Name2, Color2]).

choose_player(Player):-
  color_of(player_1, Color1),
  color_of(player_2, Color2),
  (Color1 = blue -> Player = player_1; Player = player_2),
  name_of(Player, Name1),
  format('\n~a starts first!\n', [Name1]).

% set_mode/1
% Game mode choice
set_mode(Player) :-
  menu,
  get_option(1, 3, 'Mode', Option), !,
  option(Option, Player),
  write('\nPress ENTER to start!\n'),
  get_char(_).

configurations([Board, Player]) :-
  flugelrad,
  set_mode(Player),
  init_random_state,
  board(Board).
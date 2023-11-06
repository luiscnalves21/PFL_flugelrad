:- use_module(library(between)).
:- use_module(library(system), [now/1]).
:- use_module(library(lists)).
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
  choose_color,
  choose_player(Player).

option(3, Player):-
  write('\nBot vs Bot\n\n'),
  asserta((name_of(player_1, 'Bot_1'))),
  asserta((name_of(player_2, 'Bot_2'))), !,
  asserta((color_of(player_1, b))),
  asserta((color_of(player_2, g))),
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

choose_player(Player) :-
  color_of(player_1, Color1),
  (Color1 = b -> Player = player_1; Player = player_2),
  name_of(Player, Name1),
  format('\n~a starts first!\n', [Name1]).

choose_move([Hexagon, Rotation], 1) :-
  last_move(LastHexagon),
  (LastHexagon = 0 -> write('\nChoose a hexagon to play: \n'); format('\nChoose a hexagon to play except ~d: \n', LastHexagon)),
  get_option(1, 7, 'Hexagon', Hexagon), !,
  write('How many times do you want to rotate it? \n'),
  get_option(1, 5, 'Rotation', Rotation), !,
  validate_move(Hexagon), !.

choose_move([Hexagon, Rotation], 2) :-
  ValidHexagonMoves = [1, 2, 3, 4, 5, 6, 7],
  ValidRotationMoves = [1, 2, 3, 4, 5],
  random(0, 7, HexagonIndex),
  nth0(HexagonIndex, ValidHexagonMoves, Hexagon),
  random(0, 5, RotationIndex),
  nth0(RotationIndex, ValidRotationMoves, Rotation),
  last_move(LastHexagon),
  (LastHexagon = 0 -> write('\nChoose a hexagon to play: \n'); format('\nChoose a hexagon to play except ~d: \n', LastHexagon)),
  format('Hexagon between 1 and 7: ~d\n', Hexagon),
  write('How many times do you want to rotate it? \n'),
  format('Rotation between 1 and 5: ~d\n', Rotation),
  validate_move(Hexagon), !.

move([_, Player], [Hexagon, Rotation], NewGameState) :-
  hexagon(Hexagon, Vertices),
  rotate_vertices(Vertices, Rotation),
  other_player(Player, NewPlayer),
  board(NewBoard),
  NewGameState = [NewBoard, NewPlayer].

validate_move(Hexagon) :-
  last_move(LastHexagon),
  (Hexagon = LastHexagon -> asserta(valid_move(0)); asserta(last_move(Hexagon)), asserta(valid_move(1))).

last_vertice([X], X) :- !.

last_vertice([_|T], X) :-
  last_vertice(T, X).

rotate_vertices(_, 0) :- !.

rotate_vertices(Vertices, Rotation) :-
  Rotation1 is Rotation - 1,
  [H|T] = Vertices,
  vertice(H, V, N, Visited),
  last_vertice(Vertices, Last),
  vertice(Last, NewValue, _, _),
  asserta((vertice(H, NewValue, N, Visited))),
  rotate_hexagon(V, T),
  rotate_vertices(Vertices, Rotation1).

rotate_hexagon(_, []) :- !.

rotate_hexagon(S, [H|T]) :-
  vertice(H, V, N, Visited),
  asserta((vertice(H, S, N, Visited))),
  rotate_hexagon(V, T).

% print_turn(+GameState)
% Prints a message declaring whose turn it is
print_turn([_, Player]):-
  name_of(Player, Name),
  format('\n~a, is your turn!\n', [Name]), !,
  valid_move(Valid),
  (Valid = 0 -> write('\nA hexagon can\'t be played twice in a row!\n'); true), !.

dfs(N, _) :-
  vertice(N, _, _, Visited),
  Visited = true, !.

dfs(N, Player) :-
  vertice(N, Value, Adjacent, _),
  retract((vertice(N, _, _, _))),
  asserta((vertice(N, Value, Adjacent, true))),
  color_of(Player, Color),
  (Value = Color -> counter(Player, Counter), 
    NewCounter is Counter + 1, 
    retract(counter(Player, Counter)), 
    asserta(counter(Player, NewCounter)), dfs_adjacent(Adjacent, Player), !; !
  ).

dfs_adjacent([], _) :- !.

dfs_adjacent([H|T], Player) :-
  dfs(H, Player),
  dfs_adjacent(T, Player).

dfs_vertices(0, Player, Winner) :- 
  counter(Player, Counter),
  (Counter >= 6 -> Winner = Player, asserta(game_over_bool(1)), !;
  retract(counter(Player, _)),
  asserta(counter(Player, 0))
  ), !.

dfs_vertices(N, Player, Winner) :-
  counter(Player, Counter),
  (Counter >= 6 -> Winner = Player, asserta(game_over_bool(1)), !; 
    retract(counter(Player, _)),
    asserta(counter(Player, 0)),
    setNotVisited(30),
    vertice(N, V, _, _),
    (V = e -> !;
      dfs(N, Player)
    ),
    N1 is N - 1,
    dfs_vertices(N1, Player, Winner)
  ),
  !.

setNotVisited(0) :- !.

setNotVisited(N) :-
  vertice(N, V, A, _),
  retract((vertice(N, _, _, _))),
  asserta((vertice(N, V, A, false))),
  N1 is N - 1,
  setNotVisited(N1).

game_over(Winner) :-
  dfs_vertices(30, player_1, Winner),
  dfs_vertices(30, player_2, Winner).

display_game([Board|_]) :-
  %clear_console,
  display_board(Board).

show_winner(Winner) :-
  name_of(Winner, Name),
  format('\nThe winner is ~a!\n', [Name]), !.

playerType([_, Player], PlayerType) :-
  name_of(Player, Name),
  (Name = 'Bot' -> PlayerType = 2; PlayerType = 1).

game_cycle(GameState) :-
  display_game(GameState),
  print_turn(GameState),
  playerType(GameState, PlayerType),
  choose_move(Move, PlayerType),
  valid_move(Valid),
  (Valid = 1 -> move(GameState, Move, NewGameState), !; NewGameState = GameState),
  game_over(Winner),
  game_over_bool(IsOver),
  (IsOver = 1 -> display_game(GameState), show_winner(Winner), !; game_cycle(NewGameState)), !.

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
  assertall,
  board(Board).

:- consult(data).
:- consult(utils).

% display_board(+Board)
% Displays the board
display_board :-
  display_white_space(11),
  display_bar(1),
  display_white_space(7),
  display_bar(1),
  display_white_space(11),
  nl,
  display_white_space(10),
  write('/'),
  display_white_space(9),
  write('\\'),
  display_white_space(5),
  write('/'),
  display_white_space(9),
  write('\\'),
  display_white_space(10).
/*
  text("           o-------o       o-------o           "),
  text("          /         \     /         \          "),
  text("         /           \   /           \         "),
  text("        o      O       o       O      o        "),
  text("         \           /   \           /         "),
  text("          \         /     \         /          "),
  text("   o-------o-------o-------o-------o-------o   "),
  text("  /         \     /         \     /         \  "),
  text(" /           \   /           \   /           \ "),
  text("o      O       o       O       o       O      o"),
  text(" \           /   \           /   \           / "),
  text("  \         /     \         /     \         /  "),
  text("   o-------o-------o-------o-------o-------o   "),
  text("          /         \     /         \          "),
  text("         /           \   /           \         "),
  text("        o      O       o       O      o        "),
  text("         \           /   \           /         "),
  text("          \         /     \         /          "),
  text("           o-------o       o-------o           ").
*/

% display_white_space(+Size)
% Displays the white space with the given size
display_white_space(0) :- !.
display_white_space(N) :-
  write(' '),
  N1 is N - 1,
  display_white_space(N1).

% display_bar(+Size)
% Displays the pattern 'o-------' with the given size
display_bar(0) :-
  write('o'), !.

display_bar(N) :-
  write('o-------'),
  N1 is N - 1,
  display_bar(N1).

display_pieces(_, _, Col, RowSize, ColSize) :-
  Col > ColSize, !.

display_pieces(Board, Line, Col, RowSize, ColSize) :-
  get_symbol(Board, Line, Col, Symbol),
  format('~a', [Symbol]),
  NC is Col + 1,
  display_pieces(Board, Line, NC, RowSize, ColSize).

% display_column_header(+Min, +Max)
% Displays the column header with the given min and max
display_column_header(Min, Max) :-
  format('~d', [Min]),
  Min1 is Min + 1,
  Min1 =< Max,
  display_column_header(Min1, Max).

display_row([]) :-
  write('\n').

display_row([H|T]) :-
  symbol(H, S),
  write(S),
  display_row(T).

display_rows([]).

display_rows([Line|Rem]) :-
  display_row(Line),
  display_rows(Rem).

display_board(Board) :-
  display_rows(Board).



:- consult(data).
:- consult(utils).

% display_row(+Line)
% Predicate to display a row of vertices on the game board
display_row([]) :-
  write('\n').
display_row([H|T]) :-
  vertice(H, V, _, _),
  symbol(V, S),
  write(S),
  display_row(T).

% display_rows(+Board)
% Predicate to display all rows on the game board
display_rows([]).
display_rows([Line|Rem]) :-
  display_row(Line),
  display_rows(Rem).

% display_board(+Board)
% Predicate to display the entire game board
display_board(Board) :-
  nl,
  display_rows(Board),
  write('\nB - Blue\n'),
  write('G - Green\n'),
  write('E - Empty\n').

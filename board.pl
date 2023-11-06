:- consult(data).
:- consult(utils).

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

display_row([]) :-
  write('\n').

display_row([H|T]) :-
  vertice(H, V, _, _),
  symbol(V, S),
  write(S),
  display_row(T).

display_rows([]).

display_rows([Line|Rem]) :-
  display_row(Line),
  display_rows(Rem).

display_board(Board) :-
  nl,
  assertall,
  display_rows(Board),
  write('\nB - Blue\n'),
  write('G - Green\n'),
  write('E - Empty\n').

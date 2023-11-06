:- dynamic name_of/2.
:- dynamic color_of/2.
:- dynamic vertice/4.
:- dynamic last_move/1.
:- dynamic valid_move/1.
:- dynamic counter/2.
:- dynamic game_over_bool/1.

% board(+Matrix)
% Matrix is a 7x13 matrix representing the board.
board([
  [n, n, n, n, n,   n, 1, d, d,  d, 2, n, n,  n, 3, d, d,   d, 4],
  [n, n, n, n, n,   r, n, n, n,  n, n, l, n,  r, n, n, n,   n, n, l],
  [n, n, n, n, 5,   n, n, n, fi, n, n, n, 6,  n, n, n, se,  n, n, n, 7],
  [n, n, n, n, n,   l, n, n, n,  n, n, r, n,  l, n, n, n,   n, n, r],
  [n, n, 8, d, d,   d, 9, d, d,  d, 10, d, d, d, 11, d, d,  d, 12, d, d, d, 13],
  [n, r, n, n, n,   n, n, l, n,  r, n, n, n,  n, n, l, n,   r, n, n, n, n, n, l],
  [14, n, n, n, th, n, n, n, 15, n, n, n, fo, n, n, n, 16,  n, n, n, fif, n, n,  n, 17],
  [n, l, n, n, n,   n, n, r, n,  l, n, n, n,  n, n, r, n,   l, n, n, n, n, n, r],
  [n, n, 18, d, d,  d, 19, d, d, d, 20, d, d, d, 21, d, d,  d, 22, d, d, d, 23],
  [n, n, n, n, n,   r, n, n, n,  n, n, l, n,  r, n, n, n,   n, n, l],
  [n, n, n, n, 24,  n, n, n, si, n, n, n, 25, n, n, n, sev, n, n, n, 26],
  [n, n, n, n, n,   l, n, n, n,  n, n, r, n,  l, n, n, n,   n, n, r],
  [n, n, n, n, n,   n, 27, d, d, d, 28, n, n, n, 29, d, d,  d, 30]
]).
assertall :-
  assert(vertice(n, n, [], false)),
  assert(vertice(d, d, [], false)),
  assert(vertice(r, r, [], false)),
  assert(vertice(l, l, [], false)),
  assert(vertice(e, e, [], false)),
  assert(vertice(fi, fi, [], false)),
  assert(vertice(se, se, [], false)),
  assert(vertice(th, th, [], false)),
  assert(vertice(fo, fo, [], false)),
  assert(vertice(fif, fif, [], false)),
  assert(vertice(si, si, [], false)),
  assert(vertice(sev, sev, [], false)),
  assert(vertice(1, b, [2, 5], false)),
  assert(vertice(2, g, [1, 6], false)),
  assert(vertice(3, b, [4, 6], false)),
  assert(vertice(4, g, [3, 7], false)),
  assert(vertice(5, g, [1, 9], false)),
  assert(vertice(6, e, [2, 3, 10, 11], false)),
  assert(vertice(7, b, [4, 12], false)),
  assert(vertice(8, b, [9, 14], false)),
  assert(vertice(9, e, [5, 8, 10, 15], false)),
  assert(vertice(10, e, [6, 9, 11, 15], false)),
  assert(vertice(11, e, [6, 10, 12, 16], false)),
  assert(vertice(12, e, [7, 11, 13, 16], false)),
  assert(vertice(13, g, [12, 17], false)),
  assert(vertice(14, g, [8, 18], false)),
  assert(vertice(15, e, [9, 10, 14, 20], false)),
  assert(vertice(16, e, [11, 12, 21, 22], false)),
  assert(vertice(17, b, [13, 23], false)),
  assert(vertice(18, b, [14, 19], false)),
  assert(vertice(19, e, [15, 18, 20, 24], false)),
  assert(vertice(20, e, [15, 19, 21, 25], false)),
  assert(vertice(21, e, [16, 20, 22, 25], false)),
  assert(vertice(22, e, [16, 21, 23, 26], false)),
  assert(vertice(23, g, [17, 22], false)),
  assert(vertice(24, g, [19, 27], false)),
  assert(vertice(25, e, [20, 21, 28, 29], false)),
  assert(vertice(26, b, [22, 30], false)),
  assert(vertice(27, b, [24, 28], false)),
  assert(vertice(28, g, [25, 27], false)),
  assert(vertice(29, b, [25, 30], false)),
  assert(vertice(30, g, [26, 29], false)),
  asserta(last_move(0)),
  asserta(valid_move(1)),
  asserta(counter(player_1, 0)),
  asserta(counter(player_2, 0)),
  asserta(game_over_bool(0)).

hexagon(1, [1, 2, 6, 10, 9, 5]).
hexagon(2, [3, 4, 7, 12, 11, 6]).
hexagon(3, [8, 9, 15, 19, 18, 14]).
hexagon(4, [10, 11, 16, 21, 20, 15]).
hexagon(5, [12, 13, 17, 23, 22, 16]).
hexagon(6, [19, 20, 25, 28, 27, 24]).
hexagon(7, [21, 22, 26, 30, 29, 25]).

% other_player(+CurrentPlayer, -NextPlayer)
% Changes the current player to the next player.
other_player(player_1, player_2).
other_player(player_2, player_1).

% symbol(+Player, -Symbol)
% Translates the pieces to symbols.
symbol(n, ' ').
symbol(e, 'E').
symbol(center, 'o').
symbol(b, 'B').
symbol(g, 'G').
symbol(r, '/').
symbol(l, '\\').
symbol(d, '-').
symbol(fi, '1').
symbol(se, '2').
symbol(th, '3').
symbol(fo, '4').
symbol(fif, '5').
symbol(si, '6').
symbol(sev, '7').

color(b, 1).
color(g, 2).

other_color(1, 2).
other_color(2, 1).

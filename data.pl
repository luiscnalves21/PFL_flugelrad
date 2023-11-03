:- dynamic name_of/2.
:- dynamic color_of/2.
:- dynamic difficulty/2.

% board(+Matrix)
% Matrix is a 7x13 matrix representing the board.
board([
  [n, n, n, n, n,  n, b, d, d,  d, g, n, n,  n, b, d, d,   d, g],
  [n, n, n, n, n,  r, n, n, n,  n, n, l, n,  r, n, n, n,   n, n, l],
  [n, n, n, n, g,  n, n, n, fi, n, n, n, e,  n, n, n, se,  n, n, n, b],
  [n, n, n, n, n,  l, n, n, n,  n, n, r, n,  l, n, n, n,   n, n, r],
  [n, n, b, d, d,  d, e, d, d,  d, e, d, d,  d, e, d, d,   d, e, d, d, d, g],
  [n, r, n, n, n,  n, n, l, n,  r, n, n, n,  n, n, l, n,   r, n, n, n, n, n, l],
  [g, n, n, n, th, n, n, n, e,  n, n, n, fo, n, n, n, e,   n, n, n, fif, n, n,  n, b],
  [n, l, n, n, n,  n, n, r, n,  l, n, n, n,  n, n, r, n,   l, n, n, n, n, n, r],
  [n, n, b, d, d,  d, e, d, d,  d, e, d, d,  d, e, d, d,   d, e, d, d, d, g],
  [n, n, n, n, n,  r, n, n, n,  n, n, l, n,  r, n, n, n,   n, n, l],
  [n, n, n, n, g,  n, n, n, si, n, n, n, e,  n, n, n, sev, n, n, n, b],
  [n, n, n, n, n,  l, n, n, n,  n, n, r, n,  l, n, n, n,   n, n, r],
  [n, n, n, n, n,  n, b, d, d,  d, g, n, n,  n, b, d, d,   d, g]
]).

vertice(1, b, [2, 5]).
vertice(2, g, [1, 6]).
vertice(3, b, [4, 6]).
vertice(4, g, [3, 7]). 
vertice(5, g, [1, 9]).
vertice(6, e, [2, 3, 10, 11]).
vertice(7, b, [4, 12]).
vertice(8, b, [9, 14]).
vertice(9, e, [5, 8, 10, 15]).
vertice(10, e, [6, 9, 11, 15]).
vertice(11, e, [6, 10, 12, 16]).
vertice(12, e, [7, 11, 13, 16]).
vertice(13, g, [12, 17]).
vertice(14, g, [8, 18]).
vertice(15, e, [9, 10, 14, 20]).
vertice(16, e, [11, 12, 21, 22]).
vertice(17, b, [13, 23]).
vertice(18, b, [14, 19]).
vertice(19, e, [15, 18, 20, 24]).
vertice(20, e, [15, 19, 21, 25]).
vertice(21, e, [16, 20, 22, 25]).
vertice(22, e, [16, 21, 23, 26]).
vertice(23, g, [17, 22]).
vertice(24, g, [19, 27]).
vertice(25, e, [20, 21, 28, 29]).
vertice(26, b, [22, 30]).
vertice(27, b, [24, 28]).
vertice(28, g, [25, 27]).
vertice(29, b, [25, 30]).
vertice(30, g, [26, 29]).

hexagon(1, [1, 2, 6, 10, 9, 5]).
hexagon(2, [3, 4, 7, 12, 11, 6]).
hexagon(3, [8, 9, 15, 19, 18, 14]).
hexagon(4, [10, 11, 16, 21, 20, 15]).
hexagon(5, [12, 13, 17, 23, 22, 16]).
hexagon(6, [19, 20, 25, 28, 27, 24]).
hexagon(7, [21, 22, 26, 30, 29, 25]).

graph([1, 2, 3, 4, 5, 6, 7]).

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
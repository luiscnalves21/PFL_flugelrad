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

coord_state([
  [[1, 7, b],  [1, 11, g], [3, 13, e],  [5, 11, e],  [5, 7, e],   [3, 5, g]  ],
  [[1, 15, b], [1, 19, g], [3, 21, b],  [5, 19, e],  [5, 15, e],  [3, 13, e] ],
  [[5, 3, b],  [5, 7, e],  [7, 9, e],   [9, 7, e],   [9, 3, b],   [7, 1, g]  ],
  [[5, 11, e], [5, 15, e], [7, 17, e],  [9, 15, e],  [9, 11, e],  [7, 9, e]  ],
  [[5, 19, e], [5, 23, g], [7, 25, b],  [9, 23, g],  [9, 19, e],  [7, 17, e] ],
  [[9, 7, e],  [9, 11, e], [11, 13, e], [13, 11, g], [13, 7, b],  [11, 5, g] ],
  [[9, 15, e], [9, 19, e], [11, 21, b], [13, 19, g], [13, 15, b], [11, 13, e]]
]).

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
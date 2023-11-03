:- dynamic name_of/2.

:- dynamic difficulty/2.

% board(+Matrix)
% Matrix is a 7x13 matrix representing the board.
board_state([
  [null,   null,   null,   null,   null,   null,   blue,   dash, dash,   dash, green,  null, null,   null, blue,   dash, dash,   dash, green,  null, null,   null, null,  null, null],
  [null, null, null, null, null, rb, null, null, null, null, null, lb, null, rb, null, null, null, null, null, lb],
  [null,   null,   null,   null,   green,  null,   null,   null, center, null, null,   null, empty,  null, null,   null, center, null, null,   null, blue,   null, null,  null],
  [null, null, null, null, null, lb, null, null, null, null, null, rb, null, lb, null, null, null, null, null, rb, null, null],
  [null,   null,   blue,  dash, dash,   dash,   empty,  dash, dash,   dash, empty,  dash, dash,   dash, empty,  dash, dash,   dash, empty,  dash, dash,   dash, green, null, null],
  [null, rb, null, null, null, null, null, lb, null, rb, null, null, null, null, null, lb, null, rb, null, null, null, null, null, lb],
  [green,  null,   null,   null,   center, null,   null,   null, empty,  null, null,   null, center,   null, null,   null, empty,  null, null,   null, center, null, null,  null, blue],
  [null, lb, null, null, null, null, null, rb, null, lb, null, null, null, null, null, rb, null, lb, null, null, null, null, null, rb],
  [null,   null,   blue,   dash, dash,   dash,   empty,  dash, dash,   dash, empty,  dash, dash,   dash, empty,  dash, dash,   dash, empty,  dash, dash,   dash, green, null, null],
  [null, null, null, null, null, rb, null, null, null, null, null, lb, null, rb, null, null, null, null, null, lb, null, null],
  [null,   null,   null,   null,   green,  null,   null,   null, center, null, null,   null, empty,  null, null,   null, center, null, null,   null, blue,   null, null,  null, null],
  [null, null, null, null, null, lb, null, null, null, null, null, rb, null, lb, null, null, null, null, null, rb],
  [null,   null,   null,   null,   null,   null,   blue,   dash, dash,   dash, green,  null, null,   null, blue,   dash, dash,   dash, green,  null, null,   null, null,  null, null]
  ]).

% other_player(+CurrentPlayer, -NextPlayer)
% Changes the current player to the next player.
other_player(player_1, player_2).
other_player(player_2, player_1).

% symbol(+Player, -Symbol)
% Translates the pieces to symbols.
symbol(null, ' ').
symbol(empty, 'E').
symbol(center, 'o').
symbol(blue, 'B').
symbol(green, 'G').
symbol(rb, '/').
symbol(lb, '\\').
symbol(dash, '-').
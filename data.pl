% board(+Matrix)
% Matrix is a 7x13 matrix representing the board.
board([
  [null,  blue,  null,  empty, null,  empty, null,  empty, null,  empty, null,  green, null],
  [null,  null,  green, null,  null,  null,  empty, null,  null,  null,  blue,  null,  null],
  [null,  null,  null,  blue,  null,  green, null,  blue,  null,  green, null,  null,  null],
  [green, null,  null,  null,  empty, null,  null,  null,  empty, null,  null,  null,  blue],
  [null,  blue,  null,  empty, null,  empty, null,  empty, null,  empty, null,  green, null],
  [null,  null,  green, null,  null,  null,  empty, null,  null,  null,  blue,  null,  null],
  [null,  null,  null,  blue,  null,  green, null,  blue,  null,  green, null,  null,  null]
  ]).

% other_player(+CurrentPlayer, -NextPlayer)
% Changes the current player to the next player.
other_player(player1, player2).
other_player(player2, player1).

% symbol(+Player, -Symbol)
% Translates the pieces to symbols.
symbol(null, '').
symbol(empty, ' ').
symbol(blue, 'B').
symbol(green, 'G').
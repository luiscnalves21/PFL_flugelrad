:- consult(board).

display_game :-
  board_state(Board),
  display_board(Board).
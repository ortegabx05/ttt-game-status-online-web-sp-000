# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[2,4,6]
]

def won?(board)
winner = nil
empty_board = board.all? {|x| x == " "}
WIN_COMBINATIONS.each do |winner_combination|
    if empty_board
      return false
    elsif winner_combination.all? { |value| board[value] =="X" } || winner_combination.all? { |value| board[value] =="O" }
      winner = winner_combination
    end
  end
  winner
end

def full?(board)
   board.all? {|position| position == "X" || position == "O"}
end

def draw?(board)
   if !won?(board) && full?(board)
     return true
   else won?(board)
     false
   end
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  else 
    return false
  end
end 

def winner(board)
  if won?(board)
   board[won?(board)[0]]
  end
end

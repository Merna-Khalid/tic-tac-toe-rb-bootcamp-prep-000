
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player = "X")
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

def play(board)
  counter = 0
  until counter == 9
    turn(board)
    counter += 1
  end
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def check(board, token='X')
  return state = WIN_COMBINATIONS.detect do |one_state|
    one_state.all? { |i| board[i] == token}
  end
end

def won?(board)
  x_state = check(board, 'X')
  o_state = check(board, 'O')
  if x_state != nil
    return x_state
  elsif o_state != nil
    return o_state
  end
  return false
end

def full?(board)
  empty = board.detect do |cell|
    cell == " " || cell == nil
  end
  if empty == nil
    return true
  end
  false
end

def draw?(board)
  if won?(board)
    return false
  elsif full?(board)
    return true
  end
  false
end

def over?(board)
  if won?(board)
    return true
  elsif full?(board)
    return true
  end
  return false
end

def winner(board)
  if check(board, 'X')
    return 'X'
  elsif check(board, 'O')
    return 'O'
  end
  nil
end

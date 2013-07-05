class Tictactoe
  attr_accessor :squares_in_play, :board_rows, :board_cols
  
  def initialize
    # columns and rows
    @board_rows = 3
    @board_cols = 3
    
    # initialize the array
    @squares_in_play = Array.new;
    
    # creates square board objects and populates them in an array
    for row in 1..board_rows
      for col in 1..board_cols
        square = Square.new(row, col)
        squares_in_play.push(square)
      end
    end
    
  end
  
  def print_board
    for row in 1..board_rows
      for col in 1..board_cols
        for square in squares_in_play
          if square.board_row == row && square.board_col == col
            print "#{square.mark}|"
          end
        end
      end
      
      print "\n"
      print "------"
      print "\n"
    end
  end
  
  def user_move
    user_inputting = true
    
    while user_inputting
      print "Enter Move\n"
      print "Select Row (1-3)"
      row = gets.chomp
      print "Select Col (1-3)"
      col = gets.chomp
      
      for square in squares_in_play
        if square.board_row == row.to_i && square.board_col == col.to_i && square.mark == " "
            square.mark = "x"
            user_inputting = false
        end
      end
    end
  end
  
  def computer_move
    search_for_open_spot = true
    
    while search_for_open_spot
      row = rand(1..3)
      col = rand(1..3)
      
      for square in squares_in_play
        if square.board_row == row.to_i && square.board_col == col.to_i && square.mark == " "
          square.mark = "o"
          search_for_open_spot = false
        end
      end
      
    end
    
    
  end
  
  def game_score
    if selection = check_rows
      return selection
    elsif selection = check_cols
      return selection
    elsif selection = check_diagonal
      return selection
    elsif !open_slot
      return "Game over Draw"
    else 
      return false
    end
  end
  
  def check_rows
    row_one = squares_in_play[0].mark+squares_in_play[1].mark+squares_in_play[2].mark
    row_two = squares_in_play[3].mark+squares_in_play[4].mark+squares_in_play[5].mark
    row_three = squares_in_play[6].mark+squares_in_play[7].mark+squares_in_play[8].mark
    
    if row_one == "xxx" || row_two == "xxx" || row_three == "xxx"
      return "Player Wins"
    elsif row_one == "ooo" || row_two == "ooo" || row_three == "ooo"
      return "Computer Wins"
    else
      return false
    end
  end
  
  def check_cols
    col_one = squares_in_play[0].mark+squares_in_play[3].mark+squares_in_play[6].mark
    col_two = squares_in_play[1].mark+squares_in_play[4].mark+squares_in_play[7].mark
    col_three = squares_in_play[2].mark+squares_in_play[5].mark+squares_in_play[8].mark
    
    if col_one == "xxx" || col_two == "xxx" || col_three == "xxx"
      return "Player Wins"
    elsif col_one == "ooo" || col_two == "ooo" || col_three == "ooo"
      return "Computer Wins"
    else
      return false
    end
  end
  
  def check_diagonal
    diagonal_one = squares_in_play[0].mark+squares_in_play[4].mark+squares_in_play[8].mark
    diagonal_two = squares_in_play[2].mark+squares_in_play[4].mark+squares_in_play[6].mark
    
    if diagonal_one == "xxx" || diagonal_two == "xxx"
      return "Player Wins"
    elsif diagonal_one == "ooo" || diagonal_two == "ooo"
      return "Computer Wins"
    else
      return false
    end
  end

  def open_slot
    for square in squares_in_play
      if square.mark == " "
        return true
      end
    end
    
    return false
  end
  
end

class Square
  attr_accessor :board_row, :board_col, :mark
  
  def initialize(row, col)
    @board_row = row
    @board_col = col
    @mark = " "
  end
  
  
end




gameIsRunning = true
game = Tictactoe.new

while gameIsRunning
  
  #game.squares_in_play.each {|square| puts "#{square.board_row} , #{square.board_col}"}
  
  game.print_board
  
  game.user_move
  
  if winner = game.game_score
    puts winner
    gameIsRunning = false
    game.print_board
    break
  end
  
  game.computer_move
  
  # should be a bool
  if winner = game.game_score
    puts winner
    gameIsRunning = false
    game.print_board
    break
  end
  

  
  
  
end
class Game

  def initialize()
    @number_of_players = 0
    @question = Question.new
    @players = []
    @current_player = nil
  end
  
  def start
    while @number_of_players < 2 do
      puts "Player 1, enter your name"
      print "> "
      name_one = $stdin.gets.chomp
      
      if @number_of_players == 0
        @player_one = Player.new(name_one)
        @number_of_players += 1
        @players.push(@player_one)
      end
      
      puts "Player 2, enter your name"
      print "> "
      name_two = $stdin.gets.chomp
      
      if @number_of_players == 1
        @player_two = Player.new(name_two)
        @number_of_players += 1
        @players.push(@player_two)
      end

      @current_player = @players.first
    end
    
    turns
  end

  def turns
    loop do
      puts "----- NEW TURN -----"
      @question.generate_question(@current_player.name)
      print "> "
      answer = $stdin.gets.chomp.to_i

      if answer == @question.answer
        puts "Yay, you is so so smart!"
      else
        @current_player.change_lives
        puts "Booooooooo!! You is incorrect, you lose life! Current life: #{@current_player.lives}/3"
      end

       @players.rotate!
       @current_player = @players.first

      if @player_one.lives == 0 || @player_two.lives == 0      
        puts "Baiiii loser :)"
        puts "----- GAME OVER -----"
      break
      end
    end
  end
end 
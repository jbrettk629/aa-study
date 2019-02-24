# Exercise Goal:
#     - The goal of this exercise is to show us how you apply software engineering 
#     principles to create a maintainable software solution.

#     How to approach this:

#             - Don't worry about persistence. It would make sense here, but for this
#             exercise only use in-memory data structures.
#             - Don't worry about tricks or "gotchyas", as there aren't any.
#             - Just focus on writing clean maintainable code.



# Specification:
#     Create a class LeaderBoard whose interface includes the following methods:
	#     Method Name: add_score
	#     Method Name: top
	#     Method Name: reset

# Example Usage:

#     // Create a new LeaderBoard Instance
#     LeaderBoard leader_board = new LeaderBoard();

#     // Add scores for players to the LeaderBoard
#     leader_board.add_score(1, 50); // 50.0
#     leader_board.add_score(2, 80); // 80.0
#     leader_board.add_score(2, 70); // 75.0
#     leader_board.add_score(2, 60); // 70.0
#     leader_board.add_score(3, 90); // 90.0
#     leader_board.add_score(3, 85); // 87.5

#     // Get top positions for the leaderboard
#     leader_board.top(3); // [3, 2, 1]
#     leader_board.top(2); // [3, 2]
#     leader_board.top(1); // [3]

#     // Reset a player 3's scores
#     leader_board.reset(3); // void

#     // Player 3 is now at the bottom of the leaderboard
#     leader_board.top(3); // [2, 1, 3]

# Expected values

#     - Player IDs will always be positive integers small enough to be 
#     stored as a signed 32-bit integer Scores are integers ranging from 0-100


# We have provided stubbed out code and tests for you below. Please note that these tests are not exhaustive and do not cover all corner cases. We recommend extending the given tests to ensure your code is correct.



# Your code goes here. Feel free to make helper classes if needed

class Game 
	
	def initialize
		@leaderboard = LeaderBoard.new
		@players = {}
		@id = 1
	end 

	def add_player
		new_player = Player.new(@id)
		@players = 
		@id += 1
	end
end


class LeaderBoard

  attr_reader :players, :averages

  def initialize
    @player_count = 0
    @players = {}
    @averages = {}
  end

  def add_score(player_id, score)
    if @players[player_id] == nil
      @players[player_id] = Player.new(player_id)
      @player_count += 1
    end
    @players[player_id].add_score(score)
    @averages[player_id] = @players[player_id].average
    @players[player_id].average
  end

	def top(num)
		
    if (num <= 0) || (num % 1 != 0)
      print "You must choose an integer greater than 0\n"
      return
		end
		
    num = @player_count if num > @player_count
    sorted_avgs = @averages.sort_by {|player_id, avg| avg}.reverse
		top_players = []
		
    i = 0
    while i < num
      top_players << sorted_avgs[i][0]
      i+=1
		end
		
    top_players
  end

  def reset(player_id)
    if !@players[player_id] 
      print "That player doesn't exist\n"
      return
    end    
    @players[player_id].clear_scores
    @averages[player_id] = @players[player_id].average
  end
end

class Player

  attr_reader :scores, :average

	def initialize(player_id)
		@id = player_id
    @score_count = 0
    @total_score = 0
    @average = 0
    @scores = []
  end

  def add_score(score)
    @scores << []
    calculate_average(score)
  end

  def clear_scores
    @score_count = 0
    @total_score = 0
    @scores = []
    @average = 0
  end
  
  def calculate_average(new_score) 
    @total_score += new_score
    @score_count += 1
    @average = @total_score / @score_count.to_f
  end

end

# Here is some example test code. It doesn't test everything. feel free to expand upon it.
leader_board = LeaderBoard.new()
leader_board.add_score(1, 50)
puts(leader_board.add_score(2, 80) == 80)
puts(leader_board.add_score(2, 70) == 75)
puts(leader_board.add_score(2, 60) == 70)
puts(leader_board.add_score(3, 90) == 90)
puts(leader_board.add_score(3, 85) == 87.5)

puts(leader_board.top(3) == [3, 2, 1])
puts(leader_board.top(2) == [3, 2])
puts (leader_board.top(2.5) == nil)
leader_board.reset(5)
leader_board.reset(-1)
leader_board.reset(3)
puts(leader_board.top(5) == [2, 1, 3])
print leader_board.averages
#  */

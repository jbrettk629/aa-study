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

#

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
class LeaderBoard
  
  attr_reader :scores
  
  def initialize
    @scores = Hash.new {|h, k| h[k] = [] }
    @averages = Hash.new(0)
  end
  
  
  def add_score(player_id, score)
    @scores[player_id]
    players_scores = @scores[player_id] << score
    
    average = players_scores.inject(:+) / players_scores.count.to_f 
    @averages[player_id] = average

    @averages[player_id]
  end

  def top(num_players)
      sorted_averages = @averages.sort_by { |id, avg | avg }.reverse

      i = 0
      top_players = []
      while i < num_players
        top_players << sorted_averages[i][0]
        i += 1
      end

    top_players
  end
    
  def reset(player_id)
    @scores[player_id] = []
    @averages[player_id] = 0
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
leader_board.reset(3)
puts(leader_board.top(3) == [2, 1, 3])
print leader_board.scores
#  */

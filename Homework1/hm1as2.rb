class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner (game)
  raise WrongNumberOfPlayersError unless game.length == 2
  first_player = game[0]
  second_player = game[1]
  raise NoSuchStrategyError unless check_chose?(first_player[1]) and check_chose?(second_player[1])
  if find_winner?(first_player, second_player)
    first_player
    #puts first_player
  else
    second_player
    #puts second_player
  end  
end

def rps_tournament_winner(tournament)
  if(tournament[0][0].is_a?(String))
    rps_game_winner(tournament)
  else
    first_winner = rps_tournament_winner(tournament[0])
    second_winner = rps_tournament_winner(tournament[1])
    rps_game_winner [first_winner, second_winner]
  end
end

def check_chose? (player_chose)
  array_of_choises = ["r", "p", "s"]
  array_of_choises.include? player_chose.downcase 
end

def find_winner? (first_player, second_player)
  first_player_choose =first_player[1].downcase
  second_player_choose = second_player[1].downcase
  
  if ((first_player_choose == "r" && second_player_choose == "s") or
        (first_player_choose == "s" && second_player_choose == "p") or
        (first_player_choose == "p" && second_player_choose == "r") or
        (first_player_choose == second_player_choose))
    true
  else
    false 
  end      
end

#rps_game_winner( [ [ "asdf", "P" ], [ "qwerty", "s" ] ] )
#rps_tournament_winner ([ [ [ ["Armando", "P"], ["Dave", "S"]],  [ ["Richard", "R"], ["Michael", "S"]]],[[ ["Allen", "S"], ["Omer", "P"]],[ ["David E.", "R"], ["Richard X", "P"]]]])

tournament = [ [ [ ["Armando", "P"], ["Dave", "S"]],  [ ["Richard", "R"], ["Michael", "S"]]],[[ ["Allen", "S"], ["Omer", "P"]],[ ["David E.", "R"], ["Richard X", "P"]]]]

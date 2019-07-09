require "pry"

def game_hash 
  game_hash = {
    :home => {
              :team_name => "Brooklyn Nets",
              :colors => ["Black", "White"],
              :players => {
                    "Alan Anderson" => { 
                            :number => 0,
                            :shoe => 16, 
                            :points => 22,
                            :rebounds => 12, 
                            :assists => 12, 
                            :steals => 3, 
                            :blocks => 1, 
                            :slam_dunks => 1
                          },
                    "Reggie Evans" => {
                            :number => 30,
                            :shoe => 14, 
                            :points => 12,
                            :rebounds => 12, 
                            :assists => 12, 
                            :steals => 12, 
                            :blocks => 12, 
                            :slam_dunks => 7
                          },
                    "Brook Lopez" => {
                            :number => 11,
                            :shoe => 17, 
                            :points => 17,
                            :rebounds => 19, 
                            :assists => 10, 
                            :steals => 3, 
                            :blocks => 1, 
                            :slam_dunks => 15 
                          },
                   "Mason Plumlee" => {
                            :number => 1,
                            :shoe => 19, 
                            :points => 26,
                            :rebounds => 11, 
                            :assists => 6, 
                            :steals => 3, 
                            :blocks => 8, 
                            :slam_dunks => 5
                          },
                  "Jason Terry" => {
                            :number => 31,
                            :shoe => 15, 
                            :points => 19,
                            :rebounds => 2, 
                            :assists => 2, 
                            :steals => 4, 
                            :blocks => 11, 
                            :slam_dunks => 1 
                          }
              }
       }, 
    :away => {
              :team_name => "Charlotte Hornets",
              :colors => ["Turquoise", "Purple"],
              :players => {
                  "Jeff Adrien" => {
                            :number => 4,
                            :shoe => 18, 
                            :points => 10,
                            :rebounds => 1, 
                            :assists => 1, 
                            :steals => 2, 
                            :blocks => 7, 
                            :slam_dunks =>2 
                          },
                  "Bismack Biyombo" => {
                            :number => 0,
                            :shoe => 16, 
                            :points => 12,
                            :rebounds => 4, 
                            :assists => 7, 
                            :steals => 22, 
                            :blocks => 15, 
                            :slam_dunks => 10 
                          },
                  "DeSagna Diop" => {
                            :number => 2,
                            :shoe => 14, 
                            :points => 24,
                            :rebounds => 12, 
                            :assists => 12, 
                            :steals => 4, 
                            :blocks => 5, 
                            :slam_dunks => 5 
                          },
                 "Ben Gordon" => {
                            :number => 8,
                            :shoe => 15, 
                            :points => 33,
                            :rebounds => 3, 
                            :assists => 2, 
                            :steals => 1, 
                            :blocks => 1, 
                            :slam_dunks => 0 
                          },
                 "Kemba Walker" => {
                            :number => 33,
                            :shoe => 15, 
                            :points => 6,
                            :rebounds => 12, 
                            :assists => 12, 
                            :steals => 7, 
                            :blocks => 5, 
                            :slam_dunks => 12
                 }
              }
    }
  }
                    
end

def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, data|
      #binding.pry
        if player_name == name
         return data[:points]
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, data|
      if player_name == name 
        return data[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end

def team_names()
   game_hash.collect do |location, team_data|
    team_data[:team_name]
   end
end

def player_numbers(team)
 arr = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, data|
       #binding.pry
      if team_data[:team_name] == team 
        arr << team_data[:players][name][:number]
      end
    end
  end
  return arr
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, data|
      if player_name == name 
        return team_data[:players][name]
      end
    end
  end
end

def big_shoe_rebounds
  largest_shoe = 0 
  rebounds = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, data|
      if largest_shoe < data[:shoe]
        largest_shoe = data[:shoe]
        player = name
        rebounds = data[:rebounds]
      end
    end
  end
  return rebounds
end

def most_points_scored
  most_points = 0 
  player_name = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, data|
      if most_points < data[:points]
        most_points = data[:points]
        player_name = name 
      end
    end
  end
  return player_name
end

def winning_team
  home_points = 0 
  away_points = 0 
  winning_team = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, data|
      if location == :home
        home_points += data[:points]
      else 
        away_points += data[:points]
      end 
    end 
  end
  if home_points > away_points
    return game_hash[:home][:team_name]
  else 
    return game_hash[:away][:team_name]
  end
end

=begin
def player_with_longest_name
  longest = 0
  player_name = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, value|
      if name.length > longest
        longest = name.length
        player_name = name
      end
    end
  end
  player_name
end

def long_name_steals_a_ton?
  name_with_steal = "" 
  steals_number = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, data|
      if data[:steals] > steals_number
        name_with_steal = name
        #binding.pry
      end
    end
  end
  name_with_steal != player_with_longest_name ? true : false
end
=end

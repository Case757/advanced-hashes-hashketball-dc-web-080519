require 'pry'

def game_hash
    game_hash = {
        :home => {
            :team_name => "Brooklyn Nets", 
            :colors => ["Black", "White"],
            :players => [
                {:player_name => "Alan Anderson", :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1}, 
                {:player_name => "Reggie Evans", :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
                {:player_name => "Brook Lopez", :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
                {:player_name => "Mason Plumlee", :number => 1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
                {:player_name => "Jason Terry", :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}]},
        :away => {
            :team_name => "Charlotte Hornets",
            :colors => ["Turquoise", "Purple"], 
            :players => [
                {:player_name => "Jeff Adrien", :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
                {:player_name => "Bismack Biyombo", :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10},
                {:player_name => "DeSagna Diop", :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
                {:player_name => "Ben Gordon", :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
                {:player_name => "Kemba Walker", :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12} ] } }
    game_hash
end

def num_points_scored(name)
    home = game_hash[:home][:players]
    away = game_hash[:away][:players]
    team_players = home + away
    team_players.each do |values|
        values.each do |category, statistic|
            if statistic == name
                return values[:points]
            end
        end
    end
end

def shoe_size(name)
    home = game_hash[:home][:players]
    away = game_hash[:away][:players]
    team_players = home + away
    team_players.each do |values|
        values.each do |category, statistic|
            if statistic == name
                return values[:shoe]
            end
        end
    end
end

def team_colors(name)
    home = game_hash[:home]
    away = game_hash[:away]
    home.each do |key, value|
        if value == name
            return home[:colors]
        else
            away.each do |key, value|
                if value == name
                    return away[:colors]
                end
            end
        end
    end
end

def team_names
    myArr = []
    myArr.push(game_hash[:home][:team_name])
    myArr.push(game_hash[:away][:team_name])
    myArr
end

def player_numbers(team)
    home = game_hash[:home][:team_name]
    away = game_hash[:away][:team_name]
    home_players = game_hash[:home][:players]
    away_players = game_hash[:away][:players]
    numArray = []
    if home == team
        home_players.each do |player|
            numArray.push(player[:number])
        end
    end
    if away == team
        away_players.each do |player|
            numArray.push(player[:number])
        end
    end
    numArray
end

def player_stats(name)
    home = game_hash[:home][:players]
    away = game_hash[:away][:players]
    team_players = home + away
    team_players.each do |player|
        if player[:player_name] == name
            player.delete(:player_name)
            return player
        end
    end
end

def big_shoe_rebounds
    home = game_hash[:home][:players]
    away = game_hash[:away][:players]
    team_players = home + away
    shoe_size = 0
    bigfoot = ""
    team_players.each do |player|
        if player[:shoe] > shoe_size
            shoe_size = player[:shoe]
            bigfoot = player[:player_name]
        end
    end
    team_players.each do |player|
        if player[:player_name] == bigfoot
            return player[:rebounds]
        end
    end    
end

def most_points_scored
    top_score = 0
    top_player = ""
    home = game_hash[:home][:players]
    away = game_hash[:away][:players]
    team_players = home + away
    team_players.each do |player|
        if player[:points] > top_score
            top_score = player[:points]
            top_player = player[:player_name]
        end
    end
    top_player
end

def winning_team
    home_score = 0
    away_score = 0
    home = game_hash[:home][:players]
    away = game_hash[:away][:players]
    home.each do |player|
        home_score += player[:points]
    end
    away.each do |player|
        away_score += player[:points]
    end
    if home_score > away_score
        game_hash[:home][:team_name]
    else
        game_hash[:away][:team_name]
    end
end

def player_with_longest_name
    longest_name_length = 0
    longest_name = ""
    home = game_hash[:home][:players]
    away = game_hash[:away][:players]
    team_players = home + away
    team_players.each do |player|
        if player[:player_name].length > longest_name_length
            longest_name_length = player[:player_name].length
            longest_name = player[:player_name]
        end
    end
    longest_name
end

def long_name_steals_a_ton?
    longest_name_length = 0
    longest_name = ""
    home = game_hash[:home][:players]
    away = game_hash[:away][:players]
    team_players = home + away
    most_steals = 0
    team_players.each do |player|
        if player[:player_name].length > longest_name_length
            longest_name_length = player[:player_name].length
            longest_name = player[:player_name]
        end
    end
    team_players.each do |player|
        if player[:steals] > most_steals
            most_steals = player[:steals]
        end
    end
    team_players.each do |player|
        if (player[:player_name] == longest_name) && (player[:steals] == most_steals)
            return true 
        else
            false
        end
    end
end

    


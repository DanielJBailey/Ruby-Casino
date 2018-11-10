require_relative './player'
require 'sounder'
# require_relative './Games/rockpaperscissors.rb'
# require_relative './Games/roulette.rb'
# require_relative './Games/slots.rb'


Sounder::System.set_volume 50 # 0-100

@ambience = Sounder::Sound.new "./Assets/ambience_casino.mp3"
# @ambience.play


class Casino < Player
    def initialize
        @available_games = [
            "High / Low", 
            "Rock, Paper, Scissors", 
            "Roulette",
            "Slots",
            "Cashier",
            "Exit Casino"
        ]
        casino_menu
    end
    
    def casino_menu
        puts
        puts
        @available_games.each_with_index do |game, index|
            puts "#{index + 1}) #{game}".yellow
        end
        puts "Enter your choice:"
        choice = gets.strip.to_i
        handle_user_choice(choice)
    end 

    def handle_user_choice(choice)
        case choice
        when 1
            # High / Low
        when 2
            # Rock, Paper, Scissors
        when 3
            # Roulette
        when 4
            # Slots
        when 5
            # Cashier
        when 6
            # Exit
        else
            # Recall menu
        end
    end
end

x = Player.new

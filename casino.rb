require_relative './player'
# require_relative './Games/rockpaperscissors.rb'
# require_relative './Games/roulette.rb'
# require_relative './Games/slots.rb'

class Casino < Player
    def initialize
        @games = [
            "High/Low", 
            "Rock, Paper, Scissors", 
            "Roulette",
            "Slots"
        ]
        casino_menu
    end
    
    def casino_menu
        @games.each_with_index do |game, index|
            puts "#{index + 1}) #{game}"
        end
        puts "Enter your choice:"
        choice = gets.strip.to_i
        handle_user_choice(choice)
    end 

    def handle_user_choice(choice)
        case choice
        when 1
            HighnLow.new
        else
            # else
        end
    end
end

x = Player.new

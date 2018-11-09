# Harlan

class HighnLow
    def initialize
        start_game
    end
    
    def start_game
        puts "Welcome , are you ready to play High n Low?"
        #menu to play or to quit
        #place bet
        #dealer presents a card
        #ask if higher or lower
        #show dealer card
        #puts win or lose, loop back to menu
        highnlow_menu
    end

    
    def how_much_to_bet
        puts "How much would you like to bet?"
        bet = gets.strip.to_i
        puts bet
        if bet == 0 
            puts 'Invalid number idiot'
            how_much_to_bet
        end
    end
    
    def play_game
        #dealer presents card
        #ask 
    end
    
    def return_to_main_menu
        # Casino.casino_menu
    end
    
    
    def highnlow_menu
        puts "Would you like to:"
        puts "(1 Play a game?"
        puts "(2 Return to main menu" 
        user_choice = gets.to_i
        case user_choice
        when 1
           how_much_to_bet
        when 2
            return_to_main_menu
        else 
            puts "Please enter 1 or 2 you idiot!"
            highnlow_menu
        end
    end

    def quit_game
        puts ""
    end
end

HighnLow.new
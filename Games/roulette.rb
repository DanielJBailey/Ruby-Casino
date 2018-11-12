# Betting Options
# EVEN
# ODD
# 1-12
# 13 - 24
# 25 - 36
# RED
# BLACK
# 1 - 18
# 19 - 36
# 0
# 00



def start_roulette
    @start = Sounder::Sound.new "./Assets/roulette_intro.mp3"
    @spin = Sounder::Sound.new "./Assets/roulette_spin.mp3"
    @start.play
    check_starting_balance
end

def check_starting_balance
    if @money == 0
        puts
        puts "Sorry, you don't have enough money to play Roulette!".yellow
        puts "Would you like to go back to the cashier so you can deposit more money? (y/n)".yellow
        choice = gets.downcase.strip.to_s
        if choice == 'y'
            cashier
        elsif choice == 'n'
            puts "Sorry, we don't know what to tell ya if you don't have any money. One of our guys will escort you back to the lobby.".yellow
            puts "Going back to lobby...".lobby
            casino_menu
        else
            puts
            puts "Please enter 'y' or 'n'".yellow
            check_balance
        end
    else
        puts
        puts "Welcome to Roulette #{@name}!".yellow
        setup_game
    end 
end

def setup_game
    @board = Array(1..36)
    @bet_array = []
    @round_result = nil
    @odds = [
        35,
        1,
        1,
        1,
        1,
        35,
        35,
        2,
        2,
        2,
        1,
        1
    ]
    roulette_logo
    betting_menu
end

def betting_menu
    puts "----------------------------------".light_green
    puts
    puts "Your current balance is $#{@money}".light_green
    puts
    puts "----------------------------------\n".light_green
    puts "Please choose one of the following bets: (1-12)".yellow
    puts
    puts "1)    Straight Up (35:1)".yellow
    puts "2)    Even Numbers (1:1)".yellow
    puts "3)    Odd Numbers (1:1)".yellow
    puts "4)    Red (1:1)".yellow
    puts "5)    Black (1:1)".yellow
    puts "6)    Zero (35:1)".yellow
    puts "7)    Double Zero (35:1)".yellow
    puts "8)    1 thru 12 (2:1)".yellow
    puts "9)    13 thru 24 (2:1)".yellow
    puts "10)   25 thru 36 (2:1)".yellow
    puts "11)   1 thru 18 (1:1)".yellow
    puts "12)   19 thru 36 (1:1)".yellow
    puts
    roulette_bet = gets.to_i
    handle_betting_menu_choice(roulette_bet)
end

def handle_betting_menu_choice(choice)
    case choice
    when 1
        puts
        puts "You are placing a Straight Up bet, which number would you like to bet on? (1-36)\n".yellow
        straight_up_bet = gets.strip.to_i
        if !straight_up_bet.between?(1,36)
            puts
            puts "That's not a valid option. Only 1 thru 36 on Straight Up bets!\n".red
            betting_menu
        else
            puts "How much would you like to bet?\n".yellow
            amount_to_bet = gets.strip.to_i
            if @money - amount_to_bet < 0
                puts "\nSorry, you only have $#{@money} in your account. Please come back later when you have the money.\n".yellow
                betting_menu
            else
                puts "Great, you have placed one bet on #{straight_up_bet} for $#{amount_to_bet}.\n".light_green
                decrease_balance(amount_to_bet)
                puts "Your remaining balance is $#{@money}.\n".light_green
                @bet_array << [choice, straight_up_bet, amount_to_bet]
                print @bet_array
                spin
            end
        end
    else
        puts "That's not a valid option"
    end
end

def spin
    puts
    puts "Here we go!...\n".yellow
    @spin.play
    sleep(1)
    puts "Bets closed, ball on the move...\n".yellow
    @round_result = @board.sample
    sleep(3)
    puts "The result is...\n".yellow
    sleep(5)
    puts "--------------------------".magenta
    puts
    puts "#{@round_result}!".magenta
    puts
    puts "--------------------------\n".magenta

end

def roulette_logo
    puts '''
     ______    _______  __   __  ___      _______  _______  _______  _______ 
    |    _ |  |       ||  | |  ||   |    |       ||       ||       ||       |
    |   | ||  |   _   ||  | |  ||   |    |    ___||_     _||_     _||    ___|
    |   |_||_ |  | |  ||  |_|  ||   |    |   |___   |   |    |   |  |   |___ 
    |    __  ||  |_|  ||       ||   |___ |    ___|  |   |    |   |  |    ___|
    |   |  | ||       ||       ||       ||   |___   |   |    |   |  |   |___ 
    |___|  |_||_______||_______||_______||_______|  |___|    |___|  |_______|
    
  '''.magenta
end

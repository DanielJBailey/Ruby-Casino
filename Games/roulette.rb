
def start_roulette
    @start = Sounder::Sound.new "./Assets/roulette_intro.mp3"
    @spin = Sounder::Sound.new "./Assets/roulette_spin.mp3"
    @gasp = Sounder::Sound.new "./Assets/gasp.mp3"
    @cheer = Sounder::Sound.new "./Assets/cheer.mp3"
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
            puts "Going back to lobby...".yellow
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
    @board = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36]
    @bet_array = []
    @round_result = nil
    @odds = [
        35,
        1,
        1,
        1,
        1,
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
    puts "6)    1 thru 12 (2:1)".yellow
    puts "7)    13 thru 24 (2:1)".yellow
    puts "8)    25 thru 36 (2:1)".yellow
    puts "9)    1 thru 18 (1:1)".yellow
    puts "10)   19 thru 36 (1:1)".yellow
    puts
    roulette_bet = gets.to_i
    handle_betting_menu_choice(roulette_bet)
end

def handle_betting_menu_choice(choice)
    case choice
    # STRAIGHT UP BET
    when 1
        puts
        puts "You are placing a Straight Up bet, which number would you like to bet on? (0-36)\n".yellow
        straight_up_bet = gets.strip.to_i
        # puts straight_up_bet
        if !straight_up_bet.between?(0,36)
            puts
            puts "That's not a valid option. Only 0 thru 36 on Straight Up bets!\n".red
            betting_menu
        else
            puts
            puts "How much would you like to bet?\n".yellow
            amount_to_bet = gets.strip.to_i
            if @money - amount_to_bet < 0
                puts "\nSorry, you only have $#{@money} in your account. Please deposit more money.\n".yellow
                cashier
            else
                puts
                puts "Great, you have placed one bet on #{straight_up_bet} for $#{amount_to_bet}.\n".light_green
                @bet_array << [choice, straight_up_bet, amount_to_bet]
                spin
            end
        end
    # EVEN NUMBERS
    when 2
        puts
        puts "You are placing an EVEN only bet.".yellow
        puts
        puts "How much would you like to bet?\n".yellow
        amount_to_bet = gets.strip.to_i
        if @money - amount_to_bet < 0
            puts "\nSorry, you only have $#{@money} in your account. Please deposit more money.\n".yellow
            cashier
        else
            puts
            puts "Great, you have placed one bet on EVEN numbers for $#{amount_to_bet}.\n".light_green
            @bet_array << [choice, amount_to_bet]
            spin
        end
    # ODD NUMBERS
    when 3
        puts
        puts "You are placing an ODD only bet.".yellow
        puts
        puts "How much would you like to bet?\n".yellow
        amount_to_bet = gets.strip.to_i
        if @money - amount_to_bet < 0
            puts "\nSorry, you only have $#{@money} in your account. Please deposit more money.\n".yellow
            cashier
        else
            puts
            puts "Great, you have placed one bet on ODD numbers for $#{amount_to_bet}.\n".light_green
            @bet_array << [choice, amount_to_bet]
            spin
        end
    # RED NUMBERS
    when 4
        puts
        puts "You are placing a RED numbers only bet.".yellow
        puts
        puts "How much would you like to bet?\n".yellow
        amount_to_bet = gets.strip.to_i
        if @money - amount_to_bet < 0
            puts "\nSorry, you only have $#{@money} in your account. Please deposit more money.\n".yellow
            cashier
        else
            puts
            puts "Great, you have placed one bet on RED numbers for $#{amount_to_bet}.\n".light_green
            @bet_array << [choice, amount_to_bet]
            spin
        end
    # BLACK NUMBERS
    when 5
        puts
        puts "You are placing a BLACK numbers only bet.".yellow
        puts
        puts "How much would you like to bet?\n".yellow
        amount_to_bet = gets.strip.to_i
        if @money - amount_to_bet < 0
            puts "\nSorry, you only have $#{@money} in your account. Please deposit more money.\n".yellow
            cashier
        else
            puts
            puts "Great, you have placed one bet on BLACK numbers for $#{amount_to_bet}.\n".light_green
            @bet_array << [choice, amount_to_bet]
            spin
        end
    # 1 thru 12
    when 6
        puts
        puts "You are placing a numbers 1 thru 12 only bet.".yellow
        puts
        puts "How much would you like to bet?\n".yellow
        amount_to_bet = gets.strip.to_i
        if @money - amount_to_bet < 0
            puts "\nSorry, you only have $#{@money} in your account. Please deposit more money.\n".yellow
            cashier
        else
            puts
            puts "Great, you have placed one bet on numbers 1 thru 12 for $#{amount_to_bet}.\n".light_green
            @bet_array << [choice, amount_to_bet]
            spin
        end
    # 13 thru 24
    when 7
        puts
        puts "You are placing a numbers 13 thru 24 only bet.".yellow
        puts
        puts "How much would you like to bet?\n".yellow
        amount_to_bet = gets.strip.to_i
        if @money - amount_to_bet < 0
            puts "\nSorry, you only have $#{@money} in your account. Please deposit more money.\n".yellow
            cashier
        else
            puts
            puts "Great, you have placed one bet on numbers 13 thru 24 for $#{amount_to_bet}.\n".light_green
            @bet_array << [choice, amount_to_bet]
            spin
        end
    # 25 thru 36
    when 8
        puts
        puts "You are placing a numbers 25 thru 36 only bet.".yellow
        puts
        puts "How much would you like to bet?\n".yellow
        amount_to_bet = gets.strip.to_i
        if @money - amount_to_bet < 0
            puts "\nSorry, you only have $#{@money} in your account. Please deposit more money.\n".yellow
            cashier
        else
            puts
            puts "Great, you have placed one bet on numbers 25 thru 36 for $#{amount_to_bet}.\n".light_green
            @bet_array << [choice, amount_to_bet]
            spin
        end
    # 1 thru 18
    when 9
        puts
        puts "You are placing a numbers 1 thru 18 only bet.".yellow
        puts
        puts "How much would you like to bet?\n".yellow
        amount_to_bet = gets.strip.to_i
        if @money - amount_to_bet < 0
            puts "\nSorry, you only have $#{@money} in your account. Please deposit more money.\n".yellow
            cashier
        else
            puts
            puts "Great, you have placed one bet on numbers 1 thru 18 for $#{amount_to_bet}.\n".light_green
            @bet_array << [choice, amount_to_bet]
            spin
        end
    # 19 thru 36
    when 10
        puts
        puts "You are placing a numbers 19 thru 36 only bet.".yellow
        puts
        puts "How much would you like to bet?\n".yellow
        amount_to_bet = gets.strip.to_i
        if @money - amount_to_bet < 0
            puts "\nSorry, you only have $#{@money} in your account. Please deposit more money.\n".yellow
            cashier
        else
            puts
            puts "Great, you have placed one bet on numbers 19 thru 36 for $#{amount_to_bet}.\n".light_green
            @bet_array << [choice, amount_to_bet]
            spin
        end
    else
        puts "That's not a valid option"
        betting_menu
    end
end

def spin
    puts "Here we go!...\n".yellow
    @spin.play
    sleep(1)
    puts "Bets closed, ball on the move...\n".yellow
    @round_result = @board.sample
    if @round_result % 2 == 0
        @round_result_color = 'Black'
        @round_result_even_or_odd = 'Even'
    else
        @round_result_color = 'Red'
        @round_result_even_or_odd = 'Odd'
    end
    sleep(3)
    puts "The result is...\n".yellow
    sleep(5)
    puts "--------------------------".magenta
    puts
    puts "            #{@round_result}!".magenta
    puts
    puts "--------------------------\n".magenta
    calculate_results
end

def calculate_results
    # FOR REFERENCE
    # @bet_array << [choice, straight_up_bet, amount_to_bet]

    user_bet_type = @bet_array[0][0]
    case user_bet_type
    when 1
        if @round_result == @bet_array[0][1]
            @cheer.play
            winning_odds = @odds[user_bet_type - 1]
            winnings = winning_odds * @bet_array[0].last
            increase_balance(winnings)
            puts
            puts "You just WON $#{winnings}!!".light_green
            puts
            replay
        else
            decrease_balance(@bet_array[0].last)
            puts "Oh nooo... you just lost your bet of $#{@bet_array[0].last}!".red
            @gasp.play
            replay
        end
    when 2
        if @round_result_even_or_odd == 'Even'
            @cheer.play
            winning_odds = @odds[user_bet_type - 1]
            winnings = winning_odds * @bet_array[0].last
            increase_balance(winnings)
            puts
            puts "You just WON $#{winnings}!!".light_green
            puts
            replay
        else
            decrease_balance(@bet_array[0].last)
            puts "Oh nooo... you just lost your bet of $#{@bet_array[0].last}!".red
            @gasp.play
            replay
        end
    when 3
        if @round_result_even_or_odd == 'Odd'
            @cheer.play
            winning_odds = @odds[user_bet_type - 1]
            winnings = winning_odds * @bet_array[0].last
            increase_balance(winnings)
            puts
            puts "You just WON $#{winnings}!!".light_green
            puts
            replay
        else
            decrease_balance(@bet_array[0].last)
            puts "Oh nooo... you just lost your bet of $#{@bet_array[0].last}!".red
            @gasp.play
            replay
        end
    when 4
        if @round_result_color == 'Red'
            @cheer.play
            winning_odds = @odds[user_bet_type - 1]
            winnings = winning_odds * @bet_array[0].last
            increase_balance(winnings)
            puts
            puts "You just WON $#{winnings}!!".light_green
            puts
            replay
        else
            decrease_balance(@bet_array[0].last)
            puts "Oh nooo... you just lost your bet of $#{@bet_array[0].last}!".red
            @gasp.play
            replay
        end
    when 5
        if @round_result_color == 'Black'
            @cheer.play
            winning_odds = @odds[user_bet_type - 1]
            winnings = winning_odds * @bet_array[0].last
            increase_balance(winnings)
            puts
            puts "You just WON $#{winnings}!!".light_green
            puts
            replay
        else
            decrease_balance(@bet_array[0].last)
            puts "Oh nooo... you just lost your bet of $#{@bet_array[0].last}!".red
            @gasp.play
            replay
        end
    when 6
        if @round_result.between?(1,12)
            @cheer.play
            winning_odds = @odds[user_bet_type - 1]
            winnings = winning_odds * @bet_array[0].last
            increase_balance(winnings)
            puts
            puts "You just WON $#{winnings}!!".light_green
            puts
            replay
        else
            decrease_balance(@bet_array[0].last)
            puts "Oh nooo... you just lost your bet of $#{@bet_array[0].last}!".red
            @gasp.play
            replay
        end
    when 7
        if @round_result.between?(13,24)
            @cheer.play
            winning_odds = @odds[user_bet_type - 1]
            winnings = winning_odds * @bet_array[0].last
            increase_balance(winnings)
            puts
            puts "You just WON $#{winnings}!!".light_green
            puts
            replay
        else
            decrease_balance(@bet_array[0].last)
            puts "Oh nooo... you just lost your bet of $#{@bet_array[0].last}!".red
            @gasp.play
            replay
        end
    when 8
        if @round_result.between?(25,36)
            @cheer.play
            winning_odds = @odds[user_bet_type - 1]
            winnings = winning_odds * @bet_array[0].last
            increase_balance(winnings)
            puts
            puts "You just WON $#{winnings}!!".light_green
            puts
            replay
        else
            decrease_balance(@bet_array[0].last)
            puts "Oh nooo... you just lost your bet of $#{@bet_array[0].last}!".red
            @gasp.play
            replay
        end
    when 9
        if @round_result.between?(1,18)
            @cheer.play
            winning_odds = @odds[user_bet_type - 1]
            winnings = winning_odds * @bet_array[0].last
            increase_balance(winnings)
            puts
            puts "You just WON $#{winnings}!!".light_green
            puts
            replay
        else
            decrease_balance(@bet_array[0].last)
            puts "Oh nooo... you just lost your bet of $#{@bet_array[0].last}!".red
            @gasp.play
            replay
        end
    when 10
        if @round_result.between?(19,36)
            @cheer.play
            winning_odds = @odds[user_bet_type - 1]
            winnings = winning_odds * @bet_array[0].last
            increase_balance(winnings)
            puts
            puts "You just WON $#{winnings}!!".light_green
            puts
            replay
        else
            decrease_balance(@bet_array[0].last)
            puts "Oh nooo... you just lost your bet of $#{@bet_array[0].last}!".red
            @gasp.play
            replay
        end
    else
        puts "Something went wrong... Sorry :(".yellow
    end
end

def replay
    puts
    puts "----------------------------------".light_green
    puts
    puts "Your remaining balance is $#{@money}".light_green
    puts
    puts "----------------------------------\n".light_green
    puts "Would you like to play again? (y/n)".yellow
    puts
    response = gets.strip.downcase.to_s
    if response == 'y' || response == 'yes'
        betting_menu
    else
        casino_menu
    end
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

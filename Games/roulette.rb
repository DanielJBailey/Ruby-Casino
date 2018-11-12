def start_roulette
    puts "made it"
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
        puts "Welcome to Roulette!".yellow
    end 
end

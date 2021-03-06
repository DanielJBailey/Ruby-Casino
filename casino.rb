require_relative './player'
require_relative './Games/roulette'
require_relative './Games/slots.rb'
require_relative './Games/rockpaperscissors.rb'
require_relative './Games/highnlow.rb'
require 'sounder'

Sounder::System.set_volume 50 # 0-100
@ambience = Sounder::Sound.new "./Assets/ambience_casino.mp3"
@ambience.play

class Casino < Player
    def initialize
        super()
        @menu = [
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
        puts "Please choose one of the followings options.(1-#{@menu.length})".yellow       
        puts
        @menu.each_with_index do |game, index|
            puts "#{index + 1}) #{game}".yellow
        end
        puts
        choice = gets.strip.to_i
        handle_user_choice(choice)
    end 

    # Method to handle users choice in menu
    def handle_user_choice(choice)
        case choice
        when 1
            start_highnlow
        when 2
            start_rps
        when 3
            start_roulette
        when 4
            start_slots
        when 5
            cashier
        when 6
            leave_casino
        else
            puts
            puts "I am sorry that is not a valid option #{@name}".yellow
            casino_menu
        end
    end

    # Method to quit game
    def leave_casino 
        puts
        puts "Thanks for playing. We hope you had a great time!".yellow
        puts
        puts "Goodbye...".yellow
        exit(0)
    end

    # Cashier to View Balance, Deposit, and Withdraw Money
    def cashier
        cashier_logo
        puts
        puts "Hello, how may I help you?".yellow
        print_cashier_menu
    end

    # Print cashier menu to the screen
    def print_cashier_menu
        puts
        puts "1) View Balance".yellow
        puts "2) Withdraw & Leave".yellow
        puts "3) Deposit".yellow
        puts "4) Return to Lobby".yellow
        puts
        choice = gets.strip.to_i
        handle_cashier_choice(choice)
    end

    def handle_cashier_choice(choice)
        case choice
        when 1
            puts
            puts "----------------------------------".light_green
            puts
            puts "Your current balance is $#{@money}".light_green
            puts
            puts "----------------------------------".light_green
            puts
            print_cashier_menu
        when 2
            puts "Are you sure you would like to withdraw? (y/n)".yellow
            choice = gets.strip.to_s
            if choice.downcase == 'y'
                amount_withdrawn = @money.to_i
                decrease_balance(amount_withdrawn)
                puts
                puts "----------------------------------------------------------".light_green
                puts "You have withdrawn $#{amount_withdrawn} from your account.".yellow
                puts "----------------------------------------------------------".light_green
                puts
                leave_casino
            else
                puts "Ok returning to menu".yellow
                print_cashier_menu
            end
        when 3
            puts "----------------------------------".light_green
            puts "Your current balance is $#{@money}".yellow
            puts "----------------------------------".light_green
            puts
            puts "How much would you like to add?".yellow
            puts
            amount_to_add = gets.to_i
            if amount_to_add + @money > 1000
                puts
                puts "Sorry we can't let you deposit more than the allowed $1000".yellow
                puts "Going back to main menu...".yellow
                print_cashier_menu
            else
                puts
                increase_balance(amount_to_add)
                puts "Adding $#{amount_to_add} to your account...".yellow
                puts
                puts "Your new balance is $#{@money}".yellow
                puts
                puts
                print_cashier_menu
            end
        when 4
            puts
            puts "Returning to main lobby...".yellow
            puts
            casino_menu
        else
            puts
            puts "Invalid option, please choose options: 1 - 4.".yellow
            print_cashier_menu
        end
    end

    # Method to slow print cashier logo
    def cashier_logo
        cashier = [
        puts,
        puts,
        "    ██████╗ █████╗ ███████╗██╗  ██╗██╗███████╗██████╗  ".light_green,
        "    ██╔════╝██╔══██╗██╔════╝██║  ██║██║██╔════╝██╔══██╗".light_green,
        "    ██║     ███████║███████╗███████║██║█████╗  ██████╔╝".light_green,
        "    ██║     ██╔══██║╚════██║██╔══██║██║██╔══╝  ██╔══██╗".light_green,
        "    ╚██████╗██║  ██║███████║██║  ██║██║███████╗██║  ██║".light_green,
        "     ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝╚══════╝╚═╝  ╚═╝".light_green,
        puts,
        puts
        ]
        cashier.each do |line|
            sleep(0.1) #Alter this number to slow or speed up line printing (in seconds)
            puts line
        end
    end

end

game = Casino.new

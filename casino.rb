require_relative './player'
require_relative './wallet'
require 'sounder'
# require 'pry'
# require_relative './Games/rockpaperscissors.rb'
# require_relative './Games/roulette.rb'
# require_relative './Games/slots.rb'


Sounder::System.set_volume 50 # 0-100

@ambience = Sounder::Sound.new "./Assets/ambience_casino.mp3"
# @ambience.play



class Casino < Player
    attr_accessor :name, :money
    def initialize(name, money)
        @name = name
        @money = money
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
            cashier
        when 6
            leave_casino
        else
            puts
            puts "I am sorry that is not a valid option #{@name}".yellow
            casino_menu
        end
    end

    # Function to quit game
    def leave_casino 
        puts
        puts "Thanks for playing. We hope you had a great time!".yellow
        puts
        puts "Goodbye...".yellow
        exit(0)
    end

    def cashier
        puts """
        ██████╗ █████╗ ███████╗██╗  ██╗██╗███████╗██████╗ 
        ██╔════╝██╔══██╗██╔════╝██║  ██║██║██╔════╝██╔══██╗
        ██║     ███████║███████╗███████║██║█████╗  ██████╔╝
        ██║     ██╔══██║╚════██║██╔══██║██║██╔══╝  ██╔══██╗
        ╚██████╗██║  ██║███████║██║  ██║██║███████╗██║  ██║
         ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝╚══════╝╚═╝  ╚═╝
        """.light_green
        puts
        puts "Hello, how may I help you?".yellow
        puts
        puts "1) View Balance".yellow
        puts "2) Withdraw & Leave".yellow
        puts "3) Deposit".yellow
        puts "4) Return to Lobby".yellow
        puts
        choice = gets.strip.to_i
        case choice
        when 1
            puts
            puts "----------------------------------".light_green
            puts
            puts "Your current balance is $#{@money}".light_green
            puts
            puts "----------------------------------".light_green
            puts
            cashier
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
                cashier
            end
        when 3
            puts "----------------------------------".light_green
            puts "Your current balance is $#{@money}".yellow
            puts "----------------------------------".light_green
            puts
            puts "How much would you like to add?".yellow
            puts
            amount_to_add = gets.to_i
            puts
            increase_balance(amount_to_add)
            puts "Adding $#{amount_to_add} to your account...".yellow
            puts
            puts "Your new balance is $#{@money}".yellow
            puts
            puts
            cashier
        else
            #something
        end
    end
end

x = Player.new

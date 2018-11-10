require_relative './wallet'
require_relative './welcome'
require 'colorize'
# require 'rainbow/refinement'

class Player < Wallet
    def initialize
        @name = nil
        super()
        # Welcome.new for now comment out for
        get_user_info
    end

    def get_user_info
        puts
        puts 
        sleep(0.1)
        puts "Welcome to our casino, we are THRILLED to have you!".yellow
        puts
        puts "So please tell us, who do we have the pleasure of robbing today?".yellow
        puts
        get_name
    end

    def get_name
        @name = gets.strip.to_s
        # if name doesn't include atleast 3 letters, FAIL
        if @name.match?(/[A-Za-z]{3,}/) 
            puts
            puts "Hello #{@name}!, how much can you afford to lose today? (Max: $1,000)".yellow
            get_money
            casino = Casino.new
        else 
            puts "Surely that can't be your name...".yellow
            puts
            puts "Please, tell me again what you would like to be called.".yellow
            get_name
        end
    end

    def get_money
        puts
        @money = gets.to_i
        if @money > 1000 
            puts
            puts "Sorry, we can only get away with stealing no more than $1,000 from you, let's try again...".yellow
            get_money
        elsif @money < 0
            puts "Did you think we were going to give you money?".yellow
            puts
            puts "Let's try again"
            get_money
        else
            @money = sprintf('%.2f', @money)
            puts
            puts "Great! We have loaded your account with $#{@money}. Good Luck #{@name}!".light_green
            puts
        end
    end
end


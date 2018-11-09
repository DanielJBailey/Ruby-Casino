require_relative './wallet'

class Player < Wallet
    def initialize
        @name = nil
        super()
        get_user_info
    end

    def get_user_info
        puts 
        puts "Welcome to our casino:"
        puts
        puts "Enter your name:"
        @name = gets.strip.to_s
        puts
        puts "Hello #{@name}, how much can you afford to lose?"
        @money = gets.strip
        @money = sprintf('%.2f', @money)
        puts
        puts "Here is your balance: $#{@money}"
        puts
        casino = Casino.new
    end
end
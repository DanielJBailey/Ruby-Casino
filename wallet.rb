require 'pry'

class Wallet
    # Initialize Wallet On Creation
    def initialize
        @money = 0
        binding.pry
    end
    attr_accessor :money

    def view_balance
        # binding.pry
        @money
    end

    # Increase Wallet Balance Method
    def increase_balance(amt)
        # binding.pry
        @money += amt
    end

    # Decrease Wallet Balance Method
    def decrease_balance(amt)
        # binding.pry
        @money -= amt
    end
end
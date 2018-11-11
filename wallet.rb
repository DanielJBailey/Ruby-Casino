require 'pry'

class Wallet
    attr_accessor :money
    # Initialize Wallet On Creation
    def initialize
        @money = 0
        # binding.pry
    end

    def view_balance
        # binding.pry
        return @money
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
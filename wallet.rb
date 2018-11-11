require 'pry'

class Wallet
    
    # Initialize Wallet On Creation
    def initialize
        @money = 0
    end

    def view_balance
        binding.pry
        return @money
    end

    # Increase Wallet Balance Method
    def increase_balance(amt)
        @money += amt
    end

    # Decrease Wallet Balance Method
    def decrease_balance(amt)
        @money -= amt
    end
end
class Wallet
    def initialize
        @money = nil
    end
    def increase_balance(amt)
        @money += amt
    end

    def decrease_balance(amt)
        @money -= amt
    end
end
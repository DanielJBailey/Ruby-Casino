require_relative '../casino.rb'

class Roulette < Casino
    def initialize
        puts instance_variables
        puts view_balance
    end
end

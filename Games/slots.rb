# Chelsea
require_relative './wallet'
require_relative './player'

class Slots
    def initialize
        @slot_answers = ['cherry', 'grapes', 'apple',]
        slot_machine
    end

    def slot_machine
        puts "#{@name}, how much would you like to bet?"
        bet = gets.strip.to_i
        Wallet.decrease_balance(bet)
    end

    def winbalance(cash1, cash2, cash3)
        if 

    end 

    def slot_machine_answers
        slotmachine1 = @slot_answers.shuffle.first
        slotmachine2 = @slot_answers.shuffle.first
        slotmachine3 = @slot_answers.shuffle.first
        puts "#{slotmachine1} - #{slotmachine2} - #{slotmachine3}"

        winnings = bet * winbalance(slotmachine1, slotmachine2, slotmachine3)
        puts "You have won $#{winnings}"
        quit
    end
    
    def quit
         puts "Balance: #{@money}"
        puts "Would you like to continue? "
    end



end

#  puts  '__.--~~.,-.__    '
#  puts  '`~-._.-(`-.__`-. '
#  puts  '        \    `~~`'
#  puts  '   .--./ \       '
#  puts  '  /#   \  \.--.  '
#  puts  '  \    /  /#   \ '
#  puts  '   '--'   \    / '
#  puts  '           '--'  '
  
#         .:'
#  puts    __ :'__
#  puts .'`__`-'__``.
#  puts :__________.-'
#  puts :_________:
#  puts :_________`-;
#  puts  `.__.-.__.'

# puts __ {_/
# puts \_}\\ _
# puts    _\(_)_
# puts   (_)_)(_)_
# puts  (_)(_)_)(_)
# puts   (_)(_))_)
# puts    (_(_(_)
# puts     (_)_)
# puts      (_)
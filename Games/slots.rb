# Chelsea
#increase_balance 
#decrease_balance
#@money
#@name
#@ambience = Sounder::Sound.new "./Assets/ambience_casino.mp3"

    def start_slots
        beginning_balance
    end

    def beginning_balance
        if @money == 0
            puts
            puts "Sorry, you don't have enough money to play Slots!".yellow
            puts "Would you like to go back to the cashier so you can deposit more money? (y/n)".yellow
            choice = gets.downcase.strip.to_s
            if choice == 'y'
                cashier
            elsif choice == 'n'
                puts "Sorry, we don't know what to tell ya if you don't have any money. One of our guys will escort you back to the lobby.".yellow
                puts "Going back to lobby...".lobby
                casino_menu
            else
                puts
                puts "Please enter 'y' or 'n'".yellow
                check_balance
            end
        else
            puts
            print_slot_sign
            slot_bet
        end 
    end
    
    def print_slot_sign
        slot_sign = [
            puts,
            '          $$$$$$\  $$\       $$$$$$\ $$$$$$$$\  $$$$$$\  $$\         '.blue,
            '         $$  __$$\ $$ |     $$  __$$\\__$$  __|$$  __$$\ $$ |        '.blue,
            '         $$ /  \__|$$ |     $$ /  $$ |  $$ |   $$ /  \__|$$ |        '.blue,
            '         \$$$$$$\  $$ |     $$ |  $$ |  $$ |   \$$$$$$\  $$ |        '.blue,
            '          \____$$\ $$ |     $$ |  $$ |  $$ |    \____$$\ \__|        '.blue,
            '         $$\   $$ |$$ |     $$ |  $$ |  $$ |   $$\   $$ |            '.blue,
            '         \$$$$$$  |$$$$$$$$\ $$$$$$  |  $$ |   \$$$$$$  |$$\         '.blue,
            '          \______/ \________|\______/   \__|    \______/ \__|        '.blue,
            puts,
            puts
      ]
        puts
        puts
        puts
        # While loop that acts like a scroll down
        x = 15
        while x > 0
            sleep(0.1)
            puts
            x -= 1
        end
        # Print out each line of sign
        slot_sign.each do | line | 
            sleep (0.1) 
            puts line
    end

    def slot_bet
        # puts "----------------------------------".light_green
        # puts
        # puts "Your current balance is $#{@money}".light_green
        # puts
        # puts "----------------------------------".light_green
        puts
        puts "Welcome to SLOTS!!".yellow
        puts
        puts "#{@name}, how much would you like to bet?".yellow
        puts
        @slotbet = gets.strip.to_i
        if @slotbet > @money
        puts
        puts "Not enough cash in your pocket to place that bet.".yellow
        puts
        puts "Do you want to deposit more money? (y/n)".yellow
        deposit = gets.downcase.strip.to_s
            if response == 'y'
                cashier
            else
                slot_bet
            end
        else
            decrease_balance(@slotbet)
            play_slots
        end
    end

    def play_slots
        @slot_answers = ['Cherry', 'Grapes', 'Apple']

    # @slot_answers = [{Cherry: "        CHERRY       ".red,
    #                           "   __.--~~.,-.__     ".green,
    #                           "   `~-._.-(`-.__`-.  ".green,
    #                           "          |    `~~`  ".green,
    #                           "     .--./ |         ".red,
    #                           "    /#   |  | .--.   ".red,
    #                           "    |    /  /#    |  ".red,
    #                           "     '--'    |    /  ".red,
    #                           "              '--'   ".red,
    #           }, 
    #           {Grapes: "        GRAPES       ".magenta,
    #                    "      __ {_/         ".green,
    #                    "      |_}|| _        ".green,
    #                    "         _|(_)_      ".magenta,
    #                    "        (_)_)(_)_    ".magenta,
    #                    "       (_)(_)_)(_)   ".magenta,
    #                    "        (_)(_))_)    ".magenta,
    #                    "         (_(_(_)     ".magenta,
    #                    "          (_)_)      ".magenta,
    #                    "           (_)       ".magenta,
    #           },
    #           {Apple: "        APPLE        ".green,
    #                   "         .:'         ".brown,
            #           "       __ :'__       ".brown,
            #           "    .'`__`-'__``.    ".green,
            #           "    :__________.-'   ".green, 
            #           "    :_________:      ".green,
            #           "    :_________`-;    ".green,
            #           "     `.__.-.__.'     ".green
            #   }]
    # @slots = []
        puts
        puts "----------------------------------".yellow
        puts
        slot1 = @slot_answers.shuffle.first
        slot2 = @slot_answers.shuffle.first
        slot3 = @slot_answers.shuffle.first
        puts
        puts "#{slot1}"
        sleep(2.0)
        puts "----------------------------------".blue
        puts
        puts "#{slot2}"
        sleep(2.0)
        puts "----------------------------------".blue
        puts
        puts "#{slot3}"
        sleep(2.0)
        puts "----------------------------------".blue 
        puts
        winbalance(slot1, slot2, slot3)
    end

    def winbalance(slot1, slot2, slot3)
        if slot1 == slot2 && slot2 == slot3 && slot1 == slot3
           @slotwinnings = @slotbet * 2
           increase_balance(@slotwinnings)
           puts 'Congrats, you won!!'.light_green
           puts
           puts "Your new balance is: $#{@money}".light_green
           puts
        else 0
           puts 'You lose!'.red
           puts
           sleep(2.0)
           puts "Your balance is: $#{@money}".light_green
           sleep(1.0)
           puts
        end
        leave_slots
    end
end
    
    def leave_slots
        puts
        puts "Would you like to play again? (y/n)".yellow
        puts
        playagain = gets.downcase.strip.to_s
        if playagain == 'y'
           slot_bet
        else 
           another_option
        end
    end

    def another_option
        puts 'Would you like to play a different game? (y/n)'.yellow
        diffgame = gets.downcase.strip.to_s
        if diffgame == 'y'
           casino_menu
        else 
           leave_casino
        end
    end
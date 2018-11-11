# Chelsea
require 'pry'
#increase_balance 
#decrease_balance
#@money
#@name
#@ambience = Sounder::Sound.new "./Assets/ambience_casino.mp3"

    def start_slots
        slot_machine
    end

    def slot_machine
        @slot_pics = [ 
            { Name: 'Cherry',
                Symbol: """
               CHERRY
          __.--~~.,-.__    
          `~-._.-(`-.__`-. 
                 |    `~~`
            .--./ |      
           /#   |  | .--.  
           |    /  /#    |
            '--'    |    / 
                     '--'  
        """.red },
            { Name: 'Grapes',
                Symbol: """
                GRAPES
              __ {_/
              |_}|| _
                 _|(_)_
                (_)_)(_)_
               (_)(_)_)(_)
                (_)(_))_)
                 (_(_(_)
                  (_)_)
                   (_)
            """.magenta },
            { Name: 'Apple',
                Symbol: """
                APPLE
                 .:'
                __ :'__
            #  .'`__`-'__``.
            #  :__________.-'
            #  :_________:
            #  :_________`-;
            #   `.__.-.__.'
            # """.green} ]


        @slot_answers = ['[Cherry]', '[Grapes]', '[Apple]']

        puts
        puts "----------------------------------".light_green
        puts
        puts "Your current balance is $#{@money}".light_green
        puts
        puts "----------------------------------".light_green
        puts 
        puts "#{@name}, how much would you like to bet?".yellow
        puts
        bet = gets.strip.to_i
        decrease_balance(bet)

        slot1 = @slot_answers.shuffle.first
        slot2 = @slot_answers.shuffle.first
        slot3 = @slot_answers.shuffle.first

        puts "----------------------------------".cyan
        puts
        puts "#{slot1} - #{slot2} - #{slot3}"
        puts
        puts "----------------------------------".cyan

        # @slot1 << @slot_answers.shuffle.first
        # @slot2 << @slot_answers.shuffle.first
        # @slot3 << @slot_answers.shuffle.first

        # winnings = bet * winbalance(slot1, slot2, slot3)
        # increase_balance(winnings)
        # # puts 'Congrats, you won!!'.light_green
        # puts
        # quit
    end


    # def slot_answers
    #   @slot1 = [Cherry]
    #   @slot2 = [Grapes]
    #   @slot3 = [Apple]

    # end

    def winbalance(slot1, slot2, slot3)
        if slot1 = slot2 && slot2 = slot3 && slot1 = slot3
           return 2
           winnings = bet * winbalance(slot1, slot2, slot3)
           increase_balance(winnings)
           puts 'Congrats, you won!!'.light_green
        else 0
           puts 'You lose!'.light_green
        end
    end
    
    # def quit
    #     puts "Your new balance is: $#{@money}".light_green
    #     puts
    #     puts "Would you like to play again? y or n".yellow
    #     puts
    #     selection == gets.strip.downcase
    #     if selection == 'y'
    #        slot_machine
    #     else 
    #        another_option
    #     end
    # end

    # def another_option
    #     puts 'Would you like to play a different game? y or no'.yellow
    #     if selection == 'y'
    #        casino_menu
    #     else 
    #        leave_casino
    #     end
    # end
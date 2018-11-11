# Harlan
# require_relative './wallet'
# require_relative './player'

# Sounder::System.set_volume 50 # 0-100
# @ambience = Sounder::Sound.new "./Assets/ambience_casino.mp3"
# @ambience.play

def start_highnlow
    check_balance
end

def check_balance
    if @money == 0
        puts
        puts "Sorry, you don't have enough money to play High n' Low!".yellow
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
        start_game
    end 
end

#how to check balance
    
    def start_game
        puts "Welcome , are you ready to play High n Low? \n"
        puts
        #menu to play or to quit
        highnlow_menu
    end

    def highnlow_menu
        #need an option to check balance
        puts
        puts "Would you like to:"
        puts 
        puts "(1 Play a game?"
        puts "(2 Return to main menu" 
        puts
        user_choice = gets.to_i
        case user_choice
        when 1
           how_much_to_bet
        when 2
            return_to_main_menu
            #somehow link back to Casino?
        else 
            puts
            puts "You can only enter 1 or 2 you idiot"
            puts
            highnlow_menu
        end
    end 

    
    def how_much_to_bet
        #ask how much money they have
        puts "How much would you like to bet?"
        bet = gets.strip.to_i
        puts bet
        play_game
        # if bet == 0 
        #     puts
        #     puts 'Invalid number idiot'
        #     puts
        #     how_much_to_bet
        # elsif
        #     # You can use the is_a? method
        #     #example : https://stackoverflow.com/questions/4589968/checking-if-a-variable-is-an-integer
        #     # >> 1.is_a? Integer
        #     # => true
        #     # >> "dadadad@asdasd.net".is_a? Integer
        #     # => false
        #     # >>
        #     #^^
        #     #how can i put that if someone puts anything but an integer, it doesn't work?
        #     puts
        #     puts 'Invalid number idiot'
        #     puts
        #     how_much_to_bet
        # end
    end
    
    def play_game
        first_card_dealer
        puts "Would you like to guess: "
        puts 
        #ask if high or low
        puts "(1 Higher?"
        puts "Or"
        puts "(2 Lower?"
        higher_or_lower_guess = gets.to_i
        case higher_or_lower_guess
            #user puts high or low
        when 1
            puts "You guessed Higher."
            puts "Lets see if you won or lost..."
            puts
            higher_guess
        when 2
            puts "You guessed Lower."
            puts "Lets see if you won or lost..."
            puts
            lower_guess
        else
            puts
            puts "You have to guess higher or lower... This isn't that hard, come on."
            puts
            play_game
        end
        #user either loses or wins on presented card
        #user makes or loses money in wallet
    end
    
    def first_card_dealer
        puts "The card is : "
        
        #what shows first
        #then user decides if higher or lower
    end

    def final_card_dealer
        #the winning decision if the guess is wrong or right.
    end
    
    def higher_guess
        #what happens when they choose higher
        #what happens when they win
        puts "Ugh...You won... You made: $ "
        #what happens when they lose
        puts "Ha-Ha! You lost. I stole :   from you"
        #return
        highnlow_menu
    end
    
    def lower_guess 
        #what happens when they choose lower
        #what happens when they win
        puts "Ugh...You won... You made: $ "
        #what happens when they lose
        puts "Ha-Ha! You lost. I stole :   from you"
        #return
        highnlow_menu
    end


    def return_to_main_menu
        # Casino.casino_menu
    end
    
    








# class Card
#     # Getter and Setter methods for rank, suit and color
#     attr_accessor :rank, :suit, :color
#     # Gets called when you call the new method to create an instance
#     # card = Card.new('10', 'K', 'Black')
#     def initialize(rank, suit, color)
#       @rank = rank
#       @suit = suit
#       @color = color
#     end
#    end

# class Deck
#     # Getter and Setter methods for rank, suit and color
#     attr_accessor :cards
   
#     # Gets called when you call the new method to create an instance
#     # deck = Deck.new
#     def initialize
#       @ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
#       @suits = %w(Spades Diamonds Clubs Hearts)
#       @cards = []
#       generate_deck
#     end
   
#     def shuffle_cards
#      @cards.shuffle
#     end
    
#     def generate_deck
#       @suits.each do |suit|
#         @ranks.size.times do |i|
#           # Ternary Operator
#           color = (suit == 'Spades' || suit == 'Clubs') ? 'Black' : 'Red' 
#           @cards << Card.new(@ranks[i], suit, color)
#         end
#       end
#     end
   
#      def display_cards
#        @cards.shuffle.each do |card|
#          puts "#{card.rank} #{card.suit} (#{card.color})"
#        end
#      end
#    end
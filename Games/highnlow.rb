# Harlan
# require 'sounder'

# Sounder::System.set_volume 50 # 0-100
# @shuffle_sound = Sounder::Sound.new "./Assets/shuffling_cards.mp3"
# @shuffle_sound.play

# increase_balance 
# decrease_balance
# @money
# @name




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

    
def start_game
    puts "Welcome #{@name}, are you ready to play High n Low? \n".yellow
    highnlow_menu
end

def highnlow_menu
    puts "Would you like to:".yellow
    puts 
    puts "1) Play a game?".yellow
    puts "2) Return to main menu".yellow 
    puts "3) Check Balance".yellow
    puts
    user_choice = gets.to_i
    case user_choice
    when 1
        how_much_to_bet
    when 2
        return_to_main_menu
    when 3
        check_wallet_balance
    else 
        puts
        puts "You can only enter 1 or 2 you idiot".yellow
        puts
        highnlow_menu
    end
end 

def check_wallet_balance
    puts "--------------------------------------".light_green
    puts
    puts "Your current balance is : $#{@money}".light_green
    puts 
    puts "--------------------------------------".light_green
    highnlow_menu
end

def how_much_to_bet
    #ask how much money they have
    puts "How much $$$ would you like to bet?".red
    @bet = gets.strip.to_i
    puts
    if @bet > @money
        puts
        puts "Math is hard kiddo... try again."
        puts
        puts "Do you want to deposit more money? y/n "
        response = gets.downcase.strip.to_s
        if response == 'y'
            cashier
        else
            how_much_to_bet
        end
    else
        decrease_balance(@bet)
        play_game
    end
end

def play_game
    @dealer_cards = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14
]
    first_card_dealer
    
    puts "Would you like to guess: ".yellow
    puts 
    #ask if high or low
    puts "1) Higher?".red
    puts "Or".yellow
    puts "2) Lower?".red
    higher_or_lower_guess = gets.to_i
    case higher_or_lower_guess
        #user puts high or low
    when 1
        puts "You guessed Higher.".yellow
        puts
        puts "Lets see if you won or lost...".yellow
        puts
        sleep(2.0)
        higher_guess
    when 2
        puts "You guessed Lower.".yellow
        puts
        puts "Lets see if you won or lost...".yellow
        puts
        sleep(2.0)
        lower_guess
    else
        puts
        puts "You have to guess higher or lower... This isn't that hard, come on.".yellow
        puts
        play_game
    end
    # user either loses or wins on presented card
    # user makes or loses money in wallet
end

def first_card_dealer
    @dealer_card = @dealer_cards.shuffle.sample
    puts "Dealers card is : #{@dealer_card}".yellow
    sleep(1.0)
    #what shows first
    #then user decides if higher or lower
end

def player_card
    @your_card = @dealer_cards.shuffle.sample
    puts "Your card was : #{@your_card}".yellow
    sleep(1.0)
end

def higher_guess
    player_card
    if @dealer_card < @your_card
        @winnings = @bet * 2
        puts "Ugh...You won... You made: $#{@winnings}!".green
        increase_balance(@winnings)
    else
        puts "Ha-Ha! You lost. I took: $#{@bet} from you".blue
        puts
        sleep(1.0)
    end
    highnlow_menu
end

def lower_guess 
    player_card
    if @dealer_card > @your_card
        @winnings = @bet * 2
        puts "Ugh...You won... You made: $#{@winnings}! ".green
        increase_balance(@winnings)
    else
    puts "Ha-Ha! You lost. I took: $#{@bet} from you".blue
    puts
    sleep(1.0)
    end
    highnlow_menu
end


def return_to_main_menu
    casino_menu
end
    
    








# class Card
#     # Getter and Setter methods for rank, suit and color
#     attr_accessor :rank, :suit, :color
#     # Gets called when you call the new method to create an instance
#     # card = Card.new('10', 'K', 'Black')
#     def initialize(rank, suit, color)
#       Hash.new({@rank => rank,
#       @suit => suit,
#       @color => color})
#     end
# end

# class Deck
#     # Getter and Setter methods for rank, suit and color
#     attr_accessor :cards
   
#     # Gets called when you call the new method to create an instance
#     # deck = Deck.new
#     def initialize
#       @ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
#       @suits = %w(Spades Diamonds Clubs Hearts)
#       @cards = []
#       @base_deck = []
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
#       @base_deck = @cards
#     end
   
#     def display_cards
#         @cards.shuffle.each do |card|
#             puts "#{card.rank} #{card.suit} (#{card.color})"
#         end
#     end

#     def generate_dealer_card
#         dealer_card = @cards.shuffle.sample
#         puts dealer_card
#     end

#     def generate_player_card
    
#     end
# end
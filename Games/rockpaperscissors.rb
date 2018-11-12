require 'pry'
require 'colorize'
# Maris
#if win call increase or decrease in wallet
#Wallet.increase_wallet
# require_relative '../wallet'
#check balance

# def print_logo
#   logo = [

#   ]
# end

#increase_balance
#decrease_balance
#@money
#@name
def start_rps
  if @money > 0
    # Print logo
    logo
    startgame
  else puts "You can't afford to play, get out of the casino!"
    casino_menu
  end
end

def startgame
  puts "How much would you like to bet?".yellow
  @player_bet = gets.strip.to_i
  if @player_bet == 0
    puts "Give us more money".yellow
    startgame
  elsif @money - @player_bet < 0
      puts "You only have $#{@money} left, please deposit more money".light_green
      puts "Would you like to visit the cashier? (y/n)".yellow
      response = gets.strip.downcase.to_s
        if response == 'y'
          puts
          puts "Sending you to the cashier...".yellow
          cashier
        else
          puts "Please only bet what you can afford."
          puts
          startgame
        end
  else
    puts "You've bet $#{@player_bet}".light_green
    decrease_balance(@player_bet)
    game
  end
end

def game
  compchoice = ["ROCK", "PAPER", "SCISSORS"].sample
  #1=rock
  #2=paper
  #3=scissors
  
  puts "What would you like to play as?\n1)ROCK\n2)PAPER\n3)SCISSORS".yellow
  choice = gets.to_i
  case choice
  when 1
    puts "\nYou've chosen ROCK"
    puts "computer chose #{compchoice}".yellow

    if compchoice == "ROCK"
      puts "\nTIE\n".magenta
      increase_balance(@player_bet)
      puts "Your balance is #{@money}".light_green
      play_again
    elsif compchoice == "PAPER"
      puts "\nYOU LOSE\n".red
      puts "Your balance is #{@money}".light_green
      play_again
    elsif compchoice == "SCISSORS"
      puts "\nYOU WIN\n".light_green
      increase_balance(@player_bet * 2)
      puts "Your balance is #{@money}".light_green
      play_again
    end

  when 2
    puts "\nYou've chosen PAPER"
    puts "computer chose #{compchoice}".yellow

    if compchoice == "ROCK"
      puts "\nYOU WIN\n".light_green
      increase_balance(@player_bet * 2)
      puts "Your balance is #{@money}".light_green
      play_again
    elsif compchoice == "PAPER"
      puts "\nTIE\n".magenta
      increase_balance(@player_bet)
      puts "Your balance is #{@money}".light_green
      play_again
    elsif compchoice == "SCISSORS"
      puts "\nYOU LOSE\n".red
      puts "Your balance is #{@money}".light_green
      play_again
    end

  when 3
    puts "\nYou've chosen SCISSORS"
    puts "computer chose #{compchoice}".yellow
    
    if compchoice == "ROCK"
      puts "\nYOU LOSE\n".red
      puts "Your balance is #{@money}".light_green
      play_again
    elsif compchoice == "PAPER"
      puts "\nYOU WIN\n".light_green
      increase_balance(@player_bet * 2)
      puts "Your balance is #{@money}".light_green
      play_again
    elsif compchoice == "SCISSORS"
      puts "\nTIE\n".magenta
      increase_balance(@player_bet)
      puts "Your balance is #{@money}".light_green
      play_again
    end

  else
    puts "Invalid Input"
    startgame
  end
end
  
def play_again
  puts "would you like to play again?\n1)YES\n2)NO".yellow
  yn = gets.to_i
  case yn
  when 1
    puts "Play again!".magenta
    start_rps
  when 2
    puts "Goodbye! hope to see you again!".magenta
    casino_menu
  end
end


def logo
  puts "
  ██▀███   ▒█████   ▄████▄   ██ ▄█▀    ██▓███   ▄▄▄       ██▓███  ▓█████  ██▀███       ██████  ▄████▄   ██▓  ██████   ██████  ▒█████   ██▀███    ██████ 
 ▓██ ▒ ██▒▒██▒  ██▒▒██▀ ▀█   ██▄█▒    ▓██░  ██▒▒████▄    ▓██░  ██▒▓█   ▀ ▓██ ▒ ██▒   ▒██    ▒ ▒██▀ ▀█  ▓██▒▒██    ▒ ▒██    ▒ ▒██▒  ██▒▓██ ▒ ██▒▒██    ▒ 
 ▓██ ░▄█ ▒▒██░  ██▒▒▓█    ▄ ▓███▄░    ▓██░ ██▓▒▒██  ▀█▄  ▓██░ ██▓▒▒███   ▓██ ░▄█ ▒   ░ ▓██▄   ▒▓█    ▄ ▒██▒░ ▓██▄   ░ ▓██▄   ▒██░  ██▒▓██ ░▄█ ▒░ ▓██▄   
 ▒██▀▀█▄  ▒██   ██░▒▓▓▄ ▄██▒▓██ █▄    ▒██▄█▓▒ ▒░██▄▄▄▄██ ▒██▄█▓▒ ▒▒▓█  ▄ ▒██▀▀█▄       ▒   ██▒▒▓▓▄ ▄██▒░██░  ▒   ██▒  ▒   ██▒▒██   ██░▒██▀▀█▄    ▒   ██▒
 ░██▓ ▒██▒░ ████▓▒░▒ ▓███▀ ░▒██▒ █▄   ▒██▒ ░  ░ ▓█   ▓██▒▒██▒ ░  ░░▒████▒░██▓ ▒██▒   ▒██████▒▒▒ ▓███▀ ░░██░▒██████▒▒▒██████▒▒░ ████▓▒░░██▓ ▒██▒▒██████▒▒
 ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ░ ░▒ ▒  ░▒ ▒▒ ▓▒   ▒▓▒░ ░  ░ ▒▒   ▓▒█░▒▓▒░ ░  ░░░ ▒░ ░░ ▒▓ ░▒▓░   ▒ ▒▓▒ ▒ ░░ ░▒ ▒  ░░▓  ▒ ▒▓▒ ▒ ░▒ ▒▓▒ ▒ ░░ ▒░▒░▒░ ░ ▒▓ ░▒▓░▒ ▒▓▒ ▒ ░
   ░▒ ░ ▒░  ░ ▒ ▒░   ░  ▒   ░ ░▒ ▒░   ░▒ ░       ▒   ▒▒ ░░▒ ░      ░ ░  ░  ░▒ ░ ▒░   ░ ░▒  ░ ░  ░  ▒    ▒ ░░ ░▒  ░ ░░ ░▒  ░ ░  ░ ▒ ▒░   ░▒ ░ ▒░░ ░▒  ░ ░
   ░░   ░ ░ ░ ░ ▒  ░        ░ ░░ ░    ░░         ░   ▒   ░░          ░     ░░   ░    ░  ░  ░  ░         ▒ ░░  ░  ░  ░  ░  ░  ░ ░ ░ ▒    ░░   ░ ░  ░  ░  
    ░         ░ ░  ░ ░      ░  ░                     ░  ░            ░  ░   ░              ░  ░ ░       ░        ░        ░      ░ ░     ░           ░  
                   ░                                                                          ░                                                         
".magenta
end


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
  else puts "You can't afford to play, get out of the casino!".yellow
    casino_menu
  end
end

def startgame
  puts "Welcome to Rock, Paper, Scissors!\n".magenta
  puts "How much would you like to bet?\n".yellow

  @player_bet = gets.strip.to_i
  if @player_bet == 0
    puts "\nGive us more money\n".yellow
    startgame
  elsif @money - @player_bet < 0
    puts "\nYou only have $#{@money} left, please deposit more money\n".light_green
    puts "Would you like to visit the cashier?\n1) YES\n2) NO\n".yellow

    response = gets.strip.to_i
    case response
    when 1
      puts "\nSending you to the cashier...\n".yellow
      cashier
    when 2
      puts "\nPlease only bet what you can afford.\n".yellow
      startgame
    else
      puts "\nInvalid input.\n".red
      startgame
    end

  else
    puts
    puts "You've bet $#{@player_bet}".light_green
    decrease_balance(@player_bet)
    game
  end
end

def game
  compchoice = ["ROCK", "PAPER", "SCISSORS"].sample
  # 1 = rock
  # 2 = paper
  # 3 = scissors
  puts
  puts "What would you like to play as?\n1) ROCK\n2) PAPER\n3) SCISSORS\n".yellow
  puts
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
    puts "\nInvalid Input\n".red
    startgame
  end
end
  
def play_again
  puts "\nwould you like to play again?\n1) YES\n2) NO\n".yellow
  yn = gets.to_i
  case yn
  when 1
    puts "\nPlay again!\n".magenta
    start_rps
  when 2
    puts "\nGoodbye! hope to see you again!\n".magenta
    casino_menu
  else
    puts "\nInvalid input.\n".red
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


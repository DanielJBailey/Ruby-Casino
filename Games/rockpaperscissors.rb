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

class Wallet
  def initialize
      @money = 1000.00
  end
  def increase_balance(amt)
      @money += amt
  end

  def decrease_balance(amt)
      @money -= amt
  end
end

class RockPaperScissors < Wallet

  def initialize
    super()

    if @money > 0
    startgame
    else puts "back to main menu"
      #call exit and start casino
    end
  end

  def startgame
    puts ''
    puts "How much would you like to bet?"
    player_bet = gets.to_i
    if player_bet == 0
      puts "Give us more money"
      startgame
    else
      puts "You've bet $#{player_bet}"
      decrease_balance(player_bet)
      if @money >= 0
        puts "You have $#{@money} left"
      else
        puts "You don't have enough money to bet that ammount"
        #call exit and start casino
      end
    end
    
    compchoice = ["ROCK", "PAPER", "SCISSORS"].sample
    #1=rock
    #2=paper
    #3=scissors
    
    puts "What would you like to play as?\n1)ROCK\n2)PAPER\n3)SCISSORS".yellow
    choice = gets.to_i
    case choice
    when 1
      puts "\nYou've chosen ROCK"
      puts "computer chose #{compchoice}"

      if compchoice == "ROCK"
        puts "TIE".yellow
        increase_balance(player_bet)
        puts "Your balance is #{@money}"
      elsif compchoice == "PAPER"
        puts "YOU LOSE".yellow
        puts "Your balance is #{@money}"
      elsif compchoice == "SCISSORS"
        puts "YOU WIN".yellow
        increase_balance(player_bet * 2)
        puts "Your balance is #{@money}"
      end

    when 2
      puts "\nYou've chosen PAPER"
      puts "computer chose #{compchoice}"

      if compchoice == "ROCK"
        puts "YOU WIN"
        increase_balance(player_bet * 2)
        puts "Your balance is #{@money}"
      elsif compchoice == "PAPER"
        puts "TIE"
        increase_balance(player_bet)
        puts "Your balance is #{@money}"
      elsif compchoice == "SCISSORS"
        puts "YOU LOSE"
        puts "Your balance is #{@money}"
      end

    when 3
      puts "\nYou've chosen SCISSORS"
      puts "computer chose #{compchoice}"
      
      if compchoice == "ROCK"
        puts "YOU LOSE"
        puts "Your balance is #{@money}"
      elsif compchoice == "PAPER"
        puts "YOU WIN"
        increase_balance(player_bet * 2)
        puts "Your balance is #{@money}"
      elsif compchoice == "SCISSORS"
        puts "TIE"
        increase_balance(player_bet)
        puts "Your balance is #{@money}"
      end

    else
      puts "Invalid Input"
      startgame
    end

  end


  def run_rps

    
  end

end

RockPaperScissors.new

# Maris
#if win call increase or decrease in wallet
#Wallet.increase_wallet
require_relative '../wallet'

class RPS < Wallet

  def initialize
    
    startgame
  end

  def startgame
    #needs to check wallet to play
    #rock paper scisors title
    puts "How much would you like to bet?"

    player_bet = gets.to_i
    case player_bet
      if player_bet == 0
        puts "Give us more money"
      else
      puts "You've bet $#{player_bet}"
    end



    puts "What would you like to play as?\n1)ROCK\n2)PAPER\n3)SCISORS"
    choice = gets.to_i
    case choice
    when 1
      puts "You've chosen ROCK"
      
    when 2
      puts "You've chosen PAPER"
      
    when 3
      puts "You've chosen SCISORS"

    else
      puts "Invalid Input"
      startgame
    end
  end


  def run_rps
    
  end

end

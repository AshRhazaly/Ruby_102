require 'yaml'
load 'account_class.rb'
class Interface
  attr_accessor :account

  def show_menu
    puts "\nPress 1 to display your current balance
    \nPress 2 to Deposit
    \nPress 3 to Withdraw"
    user_input = gets.chomp
    if user_input == "1"
      show_balance
    elsif user_input == "2"
      add_balance
    elsif user_input == "3"
      withdraw_balance
    else
      @@still_in = false
      puts "Invalid option..exiting program."
      return
    end
  end

  def add_balance
    puts "Enter amount to be added."
    balance_to_be_added  = gets.chomp.to_i
    @cust_account.deposit(balance_to_be_added)
  end

  def withdraw_balance
    puts "Please enter your amount you'd like to withdraw."
    balance_to_be_withdrawn = gets.chomp.to_i
    @cust_account.withdraw(balance_to_be_withdrawn)
  end

  def show_balance
    print "Your balance is $#{@cust_account.balance}"
  end

  def create_account
    puts "What is your name?"
    name = gets.chomp
    puts "What's your starting balance?"
    starting_balance = gets.chomp.to_i
    @cust_account = Account.new(starting_balance, name)
  end

  # def save_data
  #   @cust_account.balance.to_yaml
  # end
  #
  # def load_data
  #   YAML::load(save_data)
  #   #check if there is a yaml file
  #   #if there is, load from there
  #   #if not, create a new yaml file to store the account data
  # end
end

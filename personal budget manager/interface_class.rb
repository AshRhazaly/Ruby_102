require 'yaml'
load 'account_class.rb'
class Interface
  attr_accessor :account
  def show_menu
    puts "\nPress 1 to display your current balance
    \nPress 2 to Deposit
    \nPress 3 to Withdraw
    \n"
    user_input = gets.chomp
    if user_input == "1"
      show_balance
    elsif user_input == "2"
      add_balance
    elsif user_input == "3"
      withdraw_balance
    else
      still_in = false
      puts "Invalid option..exiting program."
      return
    end
  end

  def add_balance
    puts "Enter amount to be added."
    balance_to_be_added  = gets.chomp.to_i
    @cust_account.deposit(balance_to_be_added)
    save_data
  end

  def withdraw_balance
    puts "Please enter your amount you'd like to withdraw."
    balance_to_be_withdrawn = gets.chomp.to_i
    @cust_account.withdraw(balance_to_be_withdrawn)
    save_data
  end

  def show_balance
    print "Your balance is $#{@cust_account.balance}"
    save_data
  end

  def create_account
    puts "What is your name?"
    name = gets.chomp
    puts "What's your starting balance?"
    starting_balance = gets.chomp.to_i
    @cust_account = Account.new(starting_balance, name)
    show_menu
  end

  def save_data
    client_data = {"starting_balance" => @cust_account.balance, "name" => @cust_account.name}
    File.open("account_info.yml", "w") {|f| f.write(client_data.to_yaml) }
  end

  def load_data
    existing_account = YAML.load(File.open("account_info.yml")) if File.exist?("account_info.yml")
    @cust_account = Account.new(existing_account["starting_balance"], existing_account["name"])
    show_menu
    save_data
  end
end

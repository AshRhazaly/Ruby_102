require 'yaml'
load 'account_class.rb'
class Interface
  attr_accessor :account
  def show_menu
    puts "\nPress 1 to display your current balance
    \nPress 2 to Deposit
    \nPress 3 to Withdraw
    \nPress 4 to Show your Transactions history
    \nPress any other number to exit the program."
    user_input = gets.chomp
    if user_input == "1"
      show_balance
    elsif user_input == "2"
      add_balance
    elsif user_input == "3"
      withdraw_balance
    elsif user_input == "4"
      transaction_history
    else
      puts "Invalid option..exiting program."
      exit
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
    puts "Your balance is $#{@cust_account.balance}"
    puts "Press ENTER to continue"
    gets
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

  def transaction_history
    @cust_account.transactions.each do |txn|
      puts txn
    end
    puts "Press ENTER to continue"
    gets
    show_menu
  end

  def save_data
    client_data = {"starting_balance" => @cust_account.balance, "name" => @cust_account.name, "transactions" => @cust_account.transactions}
    File.open("#{@cust_account.name}.yml", "w") {|f| f.write(client_data.to_yaml) }
    show_menu
  end

  def load_data
    puts "What is your Account Name? (This is case-sensitive)"
    account_name = gets.chomp
    if File.exist?("#{account_name}.yml") == true
      existing_account = YAML.load(File.open("#{account_name}.yml"))
      @cust_account = Account.new(existing_account["starting_balance"], existing_account["name"],existing_account["transactions"])
      show_menu
      save_data
    else
      puts "That's not your account dude"
      puts "Press ENTER to try again or q to quit."
      input = gets.chomp
        if input == "q"
          exit
        else
          load_data
        end
    end
  end
end

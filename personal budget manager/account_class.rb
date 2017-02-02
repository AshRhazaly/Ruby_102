class Account
  attr_accessor :balance, :name, :transactions

  def initialize(starting_balance, name)
    @balance = starting_balance
    @name = name
    @transactions = []
    @transactions_count = 0
  end

  def deposit(amount)
    @balance += amount
    puts "You have deposited #{amount}."
    puts "Your current balance is #{@balance}."
    @transactions << "#{@transactions_count += 1}. You have deposited #{amount}"
  end

  def withdraw(amount)
    if amount <= @balance
      @balance -= amount
      puts "You have withdrawn #{amount}"
      puts "Your current balance is #{@balance}."
      @transactions << "#{@transactions_count += 1}. You have withdrawn #{amount}"
    else
      puts "dude you don't have that much money."
    end
  end
end

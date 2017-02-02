class Account
  attr_accessor :balance, :name, :transactions

  def initialize(starting_balance, name, transactions=[])
    @balance = starting_balance
    @name = name
    @transactions = transactions
    @transactions_count = 0
  end

  def deposit(amount)
    @balance += amount
    puts "You have deposited #{amount}."
    puts "Your current balance is #{@balance}."
    @transactions << "#{@transactions_count += 1}. You have deposited #{amount}"
    puts "Press ENTER to continue"
    gets
  end

  def withdraw(amount)
    if amount <= @balance
      @balance -= amount
      puts "You have withdrawn #{amount}"
      puts "Your current balance is #{@balance}."
      @transactions << "#{@transactions_count += 1}. You have withdrawn #{amount}"
      puts "Press ENTER to continue"
      gets
    else
      puts "dude you don't have that much money."
      puts "Press ENTER to continue"
      gets
    end
  end
end

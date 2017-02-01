class Account
  attr_accessor :balance
  attr_reader :account_holder ,:account_opening_date

  def initialize(starting_balance, account_holder, account_opening_date)
    @balance = starting_balance
    @account_holder = account_holder
    @account_opening_date = account_opening_date
  end

  def withdraw()
    puts "How much would you like to withdraw?"
    amount = gets.chomp
    if @balance > amount
      @balance -= amount
    else
      puts "Insufficient balance in account. Unable to withdraw."
    end
  end

  def deposit()
    puts "How much would you like to deposit?"
    amount = gets.chomp
    @balance += amount
  end
end


# show menu to the user
# ability to intereact.
#

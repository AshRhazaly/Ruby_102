class Interface
  # attr_accessor :user_input

  def create_account(starting_balance, account_holder, account_opening_date)
    @new_account = Account.new(starting_balance, account_holder, account_opening_date)
  end
  def menu()
    puts "Press 1 for displaying balance\n2 for withdrawing\n3 to deposit\nand press 0 to quit."
    user_input = gets.chomp
    if user_input == "1"
      print @balance
    elsif user_input == "2"
      print @balance - withdraw()
    elsif user_input == "3"
      puts "Depositing.."
    else
      return
    end
  end
end

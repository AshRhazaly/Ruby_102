load 'interface_class.rb'

loop do
  puts "Hi there! Welcome to DBS!"
  puts "Press 1 if you'd like to create a new account."
  puts "Press 2 if you've got an existing account."
  input = gets.chomp

  if input == "1"
    user = Interface.new
    user.create_account
    break
  elsif input == "2"
    user = Interface.new
    user.load_data
    break
  else
    break
  end
end

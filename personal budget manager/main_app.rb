load 'interface_class.rb'

puts "======================================"
puts "Hi there! Welcome to DBS!"
puts "Press 1 if you'd like to create a new account."
puts "Press 2 if you've got an existing account."
puts "Press any other key to exit."
input = gets.chomp
if input == "1"
  user = Interface.new
  user.create_account
  user.show_menu
elsif input == "2"
  user = Interface.new
  user.load_data
  user.show_menu
else
  exit
end

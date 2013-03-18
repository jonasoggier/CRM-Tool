require "./crm"

db = Database.new
id = 1000

puts "\e[H\e[2J" #clears screen 
puts "============================================================="
puts
puts "Welcome to your new powerful contact management tool. Enjoy!"
puts 
puts "============================================================="
puts 

loop do
	puts "You can use the following commands:"
	puts
	puts "-- Type 'add' to add a new contact"
	puts "-- Type 'modify' to modify an existing contact"
	puts "-- Type 'display all' to display all contacts in the database"
	puts "-- Type 'display contact' to display a particular contact"
	puts "-- Type 'display attribute' to display all contacts according to an attribute"
	puts "-- Type 'delete' to delete a particular contact from the database"
	puts "-- Type 'exit' to end the session (!! ALL DATA WILL BE DELETED !!)"
	puts

	input = gets.chomp
	
	case input
	when input = "add"
		id += 1
		puts "Please enter the first name of the person:"
		firstname = gets.chomp
		puts "Please enter the last name of the person:"
		lastname = gets.chomp
		puts "Please enter the email address of the person:"
		email = gets.chomp
		puts "Please enter any notes relating to the person:"
		notes = gets.chomp
		db.add(Row.new(id, firstname, lastname, email, notes))
		puts "\e[H\e[2J" #clears screen 
		puts "======================================="
		puts "Contact successfully added to database."
		puts "======================================="
		puts 

	when input = "modify"
		puts "\e[H\e[2J" #clears screen
		puts "Enter attribute (id, first name, last name or email) of contact to be modified"
		selection = gets.chomp
		puts "Are you sure to modify the following contact? Type 'yes' to confirm or 'no' to exit."
		db.display_particular_row(selection)
		yesorno = gets.chomp
		if yesorno == "yes"
			puts "\e[H\e[2J" #clears screen
			puts "Type one of the following commands:"
			puts "-- 'id' if you want to change the id"
			puts "-- 'firstname' if you want to change the first name"
			puts "-- 'lastname' if you want to change the last name"
			puts "-- 'email' if you want to change the email"
			puts
			attribute = gets.chomp
			puts "Type the new value for #{attribute}:"
			modification = gets.chomp
			db.modify_row(selection, attribute, modification)
			puts "\e[H\e[2J" #clears screen
			puts "==========================================="
			puts "Contact successfully updated."
			puts "==========================================="
			puts
		end

	when input = "display all"
		puts "\e[H\e[2J" #clears screen 
		db.display_all_rows
		puts
		puts "==========================================="
		puts "==========================================="
		puts

	when input = "display contact"
		puts "\e[H\e[2J" #clears screen 
		puts "Enter attribute (id, first name, last name or email) of contact to be displayed"
		userinput = gets.chomp
		db.display_particular_row(userinput)
		puts
		puts "==========================================="
		puts "==========================================="
		puts

	when input = "display attribute"
		puts "\e[H\e[2J" #clears screen 
		puts "Type one of the following commands:"
		puts "-- 'id' if you want to display all ids"
		puts "-- 'firstname' if you want to display all first names"
		puts "-- 'lastname' if you want to display all last names"
		puts "-- 'email' if you want to display all emails"
		selection = gets.chomp
		puts "\e[H\e[2J" #clears screen 
		puts "List of all contacts according to #{selection}:"
		puts
		db.display_info_by_attribute(selection)
		puts
		puts "==========================================="
		puts "==========================================="
		puts

	when input = "delete"
		puts "\e[H\e[2J" #clears screen
		puts "Enter attribute (id, first name, last name or email) of contact to be deleted"
		userinput = gets.chomp
		puts "Are you sure to delete the following contact? Type 'yes' to confirm or 'no' to exit."
		db.display_particular_row(userinput)
		yesorno = gets.chomp
		if yesorno == "yes"
			db.delete_row(userinput)
			puts "\e[H\e[2J" #clears screen
			puts "==========================================="
			puts "Contact successfully deleted from database."
			puts "==========================================="
		end

	when input = "exit"
		puts "\e[H\e[2J" #clears screen
		break
	end
end
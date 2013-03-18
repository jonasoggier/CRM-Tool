require "./crm_row"

class Database

	attr_accessor :rows_array
	
	def initialize
		@rows_array = Array.new
	end

	def add(row)
		@rows_array << row
	end

	def modify_row(selection, attribute, modification)
		row = @rows_array.detect do |x|
			(x.id == selection) || (x.firstname == selection) || (x.lastname == selection) || (x.email == selection)
		end
		if row 
			row.send(attribute + '=', modification) rescue nil
		end
		row # good practice to return object at the end of the method
	end

	def display_all_rows
	 	@rows_array.each do |x|
	 		x.display_row
	 	end
	end

	def display_particular_row(attribute) 
		@rows_array.each do |x|
			if (x.id == attribute) || (x.firstname == attribute) || (x.lastname == attribute) || (x.email == attribute)
				x.display_row
			end 
		end
	end

	def display_info_by_attribute(arg)
		@rows_array.each do |x|
			puts x.send(arg) # Database#send passes the 'arg' string to x, but as a method and not as a string
		end
	end

	def delete_row(attribute)
		@rows_array.each do |x|
			if (x.id == attribute) || (x.firstname == attribute) || (x.lastname == attribute) || (x.email == attribute)
				@rows_array.delete(x)
			end 
		end
	end

end
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
		@rows_array.each do |x|
			if (x.id == attribute) || (x.firstname == attribute) || (x.lastname == attribute) || (x.email == attribute)
				x.attribute = modification
			end 
		end
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
			x.arg
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
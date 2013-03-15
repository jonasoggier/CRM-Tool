# require "SimpleCov"
# SimpleCov.start

require "./crm"
require "test/unit"

class TestCRM < Test::Unit::TestCase
	def test_add_row_to_rows_array
		db = Database.new
		row = Row.new(1, "Jonas", "Oggier", "jonas.oggier@gmail.com", "This is a note.")
		db.add(row)
		assert_equal [row], db.rows_array
	end	

	def test_count_rows
		db = Database.new
		row = Row.new(1, "Jonas", "Oggier", "jonas.oggier@gmail.com", "This is a Jonas note.")
		db.add(row)
		row = Row.new(2, "Stefan", "Borter", "stefan.borter@gmail.com", "This is a Stefan note.")
		db.add(row)
		assert_equal 2, db.rows_array.length
	end	

	def test_delete_row
		db = Database.new
		row1 = Row.new(1, "Jonas", "Oggier", "jonas.oggier@gmail.com", "This is a Jonas note.")
		db.add(row1)
		row2 = Row.new(2, "Stefan", "Borter", "stefan.borter@gmail.com", "This is a Stefan note.")
		db.add(row2)
		assert_equal [row2], db.delete_row("Oggier")
	end

	def test_display_info_by_attribute
		db = Database.new
		row1 = Row.new(1, "Jonas", "Oggier", "jonas.oggier@gmail.com", "This is a Jonas note.")
		db.add(row1)
		row2 = Row.new(2, "Stefan", "Borter", "stefan.borter@gmail.com", "This is a Stefan note.")
		db.add(row2)
		assert_equal "Oggier" "Borter", db.display_info_by_attribute("lastname")
	end

	# def test_modify_contact
	# 	db = Database.new
	# 	row = Row.new(1, "Jonas", "Oggier", "jonas.oggier@gmail.com", "This is a Jonas note.")
	# 	db.add(row1)
	# 	, db.modify_row()
	# end
end
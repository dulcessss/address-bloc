=begin #8 we tell Ruby to load the library named 'entry.rb' relative to
'address_book.rb' file path using 'require_relative'.
=end

require_relative 'entry'
require 'csv'

  class AddressBook
    attr_reader :entries

    def initialize
      @entries = []
    end

  def add_entry(name, phone_number, email)
    # #9 we create a variable to store the insertion 'index'
    index = 0
    entries.each do |entry|

=begin #10 we compare 'name' with the name of the current 'entry'.
If 'name' lexicographically proceeds 'entry.name', we've found the 'index' to insert at.
Otherwise we increment 'index' and continue comparing with the other entries.
=end

      if name < entry.name
        break
      end
      index+= 1
    end

    # #11 we insert a new entry into 'entries' using the calculated index.

    entries.insert(index, Entry.new(name, phone_number, email))
  end

=begin
#7  we defined import_from_csv. The method starts by reading the file, using
File.read. The file will be in a CSV format. We use the CSV class to parse the
file. The result of CSV.parse is an object of type CSV::Table.
=end

    def import_from_csv(file_name)
      # Implementations goes here
      csv_text = File.read(file_name)
      csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

=begin
  #8 we iterate over the CSV::Table object's rows. On the next line we
  create a hash for each row. We convert each row_hash to an Entry by using
  the add_entry method which will also add the Entry to the AddressBook's entries.
=end

      csv.each do |row|
        row_hash = row.to_hash
        add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
      end

  end
end

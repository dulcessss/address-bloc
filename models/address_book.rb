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

      csv.each do |row|
        row_hash = row.to_hash
        add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
      end
    end

    def iterative_search(name)
      @entries.each do |entry|
        if entry.name == name
          return entry
        end
      end

      return nil
      
    end

    def binary_search(name)
      lower = 0
      upper = entries.length - 1

      while lower <= upper
        mid = (lower + upper) / 2
        mid_name = entries[mid].name

        if name == mid_name
          return entries[mid]
        elsif name < mid_name
          upper = mid - 1
        elsif name > mid_name
          lower = mid + 1
        end
      end

      return nil

    end
end

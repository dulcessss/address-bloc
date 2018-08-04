=begin #8 we tell Ruby to load the library named 'entry.rb' relative to
'address_book.rb' file path using 'require_relative'.
=end

require_relative 'entry'

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
end

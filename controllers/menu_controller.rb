# #1 include AddressBook using require_relative
require_relative '../models/address_book'

class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    # #2 display the main menu options to the command line
    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from CSV"
    puts "5 - View entry n"
    puts "6 - Detonate all entries"
    puts "7 - Exit"
    print "Enter your selection: "

    # #3 retrieve user input from the command line using 'gets'.
    # 'gets' reads the next line from 'standard input'

    selection = gets.to_i

    # #7 use a 'case' statement operator to dertermine the proper response to the user's input.

    case selection
      when 1
        system 'clear'
        view_all_entries
        main_menu
      when 2
        system 'clear'
        create_entry
        main_menu
      when 3
        system 'clear'
        search_entries
        main_menu
      when 4
        system 'clear'
        read_csv
        main_menu

      when 5
        system 'clear'
        entry_n_submenu
        main_menu

      when 6
        system 'clear'
        @address_book.detonate
        puts "All entries have been deleted"
        main_menu

      when 7
        puts 'Good-bye!'

        # #8 terminate the program using 'exit(0)'. 0 signals the program is exiting without an error.

        exit(0)

        # #9 use an 'else' to catch invalid user input and prompt the user to retry.

      else
        system 'clear'
        puts 'Sorry, that is not a valid input'
        main_menu
    end
  end

  # #10 stub the rest of the methods called in main_menu.


  def entry_n_submenu
    print "Entry number to view: "
    selection = gets.chomp.to_i

    if selection < @address_book.entries.count
      puts @address_book.entries[selection]
      puts "Press enter to return to the main menu"
      gets.chomp
      system 'clear'
    else
      puts "#{selection} is not a valid input"
      entry_n_submenu
    end
  end

  def view_all_entries

    # #14 iterate through all entries in AddressBook using 'each'.
    address_book.entries.each do |entry|
      system 'clear'
      puts entry.to_s

    # #15 we call 'entry_submenu' to display a submenu for each entry.
    # Let's add this method at the bottom of 'MenuController'.
      entry_submenu(entry)
    end

    system 'clear'
    puts 'End of entries'
  end

  def create_entry
    # #11 clear the screen before displaying the create entry prompts.
    system 'clear'
    puts 'New AddressBloc Entry'

    # #12 use print to prompt the user for each 'Entry' attribute. 'print' works just like 'puts',
    # except that it doesn't add a newline.

    print 'Name: '
    name = gets.chomp
    print 'Phone number: '
    phone = gets.chomp
    print 'Email: '
    email = gets.chomp

    # #13 add a new entry to the address_book using 'add_entry' to ensure that the new entry is
    # is added in the proper order.

    address_book.add_entry(name, phone, email)

    system 'clear'
    puts 'New entry created'
  end

  def search_entries
    print "Search by name: "
    name = gets.chomp

    match = address_book.binary_search(name)
    system "clear"

    if match
      puts match.to_s
      search_submenu(match)
    else
      puts "No match found for #{name}"
    end
  end

  def read_csv
    print "Enter CSV file to import: "
    file_name = gets.chomp

    if file_name.empty?
      system "clear"
      puts "No CSV file read"
      main_menu
    end

    begin
      entry_count = address_book.import_from_csv(file_name).count
      system "clear"
      puts "#{entry_count} new entries added from #{file_name}"
    rescue
      puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file"
      read_csv
    end
  end


   def entry_submenu(entry)
     # #16 display the submenu options
     puts "n - next entry"
     puts "d - delete entry"
     puts "e - edit this entry"
     puts "m - return to main menu"

     # #17 'chomp' removes any trailing whitespace from the string 'gets' returns.
     # This is necessary because 'm ' or 'm\n' won't match 'm'.
     selection = gets.chomp

     case selection
     # #18 when the user asks to see the next entry, we can do nothing and control
     # will be returned 'view_all_entries'.
       when "n"
     # #19 we'll handle deleting and editing in another checkpoint, for now the user will be shown the next entry.
       when "d"
         delete_entry(entry)
       when "e"
         edit_entry(entry)
         entry_submenu(entry)
     # #20 we return the user to the main menu.
       when "m"
         system "clear"
         main_menu
       else
         system "clear"
         puts "#{selection} is not a valid input"
         entry_submenu(entry)
     end
   end

   def delete_entry(entry)
     address_book.entries.delete(entry)
     puts "#{entry.name} has been deleted"
   end

   def edit_entry(entry)
     print "Updated name: "
     name = gets.chomp
     print "Updated phone number: "
     phone_number = gets.chomp
     print "Updated email: "
     email = gets.chomp

     entry.name = name if !name.empty?
     entry.phone_number = phone_number if !phone_number.empty?
     entry.email = email if !email.empty?
     system "clear"

     puts "Updated entry: "
     puts entry
   end

   def search_submenu(entry)
     puts "\nd - delete entry"
     puts "e - edit this entry"
     puts "m - return to main menu"

     selection = gets.chomp

     case selection
      when "d"
        system "clear"
        delete_entry(entry)
        main_menu
      when "e"
        edit_entry(entry)
        system "clear"
        main_menu
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        puts entry.to_s
        search_submenu(entry)
      end

   end

end

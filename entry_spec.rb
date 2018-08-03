require_relative '../models/entry'
=begin
#1 is the standard first line of an RSpec test file.
We are saying that the file is a spec file and that it tests Entry.
=end
RSpec.describe Entry do

=begin
#2 we use 'describe' to give our test structure. In this case, we are using it to
communicate that the specs test the 'Entry' attributes.
=end

  describe "attributes" do

=begin
#3 we separate our individual tests using the 'it' method.
Each 'it' represents a unique test.
=end

    it "responds to name" do
      entry = Entry.new

=begin
#4 each RSpec test ends with one or more 'expect' method, to which we use to
declare the expectations for the test. If those expectations are met, our test
passes, if they are not, it fails.
=end

      expect(entry).to respond_to(:name)
    end
    it "responds to phone number" do
      entry = Entry.new
      expect(entry).to respond_to(:phone_number)
    end
    it "responds to email" do
      entry = Entry.new
      expect(entry).to respond_to(:email)
    end
  end
end

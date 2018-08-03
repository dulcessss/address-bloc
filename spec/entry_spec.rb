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
    let(:entry) {Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')}

=begin
#3 we separate our individual tests using the 'it' method.
Each 'it' represents a unique test.
=end

    it "responds to name" do

=begin
#4 each RSpec test ends with one or more 'expect' method, to which we use to
declare the expectations for the test. If those expectations are met, our test
passes, if they are not, it fails.
=end

      expect(entry).to respond_to(:name)
    end

    it "reports its name" do
      expect(entry.name).to eq('Ada Lovelace')
    end

    it "responds to phone number" do
      expect(entry).to respond_to(:phone_number)
    end

    it "reports its phone_number" do
      expect(entry.phone_number).to eq('010.012.1815')
    end

    it "responds to email" do
      expect(entry).to respond_to(:email)
    end

    it "reports its email" do
      expect(entry.email).to eq('augusta.king@lovelace.com')
    end
  end

=begin
 #5 we use a new describe block to separate the 'to_s' test from the
 initializer tests. The '#' in front of 'to_s' indicates that is is an instance method.
=end

    describe "#to_s" do
      it "prints an entry as a string" do
        entry = Entry.new('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
        expected_string = "Name: Ada Lovelace\nPhone Number: 010.012.1815\nEmail: augusta.king@lovelace.com"

=begin
 #6 we use 'eq' to check that 'to_s' returns a string equal to 'expected_string'.
=end
        expect(entry.to_s).to eq(expected_string)
      end
    end
end

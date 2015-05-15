require 'spec_helper'

RSpec.describe ValidatesFormattingOf::ModelAdditions do

  describe "email" do
    class Email < TestActiveRecord
      attr_accessor :email
      validates_formatting_of :email
    end
    it "validates that the email provided is valid" do
      expect(Email.new(:email => "example@example.com")).to be_valid
      expect(Email.new(:email => "badexample.com")).not_to be_valid
      expect(Email.new(:email => "mbridges.91@gmail.com")).to be_valid
      expect(Email.new(:email => "some-random%%%strangely-formatted-email@lots.of.subdomains.com")).to be_valid
      expect(Email.new(:email => "this__???{}|__should@be-valid.com")).to be_valid
      expect(Email.new(:email => "visitorservices@vmfa.museum")).to be_valid
      expect(Email.new(:email => "info@samoa.travel")).to be_valid
      expect(Email.new(:email => "info@-samoa.travel")).not_to be_valid
      expect(Email.new(:email => "info@samoa-.travel")).not_to be_valid
      expect(Email.new(:email => "info@123-samoa.travel")).to be_valid
      expect(Email.new(:email => "info@123-samoa.travel\n")).not_to be_valid
    end
  end

  describe "simple email for 1.8.7 and javascript validations (such as with client_side_validations)" do
    class SimpleEmail < TestActiveRecord
      attr_accessor :email
      validates_formatting_of :email, :using => :simple_email
    end
    it "validates that the email provided is valid" do
      expect(SimpleEmail.new(:email => "example@example.com")).to be_valid
      expect(SimpleEmail.new(:email => "badexample.com")).not_to be_valid
      expect(SimpleEmail.new(:email => "mbridges.91@gmail.com")).to be_valid
      expect(SimpleEmail.new(:email => "some-random%%%strangely-formatted-email@lots.of.subdomains.com")).to be_valid
      expect(SimpleEmail.new(:email => "this__???{}|__should@be-valid.com")).to be_valid
      expect(SimpleEmail.new(:email => "visitorservices@vmfa.museum")).to be_valid
      expect(SimpleEmail.new(:email => "info@samoa.travel")).to be_valid
      expect(SimpleEmail.new(:email => "info@-samoa.travel")).to be_valid
      expect(SimpleEmail.new(:email => "info@samoa-.travel")).to be_valid
      expect(SimpleEmail.new(:email => "info@123-samoa.travel")).to be_valid
      expect(SimpleEmail.new(:email => "info@123-samoa.travel\n")).not_to be_valid
    end
  end
  describe "url" do
    class Webpage < TestActiveRecord
      attr_accessor :url
      validates_formatting_of :url
    end
    it "validates that the url provided is valid" do
      expect(Webpage.new(:url => 'http://something.com')).to be_valid
      expect(Webpage.new(:url => 'http://something-else.com')).to be_valid
      expect(Webpage.new(:url => 'http://sub.domains.something-else.com')).to be_valid
      expect(Webpage.new(:url => 'http://username:password@something-else.com')).to be_valid
      expect(Webpage.new(:url => "http://username:password@something-else.com\n")).not_to be_valid
      expect(Webpage.new(:url => "something else")).not_to be_valid
    end
  end

  describe "us_zip" do
    class USZip < TestActiveRecord
      attr_accessor :zipcode
      validates_formatting_of :zipcode, :using => :us_zip
    end
    it "validates that the zipcode provided is valid" do
      expect(USZip.new(:zipcode => '92348')).to be_valid
      expect(USZip.new(:zipcode => '23434-2348')).to be_valid
      expect(USZip.new(:zipcode => "23434-2348\n")).not_to be_valid
      expect(USZip.new(:zipcode => '234')).not_to be_valid
      expect(USZip.new(:zipcode => '23408234')).not_to be_valid
      expect(USZip.new(:zipcode => 'invalid')).not_to be_valid
    end
  end

  describe "alpha" do
    class Alpha < TestActiveRecord
      attr_accessor :alpha
      validates_formatting_of :alpha
    end
    it "validates that the letters provided is valid" do
      expect(Alpha.new(:alpha => 'abscdsofjsdpfahdsofkajlsdfaspdhjfads')).to be_valid
      expect(Alpha.new(:alpha => 'asdfalskdfjhas-dlfhasdksdfaldhfadsfasdfa')).to be_valid
      expect(Alpha.new(:alpha => 'adsufasodfksadjfskjdfha98')).not_to be_valid
      expect(Alpha.new(:alpha => 'asdf ausdpf98hasdfo alsdf ja8 sd')).not_to be_valid
    end
  end

  describe "alphanum" do
    class Alphanum < TestActiveRecord
      attr_accessor :letters_and_numbers
      validates_formatting_of :letters_and_numbers, :using => :alphanum
    end
    it "validates that the letters provided is valid" do
      expect(Alphanum.new(:letters_and_numbers => 'numbersandlettersarevalid1234567890')).to be_valid
      expect(Alphanum.new(:letters_and_numbers => 'justletters')).to be_valid
      expect(Alphanum.new(:letters_and_numbers => 'letters and numbers 123 with spaces')).to be_valid
      expect(Alphanum.new(:letters_and_numbers => 'adding ; some special ** chars')).not_to be_valid
    end
  end

  describe "us_phone" do
    class USPhone < TestActiveRecord
      attr_accessor :phone_number
      validates_formatting_of :phone_number, :using => :us_phone
    end
    it "validates that the phone number provided is valid" do
      expect(USPhone.new(:phone_number => '(234) 234-3456')).to be_valid
      expect(USPhone.new(:phone_number => '123 123 3456')).to be_valid
      expect(USPhone.new(:phone_number => '1231233456')).to be_valid
      expect(USPhone.new(:phone_number => '123.123.3456')).to be_valid
      expect(USPhone.new(:phone_number => '(223)123-2347')).to be_valid
      expect(USPhone.new(:phone_number => "(223)123-2347\n")).not_to be_valid
      expect(USPhone.new(:phone_number => '(223 123-2347')).not_to be_valid
      expect(USPhone.new(:phone_number => '12349870238')).not_to be_valid
    end
  end

  describe "ip_address_v4" do
    class IPAddress < TestActiveRecord
      attr_accessor :ipv4
      validates_formatting_of :ipv4, :using => :ip_address_v4
    end
    it "validates that the IP address provided is valid" do
      expect(IPAddress.new(:ipv4 => '10.10.10')).not_to be_valid
      expect(IPAddress.new(:ipv4 => '999.10.10.20')).not_to be_valid
      expect(IPAddress.new(:ipv4 => '2222.22.22.22')).not_to be_valid
      expect(IPAddress.new(:ipv4 => '22.2222.22.2')).not_to be_valid
      expect(IPAddress.new(:ipv4 => '127.0.0.1')).to be_valid
      expect(IPAddress.new(:ipv4 => '132.254.111.10')).to be_valid
      expect(IPAddress.new(:ipv4 => "132.254.111.10\n")).not_to be_valid
    end
  end

  # For clarification, NONE of the following numbers are real credit card numbers.
  # They only match the pattern. These were randomly made for testing.
  describe "credit_card" do
    class Client < TestActiveRecord
      attr_accessor :cc
      validates_formatting_of :cc, :using => :credit_card
    end
    it "validates that the credit card number provided is valid" do
      expect(Client.new(:cc => '4264-2879-1230-0000')).to be_valid # Visa style
      expect(Client.new(:cc => '6011-1111-0000-2391')).to be_valid # Discover style
      expect(Client.new(:cc => '5422434400828888')).to be_valid # Mastercard style
      expect(Client.new(:cc => "5422434400828889\n")).not_to be_valid # Mastercard style
      expect(Client.new(:cc => '1233444444444444')).not_to be_valid # fake
    end
  end

  describe "ssn" do
    class AnotherPerson < TestActiveRecord
      attr_accessor :ssn
      validates_formatting_of :ssn
    end
    it "validates that the social security number provided is valid" do
      expect(AnotherPerson.new(:ssn => "145.47.0191")).to be_valid
      expect(AnotherPerson.new(:ssn => "223-43-2343")).to be_valid
      expect(AnotherPerson.new(:ssn => "999.55.8888")).to be_valid
      expect(AnotherPerson.new(:ssn => "999.55.8888\n")).not_to be_valid
      expect(AnotherPerson.new(:ssn => "28934")).not_to be_valid
      expect(AnotherPerson.new(:ssn => "228934828934934")).not_to be_valid
      expect(AnotherPerson.new(:ssn => "23498.7234")).not_to be_valid
    end
  end

  describe "hex_color" do
    class Color < TestActiveRecord
      attr_accessor :color
      validates_formatting_of :color, :using => :hex_color
    end
    it "validates that the hex color value provided is valid" do
      expect(Color.new(:color => "efefef")).to be_valid
      expect(Color.new(:color => "98de89")).to be_valid
      expect(Color.new(:color => "000011")).to be_valid
      expect(Color.new(:color => "132")).to be_valid
      expect(Color.new(:color => "eef")).to be_valid
      expect(Color.new(:color => "eef\n")).not_to be_valid
      expect(Color.new(:color => "efefe")).not_to be_valid
      expect(Color.new(:color => "zsdfsd")).not_to be_valid
      expect(Color.new(:color => "p98hul;")).not_to be_valid
      expect(Color.new(:color => "sdfsdfsf")).not_to be_valid
    end
  end

  describe "validation options" do
    class Phony < TestActiveRecord
      attr_accessor :phone, :phone2
      validates_formatting_of :phone, :using => :us_phone, :on => :create
      validates_formatting_of :phone2, :using => :us_phone, :on => :update
    end
    it "validates the phone formatting only on creation" do
      option = Phony.new(:phone => "(123) 234-4567")
      expect(option).to be_valid
      option.phone = "123123123"
      expect(option).to be_valid
    end

    class Iffy < TestActiveRecord
      attr_accessor :name, :phone
      validates_presence_of :name
      validates_formatting_of :phone, :using => :us_phone, :if => lambda { |iffy| iffy.name == "Matthew" }
    end
    it "validates the phone formatting only if a name is specified" do
      expect(Iffy.new(:phone => "(123 345-4567", :name => "Bill")).to be_valid
      expect(Iffy.new(:phone => "(123 345-4567", :name => "Matthew")).not_to be_valid
    end

    class Unlessy < TestActiveRecord
      attr_accessor :name, :phone
      validates_presence_of :name
      validates_formatting_of :phone, :using => :us_phone, :unless => lambda { |unlessy| unlessy.name == "Matthew" }
    end
    it "validates the phone formatting only if a name is specified" do
      expect(Unlessy.new(:phone => "(123 345-4567", :name => "Bill")).not_to be_valid
      expect(Unlessy.new(:phone => "(123 345-4567", :name => "Matthew")).to be_valid
    end
  end
  describe "dollars" do
    class Money < TestActiveRecord
      attr_accessor :amount
      validates_formatting_of :amount, :using => :dollars
    end
    it "validates that the dollars amount provided is valid" do
      expect(Money.new(:amount => "$100.00")).to be_valid
      expect(Money.new(:amount => "100.00")).to be_valid
      expect(Money.new(:amount => "12,234,343")).to be_valid
      expect(Money.new(:amount => "$12.34")).to be_valid
      expect(Money.new(:amount => "120,123,232.32")).to be_valid
      expect(Money.new(:amount => "$$1111111100")).not_to be_valid
      expect(Money.new(:amount => "100;00")).not_to be_valid
      expect(Money.new(:amount => "238,3423,42..99")).not_to be_valid
      expect(Money.new(:amount => "$-233")).not_to be_valid
    end
  end
  describe "custom messages" do
    class Message < TestActiveRecord
      attr_accessor :first_name
      validates_formatting_of :first_name, :using => :alpha, :message => "is not a valid first name"
    end
    it "are allowed and can be used in displaying error messages" do
      message = Message.new(:first_name => "invalid-first-name-123")
      expect(message).not_to be_valid
      expect(message.errors.keys.class).to eq Array
      expect(message.errors.full_messages.first).to match(/is not a valid first name/)
    end
  end

  describe "default error messages" do
    class Problems < TestActiveRecord
      attr_accessor :name
      validates_formatting_of :name, :using => :alpha
    end
    it "set a default error" do
      problems = Problems.new(:name => "sdfs12312dfsd")
      expect(problems).not_to be_valid
      expect(problems.errors.full_messages.first).to match(/letters/i)
      email = Email.new(:email => "not.an.email.address")
      expect(email).not_to be_valid
      expect(email.errors.full_messages.first).to match(/email/i)
    end
  end

  describe "nil and blank values" do
    class PeopleTest < TestActiveRecord
      attr_accessor :email, :email2, :email3
      validates_formatting_of :email, :allow_nil => true
      validates_formatting_of :email2, :using => :email, :allow_blank => true
      validates_formatting_of :email3, :using => :email
    end
    let(:people) { PeopleTest.new(:email => "mbridges.91@gmail.com", :email2 => "mbridges.91@gmail.com", :email3 => "mbridges.91@gmail.com") }
    it "should test nil and blank values correctly" do
      people.email = nil
      expect(people).to be_valid
      people.email = "mbridges.91@gmail.com"
      people.email2 = ""
      expect(people).to be_valid
      people.email2 = "mbridges.91@gmail.com"
      people.email3 = nil
      expect(people).not_to be_valid
    end
  end

end

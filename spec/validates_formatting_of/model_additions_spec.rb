require 'spec_helper'

describe ValidatesFormattingOf::ModelAdditions do

  describe "email" do

    class Email < SuperModel::Base
      validates_formatting_of :email, :using => :email
    end
    it "validates that the email provided is valid" do
      Email.new(:email => "example@example.com").should be_valid
      Email.new(:email => "badexample.com").should_not be_valid
      Email.new(:email => "mbridges.91@gmail.com").should be_valid
      Email.new(:email => "some-random%%%strangely-formatted-email@lots.of.subdomains.com").should be_valid
      Email.new(:email => "this__???{}|__should@be-valid.com").should be_valid
    end

  end
  describe "url" do

    class Webpage < SuperModel::Base
      validates_formatting_of :url, :using => :url
    end
    it "validates that the email provided is valid" do
      Webpage.new(:url => 'http://something.com').should be_valid
      Webpage.new(:url => "something else").should_not be_valid
    end

  end
  describe "us_zip" do
    
    class USZip < SuperModel::Base
      validates_formatting_of :zipcode, :using => :us_zip
    end
    it "validates that the email provided is valid" do
      USZip.new(:zipcode => '92348').should be_valid
      USZip.new(:zipcode => '23434-2348').should be_valid
      USZip.new(:zipcode => '234').should_not be_valid
      USZip.new(:zipcode => '23408234').should_not be_valid
      USZip.new(:zipcode => 'invalid').should_not be_valid
    end

  end
  describe "alpha" do
    
    class Alpha < SuperModel::Base
      validates_formatting_of :letters, :using => :alpha
    end
    it "validates that the email provided is valid" do
      Alpha.new(:letters => 'abscdsofjsdpfahdsofkajlsdfaspdhjfads').should be_valid
      Alpha.new(:letters => 'asdfalskdfjhas-dlfhasdksdfaldhfadsfasdfa').should be_valid
      Alpha.new(:letters => 'adsufasodfksadjfskjdfha98').should_not be_valid
      Alpha.new(:letters => 'asdf ausdpf98hasdfo alsdf ja8 sd').should_not be_valid
    end

  end
  describe "alphanum" do
    
    class Alphanum < SuperModel::Base
      validates_formatting_of :letters_and_numbers, :using => :alphanum
    end
    it "validates that the email provided is valid" do
      Alphanum.new(:letters_and_numbers => 'numbersandlettersarevalid1234567890').should be_valid
      Alphanum.new(:letters_and_numbers => 'justletters').should be_valid
      Alphanum.new(:letters_and_numbers => 'letters and numbers 123 with spaces').should be_valid
      Alphanum.new(:letters_and_numbers => 'adding ; some special ** chars').should_not be_valid
    end

  end
  describe "us_phone" do
    
    class USPhone < SuperModel::Base
      validates_formatting_of :phone_number, :using => :us_phone
    end
    it "validates that the email provided is valid" do
      USPhone.new(:phone_number => '(234) 234-3456').should be_valid
      USPhone.new(:phone_number => '123 123 3456').should be_valid
      USPhone.new(:phone_number => '(223)123-2347').should be_valid
      USPhone.new(:phone_number => '2349870238').should_not be_valid
      USPhone.new(:phone_number => '12349870238').should_not be_valid
    end

  end
  describe "us_phone" do
    
    class IPAddress < SuperModel::Base
      validates_formatting_of :ip, :using => :ip_address
    end
    it "validates that the email provided is valid" do
      IPAddress.new(:ip => '10.10.10').should_not be_valid
      IPAddress.new(:ip => '999.10.10.20').should_not be_valid
      IPAddress.new(:ip => '2222.22.22.22').should_not be_valid
      IPAddress.new(:ip => '22.2222.22.2').should_not be_valid
      IPAddress.new(:ip => '127.0.0.1').should be_valid
      IPAddress.new(:ip => '132.254.111.10').should be_valid
    end

  end
  describe "us_phone" do
    
    class IPAddress < SuperModel::Base
      validates_formatting_of :ip, :using => :ip_address
    end
    it "validates that the email provided is valid" do
      IPAddress.new(:ip => '10.10.10').should_not be_valid
      IPAddress.new(:ip => '999.10.10.20').should_not be_valid
      IPAddress.new(:ip => '2222.22.22.22').should_not be_valid
      IPAddress.new(:ip => '22.2222.22.2').should_not be_valid
      IPAddress.new(:ip => '127.0.0.1').should be_valid
      IPAddress.new(:ip => '132.254.111.10').should be_valid
    end

  end  
  # For clarification, NONE of the following numbers are real credit card numbers.
  # They only match the pattern. These were randomly made for testing.
  describe "credit_card" do
    
    class Client < SuperModel::Base
      validates_formatting_of :cc, :using => :credit_card
    end
    it "validates that the email provided is valid" do
      Client.new(:cc => '4264-2879-1230-0000').should be_valid # Visa style
      Client.new(:cc => '6011-1111-0000-2391').should be_valid # Discover style
      Client.new(:cc => '5422434400828888').should be_valid # Mastercard style
      Client.new(:cc => '1233444444444444').should_not be_valid # fake
    end

  end
end
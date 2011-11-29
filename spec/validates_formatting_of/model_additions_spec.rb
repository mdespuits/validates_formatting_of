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

end
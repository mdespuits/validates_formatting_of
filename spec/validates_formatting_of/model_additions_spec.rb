require 'spec_helper'

class SuperModel::Base
  include ActiveModel::Validations::Callbacks
  extend ValidatesFormattingOf::ModelAdditions
end

class Email < SuperModel::Base
  validates_formatting_of :email, using: :email
end

class Webpage < SuperModel::Base
  validates_formatting_of :url, using: :url
end


describe ValidatesFormattingOf::ModelAdditions do

  describe "email" do

    it "validates that the email provided is valid" do
      Email.new(email: "example@example.com").should be_valid
      Email.new(email: "badexample.com").should_not be_valid
      Email.new(email: "mbridges.91@gmail.com").should be_valid
      Email.new(email: "some-random%%%strangely-formatted-email@lots.of.subdomains.com").should be_valid
      Email.new(email: "this__???{}|__should@be-valid.com").should be_valid
    end

  end
  describe "url" do

    it "validates that the email provided is valid" do
      Webpage.new(url: 'http://something.com').should be_valid
      Webpage.new(url: "something else").should_not be_valid
    end
  end

end
require 'spec_helper'

class SuperModel::Base
  include ActiveModel::Validations::Callbacks
  extend ValidatesFormattingOf::ModelAdditions
end

class Comment < SuperModel::Base
  validates_formatting_of :email, by: :email
end

class Webpage < SuperModel::Base
  validates_formatting_of :url, by: :url
end


describe ValidatesFormattingOf::ModelAdditions do

  describe "email" do

    it "validates that the email provided is valid" do
      Comment.new(email: "example@example.com").should be_valid
      Comment.new(email: "badexample.com").should_not be_valid
    end

  end
  describe "url" do

    it "validates that the email provided is valid" do
      Webpage.new(url: 'http://something.com').should be_valid
      Webpage.new(url: "something else").should_not be_valid
    end
  end

end
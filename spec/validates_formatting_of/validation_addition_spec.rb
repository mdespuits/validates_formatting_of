require 'validates_formatting_of/validation_addition'

module ValidatesFormattingOf

  class TestAdding
    extend ValidationAddition
  end

  describe ValidationAddition do
    before do
      TestAdding.add :email, /email/i
    end
    it "should be able to add new validations" do
      TestAdding.add :another, /another/i
      TestAdding.validations.count.should == 2
      TestAdding.validations[:email].should be_instance_of Validation
      TestAdding.validations[:another].should be_instance_of Validation
    end
    it "should be able to retrive the method through Hash-like syntax" do
      TestAdding[:email].should be_instance_of Validation
      expect { TestAdding[:name] }.to raise_error MissingValidation
    end
    it "should be able to smartly determine the method to use" do
      validation = TestAdding.find(:email)
      validation.name.should == :email
      validation.regex.should == /email/i
      validation = TestAdding.find(:non_existent_validation, :using => :email)
      validation.name.should == :email
      validation.regex.should == /email/i
    end
    it "should raise an error if the method does not exist" do
      expect { TestAdding.find(:fake) }.to raise_error MissingValidation
    end
    it "should be able to determine if the method exists" do
      TestAdding.exists?(:email).should be_true
      TestAdding.exists?(:non_existent).should be_false
    end
  end
end

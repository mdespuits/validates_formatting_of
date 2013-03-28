require 'validates_formatting_of/validation_addition'

module ValidatesFormattingOf

  class TestAdding
    extend ValidationAddition
    def self.clear!
      @validations = nil
    end
  end

  describe ValidationAddition do
    before do
      TestAdding.clear!
      TestAdding.add :email, /email/i
    end
    it "should be able to add new validations" do
      TestAdding.add :another, /another/i
      TestAdding.validations.count.should == 2
      TestAdding.validations['email'].should be_instance_of Validation
      TestAdding.validations['another'].should be_instance_of Validation
    end
    describe "find" do
      context "implicit validation method" do
        subject { TestAdding.find(:email) }
        its(:name) { should == :email }
        its(:regex) { should == /email/i }
      end
      context "explicit validation method" do
        subject { TestAdding.find(:non_existent_validation, :using => :email) }
        its(:name)  { should == :email   }
        its(:regex) { should == /email/i }
      end
    end
    it "should raise an error if the method does not exist" do
      expect { TestAdding.find(:fake) }.to raise_error MissingValidation
    end
    it "should be able to determine if the method does not exist" do
      TestAdding.exists?(:email).should be_true
      TestAdding.exists?(:non_existent).should be_false
    end
    it "should be able to accept strings for validation names (for namespacing)" do
      TestAdding.add "namespace:phone", /namespace/i
      TestAdding.exists?("namespace:phone").should be_true
    end
    it "should be able to determine if the method is missing" do
      TestAdding.missing?(:non_existent).should be_true
      TestAdding.missing?(:email).should be_false
    end
  end
end

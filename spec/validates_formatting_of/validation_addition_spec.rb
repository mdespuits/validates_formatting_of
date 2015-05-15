require 'validates_formatting_of/validation_addition'
require 'its'

module ValidatesFormattingOf

  class TestAdding
    extend ValidationAddition
    def self.clear!
      @validations = nil
    end
  end

  RSpec.describe ValidationAddition do
    before do
      TestAdding.clear!
      TestAdding.add :email, /email/i
    end
    it "should be able to add new validations" do
      TestAdding.add :another, /another/i
      expect(TestAdding.validations.count).to eq(2)
      expect(TestAdding.validations['email']).to be_instance_of Validation
      expect(TestAdding.validations['another']).to be_instance_of Validation
    end
    describe "find" do
      context "implicit validation method" do
        subject { TestAdding.find(:email) }
        its(:name) { is_expected.to eq(:email) }
        its(:regex) { is_expected.to eq(/email/i) }
      end
      context "explicit validation method" do
        subject { TestAdding.find(:non_existent_validation, :using => :email) }
        its(:name)  { is_expected.to eq(:email)   }
        its(:regex) { is_expected.to eq(/email/i) }
      end
    end
    it "should raise an error if the method does not exist" do
      expect { TestAdding.find(:fake) }.to raise_error MissingValidation
    end
    it "should be able to determine if the method does not exist" do
      expect(TestAdding.exists?(:email)).to be_truthy
      expect(TestAdding.exists?(:non_existent)).to be_falsey
    end
    it "should be able to accept strings for validation names (for namespacing)" do
      TestAdding.add "namespace:phone", /namespace/i
      expect(TestAdding.exists?("namespace:phone")).to be_truthy
    end
    it "should be able to determine if the method is missing" do
      expect(TestAdding.missing?(:non_existent)).to be_truthy
      expect(TestAdding.missing?(:email)).to be_falsey
    end
  end
end

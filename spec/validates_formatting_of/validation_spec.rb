require 'validates_formatting_of/validation'
require 'its'

module ValidatesFormattingOf

  RSpec.describe Validation do
    context "valid validation creation" do
      let(:validation) { Validation.new(:name, /something/i, "is an invalid value") }
      subject { validation }
      its(:name) { is_expected.to eq(:name) }
      its(:regex) { is_expected.to eq(%r{something}i) }
      its(:message) { is_expected.to eq('is an invalid value') }
      its(:to_s) { is_expected.to eq("<Validation::name>") }
      its(:inspect) { is_expected.to match(/Validation/) }
      its(:inspect) { is_expected.to match(/\/something\/i/) }
      its(:inspect) { is_expected.to match(/\:name/) }
    end
    context "invalid validation creation" do
      it "should raise an error if the specified regex is not a Regexp objct" do
        expect { Validation.new(:name, 123, "is an invalid value") }.to raise_error
      end
      it "should not raise an error if the specified regex is a proc or a lambda" do
        expect { Validation.new(:name, lambda { "my record" }, "is an invalid value") }.not_to raise_error
        expect { Validation.new(:name, proc { "my record" }, "is an invalid value") }.not_to raise_error
      end
      it "should not raise an error if the regex if valid" do
        expect { Validation.new(:name, /something/i, "is an invalid value") }.not_to raise_error
      end
    end
  end

end

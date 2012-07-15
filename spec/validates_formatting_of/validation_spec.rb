require 'validates_formatting_of/validation'

module ValidatesFormattingOf

  describe Validation do
    context "valid validation creation" do
      let(:validation) { Validation.new(:name, /something/i, "is an invalid value") }
      it "should receive the right parameters" do
        validation.name.should == :name
        validation.regex.should == %r{something}i
        validation.message.should == 'is an invalid value'
      end
      it "should print properly" do
        validation.to_s.should == "<Validation::name>"
      end
      it "should be inspected properly" do
        validation.inspect.should =~ /Validation/
        validation.inspect.should =~ /\/something\/i/
        validation.inspect.should =~ /\:name/
      end
    end
    context "invalid validation creation" do
      it "should raise an error if the specified regex is not a Regexp objct" do
        expect { Validation.new(:name, 123, "is an invalid value") }.to raise_error InvalidRegularExpression
      end
      it "should not raise an error if the specified regex is a proc or a lambda" do
        expect { Validation.new(:name, lambda { "my record" }, "is an invalid value") }.not_to raise_error InvalidRegularExpression
        expect { Validation.new(:name, proc { "my record" }, "is an invalid value") }.not_to raise_error InvalidRegularExpression
      end
      it "should not raise an error if the regex if valid" do
        expect { Validation.new(:name, /something/i, "is an invalid value") }.not_to raise_error InvalidRegularExpression
      end
    end
  end

end

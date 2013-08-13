require 'validates_formatting_of/validation'

module ValidatesFormattingOf

  describe Validation do
    context "valid validation creation" do
      let(:validation) { Validation.new(:name, /something/i, "is an invalid value") }
      subject { validation }
      its(:name) { should == :name }
      its(:regex) { should == %r{something}i }
      its(:message) { should == 'is an invalid value' }
      its(:to_s) { should == "<Validation::name>" }
      its(:inspect) { should =~ /Validation/ }
      its(:inspect) { should =~ /\/something\/i/ }
      its(:inspect) { should =~ /\:name/ }
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

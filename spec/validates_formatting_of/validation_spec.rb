require 'validates_formatting_of/validation'

module ValidatesFormattingOf

  describe Validation do
    it "should receive the right parameters" do
      val = Validation.new(:name, /something/i, "is an invalid value")
      val.name.should == :name
      val.regex.should == %r{something}i
      val.message.should == 'is an invalid value'
    end
    it "should be inspected properly" do
      val = Validation.new(:name, /something/i, "is an invalid value")
      val.inspect.should =~ /Validation/
      val.inspect.should =~ /\/something\/i/
      val.inspect.should =~ /\:name/
    end
    it "should issue a warning if the specified regex is not a Regexp object" do
      Kernel.should_receive(:warn).with("You must specify a Regexp object in :name for proper validation.")
      Validation.new(:name, 123, "is an invalid value")

    end
  end

end

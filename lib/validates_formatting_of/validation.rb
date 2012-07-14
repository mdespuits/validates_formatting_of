module ValidatesFormattingOf
  class Validation
    attr_reader :name, :regex, :message

    def initialize(name, regexp, message = "is not correctly formatted")
      if regexp.class.to_s != "Regexp"
        Kernel.warn "You must specify a Regexp object in #{name.inspect} for proper validation."
      end
      @name, @regex, @message = name, regexp, message
    end

    def inspect
      "#<Validation name: #{name.inspect}, regex: #{regex.inspect}, message: #{message}>"
    end
  end
end

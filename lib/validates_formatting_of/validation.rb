module ValidatesFormattingOf

  class InvalidRegularExpression < StandardError
    def initialize(name)
      super("You must specify a Regexp, a proc, or a lambda for the #{name.inspect} validation.")
    end
  end

  class Validation
    attr_reader :name, :regex, :message

    def initialize(name, regexp, message = "is not correctly formatted")
      callable = regexp.respond_to? :call
      if !callable && regexp.class.to_s != "Regexp"
        raise InvalidRegularExpression.new(name)
      end
      @name, @regex, @message = name, regexp, message
    end

    def inspect
      "#<Validation name: #{name.inspect}, regex: #{regex.inspect}, message: #{message}>"
    end

    def to_s
      "<Validation::#{name.to_s}>"
    end
  end
end

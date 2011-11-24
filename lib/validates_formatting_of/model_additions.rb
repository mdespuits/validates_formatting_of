require 'validates_formatting_of/formatting_methods'
module ValidatesFormattingOf
  module ModelAdditions
    def validates_formatting_of(attribute, opts = {})
      if opts[:make_formatting]
        before_validation do
          # add validations here
        end
      end
      validates_format_of attribute, with: validate_with(opts[:by]), message: opts[:message]
    end

    def validate_with(method)
      formatting.send(method)
    end

    def formatting
      @formatting ||= FormattingMethods.new
    end
  end
end
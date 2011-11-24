# require 'validates_formatting_of/validating_methods'
module ValidatesFormattingOf
  module ModelAdditions
    def validates_formatting_of(attribute, opts = {})
      unless opts[:preformat].nil?
        before_validation do
          # add formatting changes here
        end
      end
      validates_format_of attribute, with: validate_with(opts[:by]), message: opts[:message]
    end

    # Actually retrieve the regex to check against
    def validate_with(method)
      formatting.send(method)
    end

    def formatting
      @formatting ||= ValidatingMethods.new
    end
  end
end
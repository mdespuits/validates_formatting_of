module ValidatesFormattingOf
  module ModelAdditions
    def validates_formatting_of(attribute, opts = {})

      # Here is where the input is formatted before it is validated.
      # Not yet implemented.
      # 
      # unless opts[:preformat].nil?
      #   before_validation do
      #     # add formatting changes here
      #   end
      # end

      regex_for_validation = opts[:regex] || validate_with(opts[:using])

      validates_format_of attribute, :with => regex_for_validation, :message => opts[:message]
    end

    # Actually retrieve the regex to check against
    def validate_with(method)
      formatting.send(method)
    end

    # Grab the validating methods
    def formatting
      @formatting ||= ValidatingMethods.new
    end
  end
end
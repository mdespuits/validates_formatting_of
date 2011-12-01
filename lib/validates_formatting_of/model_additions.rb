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

      # Add :allow_nil and :allow_blank options. Both are false by default.
      allow_nil = opts[:allow_nil] || false
      allow_blank = opts[:allow_blank] || false

      validation_message = ValidationMessages.message(attribute)
      if opts[:message]
        validation_message = opts[:message]
      end

      validates attribute,  :format => {  :with     =>  regex_for_validation,
                                          :message  =>  validation_message },
                            :allow_nil => allow_nil,
                            :allow_blank => allow_blank
    end

  private

    def validate_with(method)
      # Actually retrieve the regex to check against
      formatting.send(method)
    end

    def formatting
      # Grab the validating methods
      @formatting ||= ValidatingMethods.new
    end
  end
end
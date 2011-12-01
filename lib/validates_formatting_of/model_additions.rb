module ValidatesFormattingOf
  module ModelAdditions

    # Using validates_formatting_of is as simple as using Rails' built-in 
    # validation methods in models.
    # 
    # class User < ActiveRecord::Base
    #   validates_formatting_of :email, :using => :email
    # end
    # 
    # This call will ensure that the user-provided email is a valid email. This way, 
    # you will not need to find or write your own regex to validate. All of that 
    # logic is contained within `validates_formatting_of`
    def validates_formatting_of(attribute, opts = {})

      regex_for_validation = opts[:regex] || validate_with(opts[:using])

      # Add :allow_nil and :allow_blank options. Both are false by default.
      allow_nil = opts[:allow_nil] || false
      allow_blank = opts[:allow_blank] || false
      validation_message = opts[:message] || ValidationMessages.message(opts[:using])

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
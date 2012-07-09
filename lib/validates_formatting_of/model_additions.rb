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
    # 
    # You can also pass conditions and options for Rails to use
    # * :if
    # * :unless
    # * :allow_nil
    # * :allow_blank
    # * :on
    def validates_formatting_of(attribute, opts={})
      regex_for_validation = opts[:regex] || validate_with(opts[:using])
      validation_message = opts[:message] || ValidationMessages.message(opts[:using])
      options = {
        :format => {
          :with => regex_for_validation,
          :message => validation_message,
        }
      }
      %w(allow_nil allow_blank if unless on).each do |opt|
        options.merge!(opt.to_sym => opts[opt.to_sym]) if opts[opt.to_sym].present?
      end
      validates(attribute, options)
    end

  private

    def validate_with(method)
      # Actually retrieve the regex to check against
      ValidatingMethods.send(method)
    end

  end
end

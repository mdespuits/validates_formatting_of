module ValidatesFormattingOf
  module ModelAdditions

    # Using validates_formatting_of is as simple as using Rails' built-in
    # validation methods in models.
    #
    # class User < ActiveRecord::Base
    #   validates_formatting_of :email, :using => :email
    # end
    #
    # If your column name is idencital to any of the built-in methods, you
    # may leave off the `:using` option and validates_formatting_of will
    # automatically use the validation with the matching name.
    #
    # class User < ActiveRecord::Base
    #   validates_formatting_of :email
    # end
    #
    # You can also pass conditions and options for Rails to use
    # * :if
    # * :unless
    # * :allow_nil
    # * :allow_blank
    # * :on
    def validates_formatting_of(attribute, opts = {})
      validation = Method.find(attribute, opts)

      options = {
        :with => validation.regex,
        :message => validation.message,
      }.merge!(opts)

      self.validates_format_of(attribute, options)
    end

  end
end

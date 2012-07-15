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
    def validates_formatting_of(attribute, opts={})

      validation = Method.find(attribute, opts)

      options = {
        :format => {
          :with => (opts[:regex] || validation.regex),
          :message => (opts[:message] || validation.message),
        }
      }
      %w[allow_nil allow_blank if unless on].each do |opt|
        options.merge!(opt.to_sym => opts[opt.to_sym]) if opts[opt.to_sym].present?
      end
      validates(attribute, options)
    end

  end
end

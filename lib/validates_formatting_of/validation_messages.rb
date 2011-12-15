module ValidatesFormattingOf
  module ValidationMessages

    class Messages

      def self.hash
        {
          :email => "is not a valid email",
          :url => "is not a valid URL",
          :alpha => "must be only letters or dashes",
          :alphanum => "must be letters, numbers",
          :credit_card => "is not a valid credit card number",
          :us_zip => "is not a valid zipcode",
          :us_phone => "is not a valid phone number",
          :ip_address => "is not a valid IP address",
          :ssn => "is not a valid social security number",
          :hex_color => "is not a valid hex color",
          :dollars => "is not a valid dollar amount"
        }
      end

    end

    extend self

    def message(message)
      Messages.hash[message.to_s.downcase.to_sym]
    end

  end
end

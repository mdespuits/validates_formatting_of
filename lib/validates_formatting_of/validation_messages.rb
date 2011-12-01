module ValidatesFormattingOf
  module ValidationMessages

    extend self

    @@messages = {
      :email => "is not a valid email",
      :url => "is not a valid URL",
      :alpha => "must be only letters or dashes",
      :alphanum => "must be letters, numbers",
      :credit_card => "is not a valid credit card number",
      :us_zip => "is not a valid zipcode",
      :us_phone => "is not a valid phone number",
      :ip_address => "is not a valid IP address",
      :ssn => "is not a valid social security number"
    }

    def self.message(message)
      puts @@messages[message.to_sym]
    end

  end
end
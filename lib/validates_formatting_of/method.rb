require 'validates_formatting_of/validation'
require 'validates_formatting_of/validation_addition'

module ValidatesFormattingOf
  module Method

    extend ValidationAddition

    # This method is very close to allowing what is specified in RFC 5322 and RFC 5321
    add :email, %r{\A([^@\s]+)@((?:(?!-)[-a-z0-9]+(?<!-)\.)+[a-z]{2,})\z}i, "is not a valid email"

    # Thie version of the email exists to support common validation libraries (such
    # as client_side_validations) that require access to Rails' validation. Look-behinds
    # are not supported in javascript.
    add :simple_email, %r{\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z}i, "is not a valid email"

    # Taken from Ryan Bates' screencast on extracting gems. Works extremely well. Thanks Ryan!
    # (slightly revised to work on MRI 1.8.7 and ree)
    add :url, %r{\Ahttps?:\/\/([^\s:@]+:[^\s:@]*@)?[A-Za-z\d\-]+(\.[A-Za-z\d\-]+)+\.?(:\d{1,5})?([\/?]\S*)?\z}i, "is not a valid URL"

    # No numbers or symbols. allows "-"
    add :alpha, %r{\A([^\d\W]|[-])*\Z}, "must be only letters or dashes"

    # Letters, numbers, and spaces
    add :alphanum, %r{\A[A-Z0-9\s]+\Z}i, "must be letters, numbers"

    # Visa, Mastercard, Discver, and American Express
    add :credit_card, %r{\A(((4\d{3})|(5[1-5]\d{2})|(6011))-?\d{4}-?\d{4}-?\d{4}|3[4,7]\d{13})\z}, "is not a valid credit card number"

    # US Zip code. ##### or #####-####
    add :us_zip, %r{\A\d{5}(-\d{4})?\z}, "is not a valid zipcode"

    # US Phone numbers.
    # Examples of valid formats:
    # * ###.###.####
    # * ###-###-####
    # * (###) ###-####
    # * (###)###-####
    # * #########
    # * ### ###-####
    add :us_phone, %r{\A(\((\d{3})\)|\d{3})[ |\.|\-]?(\d{3})[ |\.|\-]?(\d{4})\z}, "is not a valid phone number"

    # IP Address validation
    add :ip_address_v4, %r{\A(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\z}, "is not a valid IPv4 address"

    # Social Security Number pattern
    add :ssn, %r{\A\d{3}([-.]){1}\d{2}([-.]){1}\d{4}\z}, "is not a valid social security number"

    # Matches CSS colors either in three or six digit formats
    add :hex_color, %r{\A([A-F0-9]{6}|[A-F0-9]{3})\z}i, "is not a valid hex color"

    # Ensures that what value is passed is a dollar amount of some kind
    add :dollars, %r{\A\$?(\d{1,3}(\,\d{3})*|(\d+))(\.\d{2})?\z}, "is not a valid dollar amount"

  end
end

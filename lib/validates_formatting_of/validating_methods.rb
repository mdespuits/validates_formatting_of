module ValidatesFormattingOf
  class ValidatingMethods

    # This method is very close to allowing what is specified in RFC 5322 and RFC 5321
    def email
      /^[0-9A-Z!#$\%&'*+-\/=?^_`{|}~]+@[0-9A-Z\-.]+\.[A-Z]{2,4}$/i
    end

    # Taken from Ryan Bates' screencast on extracting gems. Works extremely well. Thanks Ryan!
    def url
      /^https?:\/\/([^\s:@]+:[^\s:@]*@)?[A-Za-z\d\-]+(\.[A-Za-z\d\-]+)+\.?(:\d{1,5})?([\/?]\S*)?$/iux
    end

    # No numbers of symbols. allows "-"
    def alpha
      /^([^\d\W]|[-])*$/
    end

    # Letters, numbers, and spaces
    def alphanum
      /^[A-Z0-9\s]+$/i
    end

    # Visa, Mastercard, Discver, and American Express
    def credit_card
      /^((4\d{3})|(5[1-5]\d{2})|(6011))-?\d{4}-?\d{4}-?\d{4}|3[4,7]\d{13}$/
    end

    # US Zip code. ##### or #####-####
    def us_zip
      /^\d{5}(-\d{4})?$/
    end

    # US Phone numbers. (###) ###-#### | (###)###-#### | ###-###-####
    def us_phone
      /^([\(]{1}[0-9]{3}[\)]{1}[ |\-]{0,1}|^[0-9]{3}[\-| ])?[0-9]{3}(\-| ){1}[0-9]{4}$/
    end

    def ip_address
      /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/
    end

    # Social Security Number pattern
    def ssn
      /^\d{3}([-.]){1}\d{2}([-.]){1}\d{4}$/
    end

  end
end
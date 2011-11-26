module ValidatesFormattingOf
  class ValidatingMethods

    # This method is very close to allowing what is specified in RFC 5322 and RFC 5321
    def email
      /^[0-9A-Z!#$\%&'*+-\/=?^_`{|}~]+@[0-9A-Z\-.]+\.[A-Z]{2,4}$/i
    end

    # Taken from Ryan Bates' screencast on extracting gems. Works extremely well. Thanks Ryan!
    def url
      /^https?:\/\/([^\s:@]+:[^\s:@]*@)?[-[[:alnum:]]]+(\.[-[[:alnum:]]]+)+\.?(:\d{1,5})?([\/?]\S*)?$/iux
    end

  end
end
module ValidatesFormattingOf
  class ValidatingMethods

    def email
      /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
    end

    # Taken from Ryan Bates' screencast on extracting gems. Works extremely well. Thanks Ryan!
    def url
      /^https?:\/\/([^\s:@]+:[^\s:@]*@)?[-[[:alnum:]]]+(\.[-[[:alnum:]]]+)+\.?(:\d{1,5})?([\/?]\S*)?$/iux
    end

  end
end
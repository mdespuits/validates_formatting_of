module ValidatesFormattingOf
  class FormattingMethods

    def email
      /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
    end

    def url
      /^https?:\/\/([^\s:@]+:[^\s:@]*@)?[-[[:alnum:]]]+(\.[-[[:alnum:]]]+)+\.?(:\d{1,5})?([\/?]\S*)?$/iux
    end

  end
end
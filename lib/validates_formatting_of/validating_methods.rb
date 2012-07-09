module ValidatesFormattingOf
  class ValidatingMethods
    class << self

      # This method is very close to allowing what is specified in RFC 5322 and RFC 5321
      def email
        %r{\A([^@\s]+)@((?:(?!-)[-a-z0-9]+(?<!-)\.)+[a-z]{2,})\Z}i
      end

      # Taken from Ryan Bates' screencast on extracting gems. Works extremely well. Thanks Ryan!
      # (slightly revised to work on MRI 1.8.7 and ree)
      def url
        %r{\Ahttps?:\/\/([^\s:@]+:[^\s:@]*@)?[A-Za-z\d\-]+(\.[A-Za-z\d\-]+)+\.?(:\d{1,5})?([\/?]\S*)?\Z}i
      end

      # No numbers of symbols. allows "-"
      def alpha
        %r{\A([^\d\W]|[-])*\Z}
      end

      # Letters, numbers, and spaces
      def alphanum
        %r{\A[A-Z0-9\s]+\Z}i
      end

      # Visa, Mastercard, Discver, and American Express
      def credit_card
        %r{\A((4\d{3})|(5[1-5]\d{2})|(6011))-?\d{4}-?\d{4}-?\d{4}|3[4,7]\d{13}\Z}
      end

      # US Zip code. ##### or #####-####
      def us_zip
        %r{\A\d{5}(-\d{4})?\Z}
      end

      # US Phone numbers.
      # Examples of valid formats:
      # * ###.###.####
      # * ###-###-####
      # * (###) ###-####
      # * (###)###-####
      # * #########
      # * ### ###-####
      def us_phone
        %r{\A(\((\d{3})\)|\d{3})[ |\.|\-]?(\d{3})[ |\.|\-]?(\d{4})\Z}
      end

      # IP Address validation
      def ip_address
        %r{\A(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\Z}
      end

      # Social Security Number pattern
      def ssn
        %r{\A\d{3}([-.]){1}\d{2}([-.]){1}\d{4}\Z}
      end

      # Matches CSS colors either in three or six digit formats
      def hex_color
        %r{\A([A-F0-9]{6}|[A-F0-9]{3})\Z}i
      end

      # Ensures that what value is passed is a dollar amount of some kind
      def dollars
        %r{\A\$?(\d{1,3}(\,\d{3})*|(\d+))(\.\d{2})?\Z}
      end

    end
  end
end

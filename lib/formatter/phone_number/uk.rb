Dir["#{File.dirname(__FILE__)}/error/*.rb"].sort.each { |file| require file }

module Formatter
  module PhoneNumber
    module UK
      VALID_BASE_LENGTH = 9
      VALID_PREFIXES_REGEX = /^\+447|^447|^07/
      TARGET_PREFIX = '+447'.freeze

      def self.format(number)
        number_no_wspace = number.delete(' ')

        case number_no_wspace
        when /[^0-9\+\s]|(?<=.)\+/
          raise Error::OnlyDigitsAndWhitespaceAllowed
        when VALID_PREFIXES_REGEX
          number_no_prefix =
            number_no_wspace.gsub(VALID_PREFIXES_REGEX, '')

          raise Error::TooLong if number_no_prefix.length > VALID_BASE_LENGTH
          raise Error::TooShort if number_no_prefix.length < VALID_BASE_LENGTH

          "#{TARGET_PREFIX}#{number_no_prefix}"
        else
          raise Error::MustMatchPrefixes
        end
      end
    end
  end
end

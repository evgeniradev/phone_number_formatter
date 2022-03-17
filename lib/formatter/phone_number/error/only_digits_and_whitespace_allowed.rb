module Formatter
  module PhoneNumber
    module UK
      module Error
        class OnlyDigitsAndWhitespaceAllowed < StandardError
          def initialize
            super('Mobile phone number can only contain digits and whitespace')
          end
        end
      end
    end
  end
end

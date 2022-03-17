module Formatter
  module PhoneNumber
    module UK
      module Error
        class TooLong < StandardError
          def initialize
            super('Mobile phone number is too long')
          end
        end
      end
    end
  end
end

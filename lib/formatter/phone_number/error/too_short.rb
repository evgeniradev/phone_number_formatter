module Formatter
  module PhoneNumber
    module UK
      module Error
        class TooShort < StandardError
          def initialize
            super('Mobile phone number is too short')
          end
        end
      end
    end
  end
end

module Formatter
  module PhoneNumber
    module UK
      module Error
        class MustMatchPrefixes < StandardError
          def initialize
            super('Mobile phone number must start with either +447, 447 or 07')
          end
        end
      end
    end
  end
end

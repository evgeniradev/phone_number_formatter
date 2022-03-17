require_relative '../../../lib/formatter/phone_number/uk'

RSpec.describe Formatter::PhoneNumber::UK do
  subject { described_class }

  it 'formats number with whitespace' do
    expect(subject.format('+44 7911 123447')).to eq('+447911123447')
  end

  it 'formats number that starts with 44' do
    expect(subject.format('447911123447')).to eq('+447911123447')
  end

  it 'formats number that starts with 07' do
    expect(subject.format('07911123447')).to eq('+447911123447')
  end

  context 'Errors' do
    it 'raises error if number is too long' do
      expect { subject.format('+4479111234471') }.to(
        raise_error(Formatter::PhoneNumber::UK::Error::TooLong)
      )
    end

    it 'raises error if number is too short' do
      expect { subject.format('+44791112345') }.to(
        raise_error(Formatter::PhoneNumber::UK::Error::TooShort)
      )
    end

    it 'raises error if number contains non-digits except for + at start' do
      expect { subject.format('+447911123+45') }.to(
        raise_error(
          Formatter::PhoneNumber::UK::Error::OnlyDigitsAndWhitespaceAllowed
        )
      )
    end

    it 'raises error if prefix is not +447, 447 or 07' do
      expect { subject.format('147911123447') }.to(
        raise_error(
          Formatter::PhoneNumber::UK::Error::MustMatchPrefixes
        )
      )
    end
  end
end

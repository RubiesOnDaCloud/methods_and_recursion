# erik -> ERIK
# Erik -> ERIK
# ERIK -> ERIK
# clovers -> "🍀 🍀 🍀 🍀 🍀 🍀"

def yourNameInUpperCase(name)
  return "🍀 🍀 🍀 🍀 🍀 🍀" if name == "clovers"
  return name.upcase
end



def englishNumber(number)
  return "Please enter a number that isn't negative." if number < 0
  return 'zero' if number.zero?
  numString = ''  # This is the string we will return.
  onesPlace = ['one',     'two',       'three',    'four',     'five',
               'six',     'seven',     'eight',    'nine']
  tensPlace = ['ten',     'twenty',    'thirty',   'forty',    'fifty',
               'sixty',   'seventy',   'eighty',   'ninety']
  teenagers = ['eleven',  'twelve',    'thirteen', 'fourteen', 'fifteen',
               'sixteen', 'seventeen', 'eighteen', 'nineteen']

  return 'one thousand' if number == 1000

  remaining = number
  thousands = remaining/1_000
  remaining = remaining - thousands*1_000

  if thousands > 0
    thousands = englishNumber(thousands)
    numString = numString + thousands + ' thousand'

    if remaining > 0
      numString = numString + ' '
    end
  end

  hundreds = remaining/100
  remaining = remaining - hundreds*100

  if hundreds > 0
    hundreds  = englishNumber(hundreds)
    numString = numString + hundreds + ' hundred'

    if remaining > 0
      numString = numString + ' '
    end
  end

  tens = remaining/10
  remaining  = remaining - tens*10

  if tens > 0
    if ((tens == 1) and (remaining > 0))
      # Since we can't write "tenty-two" instead of "twelve",
      # we have to make a special exception for these.
      numString = numString + teenagers[remaining-1]
      # The "-1" is because teenagers[3] is 'fourteen', not 'thirteen'.

      # Since we took care of the digit in the ones place already,
      # we have nothing left to write.
      remaining = 0
    else
      numString = numString + tensPlace[tens-1]
      # The "-1" is because tensPlace[3] is 'forty', not 'thirty'.
    end

    if remaining > 0
      # So we don't write 'sixtyfour'...
      numString = numString + '-'
    end
  end

  ones = remaining
  remaining = 0

  if ones > 0
    numString = numString + onesPlace[ones-1]
    # The "-1" is because onesPlace[3] is 'four', not 'three'.
  end

  return numString
end

require 'rspec'

RSpec.describe 'englishNumber' do
  it 'returns "zero" for 0' do
    expect(englishNumber(0)).to eq("zero")
  end
  it 'returns "nine" for 9' do
    expect(englishNumber(9)).to eq("nine")
  end
  it 'returns "ten" for 10' do
    expect(englishNumber(10)).to eq("ten")
  end
  it 'returns "eleven" for 11' do
    expect(englishNumber(11)).to eq("eleven")
  end
  it 'returns "seventeen" for 17' do
    expect(englishNumber(17)).to eq("seventeen")
  end
  it 'returns "thirty-two" for 32' do
    expect(englishNumber(32)).to eq("thirty-two")
  end
  it 'returns "eighty-eight" for 88' do
    expect(englishNumber(88)).to eq("eighty-eight")
  end
  it 'returns "ninety-nine" for 99' do
    expect(englishNumber(99)).to eq("ninety-nine")
  end
  it 'returns "one hundred" for 100' do
    expect(englishNumber(100)).to eq("one hundred")
  end
  it 'returns "one hundred one" for 101' do
    expect(englishNumber(101)).to eq("one hundred one")
  end
  it 'returns "two hundred thirty-four" for 234' do
    expect(englishNumber(234)).to eq("two hundred thirty-four")
  end
  it 'returns "one thousand" for 1,000' do
    expect(englishNumber(1_000)).to eq("one thousand")
  end
  it 'returns "one thousand" for 1,001' do
    expect(englishNumber(1_001)).to eq("one thousand one")
  end
  it 'returns "one thousand" for 1,032' do
    expect(englishNumber(1_032)).to eq("one thousand thirty-two")
  end
end

require 'rspec'

# Goal: If you pass in 4, you get 4 * 3 * 2 * 1 = 24
# Goal: If you pass in 5, you get 5 * 4 * 3 * 2 * 1 = 120
def factorial(n)
  total = n
  while n > 1
    n = n - 1
    total = total * n
  end
  return total
end

RSpec.describe 'factorial' do
  it 'returns 2 when we pass in 2' do
    expect(factorial(2)).to eq(2)
  end
  it 'returns 6 when we pass in 3' do
    expect(factorial(3)).to eq(6)
  end
  it 'returns 24 when we pass in 4' do
    expect(factorial(4)).to eq(24)
  end
  it 'returns 120 when we pass in 5' do
    expect(factorial(5)).to eq(120)
  end
  it 'returns 3,628,800 when we pass in 10' do
    expect(factorial(10)).to eq(3628800)
  end
end

require_relative '../solver'

describe Solver do
  context 'When testing the factorial method' do
    it 'Should return the factorial of the given positive Integer' do
      fact = Solver.new
      test_fact = fact.factorial(4)
      expect(test_fact).to eq 24
    end
  end

  context 'When testing the reverse method' do
    it 'Should return the reversed string' do
      rev = Solver.new
      test_rev = rev.reverse('Mario')
      expect(test_rev).to eq 'oiraM'
    end
  end
end

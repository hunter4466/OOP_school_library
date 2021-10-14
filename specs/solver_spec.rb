require_relative '../solver'

describe Solver do
  context "When testing the factorial method" do
    it "Should return an error if the argument is not a positive Integer" do
      fact = Solver.new
      test_string = fact.factorial('test')
      test_float = fact.factorial(3.14)
      test_boolean = fact.factorial(true)
      test_negative = fact.factorial(-9)
      expect(test_boolean).to eq 'Please, give a positive Integer'
      expect(test_float).to eq 'Please, give a positive Integer'
      expect(test_string).to eq 'Please, give a positive Integer'
      expect(test_negative).to eq 'Please, give a positive Integer'
    end
    it "Should return the factorial of the given positive Integer" do
      fact = Solver.new
      test_fact = fact.factorial(4)
      expect(test_fact).to eq 24
    end
  end
  context "When testing the reverse method" do
    it "Should return the reversed string" do
      rev = Solver.new
      test_rev = rev.reverse('Leonard')
      expect(test_rev).to eq 'dranoeL'
    end
  end
end
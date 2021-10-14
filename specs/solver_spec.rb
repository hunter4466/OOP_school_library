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
  context "When testing the fizzbuzz method" do
    fb = Solver.new 
    it 'Should return fizz if n is divisible by 3' do
      fb_fizz = fb.fizzbuzz(9)
      expect(fb_fizz).to eq 'fizz'
    end
    it 'Should return buzz if n is divisible by 5' do
      fb_buzz = fb.fizzbuzz(10)
      expect(fb_buzz).to eq 'buzz'
    end
    it 'Should return fizzbuzz if n is divisible by 3 and 5' do
      fb_fb = fb.fizzbuzz(30)
      expect(fb_fb).to eq 'fizzbuzz'
    end
    it 'Should return the integer n as a string if not divisible by 3 or 5' do
      fb_not = fb.fizzbuzz(8)
      expect(fb_not).to eq '8'
    end
  end
end
class Solver
  def factorial(num)
    if num.is_a? Integer
      if num.negative?
        'Please, give a positive Integer'
      else
        factorial_number = 1
        (1..num).each do |i|
          factorial_number *= i
        end
        factorial_number
      end
    elsif !(num.is_a? Integer)
      'Please, give a positive Integer'
    end
  end

  def reverse(word)
    word.reverse
  end

  def fizzbuzz(num)
    if (num % 15).zero?
      'fizzbuzz'
    elsif (num % 5).zero?
      'buzz'
    elsif (num % 3).zero?
      'fizz'
    else
      num.to_s
    end
  end
end

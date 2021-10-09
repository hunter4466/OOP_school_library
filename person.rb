require_relative 'corrector'

class Person
  def initialize(age, name = 'Unknown', parentperm: true)
    @id = rand(1000)
    @age = age
    @name = name
    @parentperm = parentperm
    @corrector = Corrector.new
    @rentals = []
  end

  attr_accessor :name, :age, :parentperm, :corrector
  attr_reader :id, :rentals

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def can_use_services?
    return true if @age >= 18 || parentperm
  end

  def add_rental(rental)
    @rentals << rental
  end

  private

  def isof_age?
    return true if @age >= 18
  end
end

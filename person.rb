require_relative 'Corrector'

class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @corrector = Corrector.new
  end

  attr_accessor :name, :age, :parent_permission, :corrector
  attr_reader :id

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def can_use_services?
    return true if @age >= 18 || parent_permission
  end

  private

  def isof_age?
    return true if @age >= 18
  end
end

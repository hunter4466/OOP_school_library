class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age, :parent_permission
  attr_reader :id

  def can_use_services?
    return true if @age >= 18 || parent_permission
  end

  private

  def isof_age?
    return true if @age >= 18
  end
end

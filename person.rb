class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  def can_use_services?
    return true if @age >= 18 || parent_permission
  end

  private

  def isof_age?
    return true if @age >= 18
  end
end

class Student < Person
  def initialize(classroom)
    super
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

class Teacher < Person
  def initialize(specialization)
    super
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

teacher = Teacher.new(18, 'Mario')
puts teacher.name

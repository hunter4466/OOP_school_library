require_relative 'Person'

class Student < Person
  def initialize(age, name, parentperm)
    super(age, name, parentperm: parentperm)
    @classroom = false
  end

  attr_reader :classroom

  def add_classroom(classroom)
    if @classroom == false
      @classroom = classroom
      classroom.add_student(self)
    else
      puts 'its already in class'
    end
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

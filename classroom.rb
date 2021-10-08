class Classroom
  def initialize(label)
    @label = label
    @students = []
  end
  attr_reader :students, :label

  def add_student(student)
    p 'being called classroom'
    if students.include? student
      puts 'its already included'
    else
      @students << student
      student.add_classroom(self)
    end
  end
end

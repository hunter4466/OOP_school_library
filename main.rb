require_relative 'Teacher'
require_relative 'Student'

teacher = Teacher.new('Algorithm professor')
teacher.name = 'Mario'

puts teacher.can_use_services?
puts teacher.name

student = Student.new('301')

puts student.age

require_relative 'Teacher'
require_relative 'Student'
require_relative 'Corrector'

teacher = Teacher.new('Algorithm professor')
teacher.name = 'mario'

puts teacher.can_use_services?
puts teacher.name
teacher.validate_name
puts teacher.name


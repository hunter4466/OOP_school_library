require_relative 'Teacher'
require_relative 'Student'
require_relative 'Corrector'
require_relative 'Classroom'

classroom = Classroom.new('Math')
mario = Student.new(18, 'Mario')
leo = Student.new(15, 'Leonardo')
sebas = Student.new(17, 'Sebas')

mario.add_classroom(classroom)
leo.add_classroom(classroom)
sebas.add_classroom(classroom)

p mario.classroom.label
p leo.classroom.label
p sebas.classroom.label

p classroom.label
classroom.students.each { |e| p e.name }

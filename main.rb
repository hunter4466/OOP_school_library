require_relative 'Teacher'
require_relative 'Student'
require_relative 'Corrector'
require_relative 'Classroom'
require_relative 'Book'
require_relative 'Rental'

# Classroom
classroom = Classroom.new('Math')
# Students
mario = Student.new(18, 'Mario')
leo = Student.new(15, 'Leonardo')
sebas = Student.new(17, 'Sebas')
# Books

book1 = Book.new('Lord of the rings', 'Mario Chois')
book2 = Book.new('Harry potter', 'Alejandra Vargas')
book3 = Book.new('Dogs city', 'Renato borra')

mario.add_classroom(classroom)
leo.add_classroom(classroom)
sebas.add_classroom(classroom)

p mario.classroom.label
p leo.classroom.label
p sebas.classroom.label

p classroom.label
classroom.students.each { |e| p e.name }

rental1 = Rental.new('05/05/2020', book1, mario)

p rental1.book.title

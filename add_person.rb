require_relative 'teacher'
require_relative 'student'

class PersonCollection
  def parent_permissionfn
    print 'Has parent permission? [Y,N]: '
    parent_perm = gets.chomp
    case parent_perm
    when 'y' || 'Y'
      true
    when 'n' || 'N'
      false
    else
      puts "Option is not available, please enter 'Y' for Yes or 'N' for No "
      parent_permissionfn
    end
  end

  def add_person(students, teachers)
    puts ' '
    puts 'Do you want to create a student (1) or a teacher (2) [Input the number]: '
    option = gets.chomp
    case option
    when '1'
      add_student(students)
    when '2'
      add_teacher(teachers)
    else
      puts 'This option is not available'
      add_person
    end
  end

  def add_student(students)
    parent_permission = true
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    parent_permission = parent_permissionfn if Integer(age) < 18
    students << Student.new(age, name, parent_permission)
    puts ' '
    puts 'Person created successfully'
  end

  def add_teacher(teachers)
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teachers << Teacher.new(age, name, specialization)
    puts ' '
    puts 'Person created successfully'
  end
end

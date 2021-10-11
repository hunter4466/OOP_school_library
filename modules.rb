require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'


def continuefunc
  puts ' '
  puts 'Press any key to continue...'
  puts ' '
  $stdin.gets
end

def add_book(array)
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  array << Book.new(title, author)
  puts ' '
  puts 'Book created successfully'
  continuefunc
  array
end

def list_books(list)
  count = 0
  if list.empty?
    puts 'No books were found...'
    return false
  end
  list.each do |e|
    puts "#{count}) Title: #{e.title}, Author: #{e.author}"
    count += 1
  end
  continuefunc
end

def parent_permissionfn
  print 'Has parent permission? [Y,N]: '
  parent_perm = gets.chomp
  case parent_perm
  when 'y' || 'Y'
    parent_perm = true
  when 'n' || 'N'
    parent_perm = false
  else
    puts "Option is not available, please enter 'Y' for Yes or 'N' for No "
    parent_permissionfn
  end
  parent_perm
end

def add_student(array)
  parent_permission = true
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  parent_permission = parent_permissionfn if Integer(age) < 18
  array << Student.new(age, name, parent_permission)
  puts ' '
  puts 'Person created successfully'
  continuefunc
  array
end

def add_teacher(array)
  print 'Age: '
  age = gets.chomp
  print 'Name: '
  name = gets.chomp
  print 'Specialization: '
  specialization = gets.chomp
  array << Teacher.new(age, name, specialization)
  puts ' '
  puts 'Person created successfully'
  continuefunc
  array
end

def add_person(studarray, teacharray)
  puts ' '
  puts 'Do you want to create a student (1) or a teacher (2) [Input the number]: '
  option = gets.chomp
  starr = studarray
  tearr = teacharray
  case option
  when '1'
    starr = add_student(studarray)
  when '2'
    tearr = add_teacher(teacharray)
  else
    puts 'This option is not available'
    add_person(studarray, teacharray)
  end
  [starr, tearr]
end

def list_people(stlist, telist)
  if stlist.empty? && telist.empty?
    puts 'No people were found...'
    return false
  end
  count = 0
  stlist.each do |e|
    puts "#{count}) [Student] Name: #{e.name}, ID: #{e.id}, Age: #{e.age}, Parent-permission: #{e.parentperm ? 'Yes' : 'No'}"
    count += 1
  end
  telist.each do |e|
    puts "#{count}) [Teacher] Name: #{e.name}, ID: #{e.id}, Age: #{e.age}"
    count += 1
  end
  continuefunc
end

def create_rental(bolist, stlist, telist, rentalsarray)
  puts ' '
  puts 'Select a book from the following list by number'
  count1 = 0
  count2 = 0
  bolist.each do |e|
    puts "#{count1}) Title: #{e.title}, Author: #{e.author}"
    count1 += 1
  end
  book = gets.chomp
  puts ' '
  puts 'Select a person fromt the following list by number'
  personsarray = []
  stlist.each do |e|
    personsarray << e
    puts "#{count2}) [Student] Name: #{e.name}, ID: #{e.id}, Age: #{e.age}, Parent-permission: #{e.parentperm ? 'Yes' : 'No'}"
    count2 += 1
  end
  telist.each do |e|
    personsarray << e
    puts "#{count2}) [Teacher] Name: #{e.name}, ID: #{e.id}, Age: #{e.age}"
    count2 += 1
  end
  person = gets.chomp
  print 'Date: '
  date = gets.chomp
  rental = Rental.new(date, bolist[Integer(book)], personsarray[Integer(person)])
  rentalsarray << rental.to_s
  puts ' '
  puts 'Rental created successfully'
  puts ' '
  continuefunc
end

def list_rentals(stlist, telist)
  personsarray = []
  stlist.each do |e|
    puts "#{e.id} Added"
    personsarray << e
  end
  telist.each do |e|
    puts "#{e.id} Added"
    personsarray << e
  end
  puts personsarray
  print 'ID of person: '
  personid = gets.chomp
  personsarray.each do |e|
    next unless Integer(e.id) == Integer(personid)

    puts 'Rentals: '
    e.rentals.each do |elem|
      puts "Date: #{elem.date}, Book: '#{elem.book.title}' by #{elem.book.author}"
    end
  end
  continuefunc
end

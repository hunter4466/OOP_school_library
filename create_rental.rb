require_relative 'rental'

class CreateRental
  def create_rental(books, students, teachers, rentals)
    puts ' '
    puts 'Select a book from the following list by number'
    count1 = 0
    count2 = 0
    books.each do |e|
      puts "#{count1}) Title: #{e.title}, Author: #{e.author}"
      count1 += 1
    end
    book = gets.chomp
    puts ' '
    puts 'Select a person fromt the following list by number'
    personsarray = []
    students.each do |e|
      personsarray << e
      puts "#{count2}) [Student] Name: #{e.name}, ID: #{e.id}, Age: #{e.age}, Parent-permission: #{e.parentperm ? 'Yes' : 'No'}"
      count2 += 1
    end
    teachers.each do |e|
      personsarray << e
      puts "#{count2}) [Teacher] Name: #{e.name}, ID: #{e.id}, Age: #{e.age}"
      count2 += 1
    end
    person = gets.chomp
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, books[Integer(book)], personsarray[Integer(person)])
    rentals << rental
    puts ' '
    puts 'Rental created successfully'
    puts ' '
  end
end

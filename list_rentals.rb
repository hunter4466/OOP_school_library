class ListRentals
  def list_rentals(students, teachers)
    personsarray = []
    students.each do |e|
      personsarray << e
    end
    teachers.each do |e|
      personsarray << e
    end
    print 'ID of person: '
    personid = gets.chomp
    personsarray.each do |e|
      next unless Integer(e.id) == Integer(personid)

      puts 'Rentals: '
      e.rentals.each do |elem|
        puts "Date: #{elem.date}, Book: '#{elem.book.title}' by #{elem.book.author}"
      end
    end
  end
end

require_relative 'add_book'
require_relative 'list_books'
require_relative 'add_person'
require_relative 'list_people'
require_relative 'create_rental'
require_relative 'list_rentals'
require 'json'

class Collection
  def load_books
    File.open('books.json', 'a')
    if File.read('books.json') != ''
      books = JSON.parse(File.read('books.json'))
      bookscollection = []
      books.each do |book|
        bookscollection << Book.new(book['title'], book['author'])
      end
      return bookscollection
    end
    []
  end

  def load_students
    File.open('students.json', 'a')
    if File.read('students.json') != ''
      students = JSON.parse(File.read('students.json'))
      studentscoll = []
      students.each do |s|
        std = Student.new(s['age'], s['name'], s['parentperm'])
        std.id = s['id']
        studentscoll << std
      end
      return studentscoll
    end
    []
  end

  def load_teachers
    File.open('teachers.json', 'a')
    if File.read('teachers.json') != ''
      teachers = JSON.parse(File.read('teachers.json'))
      teacherscoll = []
      teachers.each do |t|
        tea = Teacher.new(t['age'], t['name'], t['specialization'])
        tea.id = t['id']
        teacherscoll << tea
      end
      return teacherscoll
    end
    []
  end

  def load_rentals
    File.open('rentals.json', 'a')
    if File.read('rentals.json') != ''
      rentals = JSON.parse(File.read('rentals.json'))
      rentalscoll = []
      rentals.each do |r|
        bookbool = ''
        personbool = ''
        @books.each do |book|
          bookbool = book if r['book'] == book.title
        end
        @students.each do |person|
          personbool = person if r['pid'] == person.id
        end
        @teachers.each do |person|
          personbool = person if r['pid'] == person.id
        end
        rentalscoll << Rental.new(r['date'], bookbool, personbool)
      end
      return rentalscoll
    end
    []
  end

  def initialize
    @books = load_books
    @students = load_students
    @teachers = load_teachers
    @rentals = load_rentals
  end

  def continuefunc
    puts ' '
    puts 'Press any key to continue...'
    puts ' '
    $stdin.gets
  end

  def json_books
    booksjs = []
    @books.each do |e|
      booksjs << { 'title' => e.title, 'author' => e.author }
    end
    File.write('books.json', JSON.generate(booksjs))
  end

  def json_students
    stdjs = []
    @students.each do |e|
      stdjs << { 'age' => e.age, 'name' => e.name, 'parentperm' => e.parentperm, 'id' => e.id }
    end
    File.write('students.json', JSON.generate(stdjs))
  end

  def json_teachers
    teajs = []
    @teachers.each do |e|
      teajs << { 'age' => e.age, 'name' => e.name, 'specialization' => e.specialization, 'id' => e.id }
    end
    File.write('teachers.json', JSON.generate(teajs))
  end

  def json_rentals
    rentjs = []
    @rentals.each do |e|
      rentjs << { 'date' => e.date, 'book' => e.book.title, 'pid' => e.person.id }
    end
    File.write('rentals.json', JSON.generate(rentjs))
  end

  def run
    message = [' ', 'Welcome to School Library App!', ' ', 'Please choose an option by entering a number:',
               '1 - List all books', '2 - List all people', '3 - Create a person', '4 - Create a book',
               '5 - Create a rental', '6 - List all rentals for a given person id', '7 - Exit']
    message.each { |e| puts e }
    option = gets.chomp
    case option
    when '1'
      ListBooks.new.list_books(@books)
      continuefunc
      run
    when '2'
      ListPeople.new.list_people(@students, @teachers)
      continuefunc
      run
    when '3'
      PersonCollection.new.add_person(@students, @teachers)
      continuefunc
      run
    when '4'
      AddBook.new.add_book(@books)
      continuefunc
      run
    when '5'
      CreateRental.new.create_rental(@books, @students, @teachers, @rentals)
      continuefunc
      run
    when '6'
      ListRentals.new.list_rentals(@students, @teachers)
      continuefunc
      run
    when '7'
      json_books
      json_students
      json_teachers
      json_rentals
      puts 'Thank you for using this app'
    else
      puts 'This option is not available'
      run
    end
  end
end

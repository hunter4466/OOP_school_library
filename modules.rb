require_relative 'add_book'
require_relative 'list_books'
require_relative 'add_person'
require_relative 'list_people'
require_relative 'create_rental'
require_relative 'list_rentals'
require 'json'

class Collection
  def loadbooks
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

  def loadstudents
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

  def initialize
    @books = loadbooks
    @students = loadstudents
    @teachers = []
    @rentals = []
  end

  def continuefunc
    puts ' '
    puts 'Press any key to continue...'
    puts ' '
    $stdin.gets
  end

  def jsonbooks
    booksjs = []
    @books.each do |e|
      booksjs << { 'title' => e.title, 'author' => e.author }
    end
    File.write('books.json', JSON.generate(booksjs))
  end

  def jsonstudents
    stdjs = []
    @students.each do |e|
      stdjs << { 'age' => e.age, 'name' => e.name, 'parentperm' => e.parentperm, 'id' => e.id }
    end
    File.write('students.json', JSON.generate(stdjs))
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
      CreateRental.new.create_rental(@books, @students, @teachers, @books)
      continuefunc
      run
    when '6'
      ListRentals.new.list_rentals(@students, @teachers)
      continuefunc
      run
    when '7'
      jsonbooks
      jsonstudents
      puts 'Thank you for using this app'
    else
      puts 'This option is not available'
      run
    end
  end
end

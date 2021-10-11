require_relative 'add_book'
require_relative 'list_books'
require_relative 'add_person'
require_relative 'list_people'
require_relative 'create_rental'
require_relative 'list_rentals'

class Collection
  def initialize
    @books = []
    @students = []
    @teachers = []
    @rentals = []
  end

  def continuefunc
    puts ' '
    puts 'Press any key to continue...'
    puts ' '
    $stdin.gets
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
      puts 'Thank you for using this app'
    else
      puts 'This option is not available'
      run
    end
  end
end

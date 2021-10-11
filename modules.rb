require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'

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

    def add_book
      print 'Title: '
      title = gets.chomp
      print 'Author: '
      author = gets.chomp
      @books << Book.new(title, author)
      puts ' '
      puts 'Book created successfully'
      continuefunc
    end

    def list_books
        count = 0
        if @books.empty?
          puts 'No books were found...'
          return false
        end
        @books.each do |e|
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

      def add_person
        puts ' '
        puts 'Do you want to create a student (1) or a teacher (2) [Input the number]: '
        option = gets.chomp
        case option
        when '1'
          add_student
        when '2'
          add_teacher
        else
          puts 'This option is not available'
          add_person
        end
      end

      def add_student
        parent_permission = true
        print 'Age: '
        age = gets.chomp
        print 'Name: '
        name = gets.chomp
        parent_permission = parent_permissionfn if Integer(age) < 18
        @students << Student.new(age, name, parent_permission)
        puts ' '
        puts 'Person created successfully'
        continuefunc
      end

        def add_teacher
            print 'Age: '
            age = gets.chomp
            print 'Name: '
            name = gets.chomp
            print 'Specialization: '
            specialization = gets.chomp
            @teachers << Teacher.new(age, name, specialization)
            puts ' '
            puts 'Person created successfully'
            continuefunc
        end

        def list_people
            if @students.empty? && @teachers.empty?
              puts 'No people were found...'
              return false
            end
            count = 0
            @students.each do |e|
              puts "#{count}) [Student] Name: #{e.name}, ID: #{e.id}, Age: #{e.age}, Parent-permission: #{e.parentperm ? 'Yes' : 'No'}"
              count += 1
            end
            @teachers.each do |e|
              puts "#{count}) [Teacher] Name: #{e.name}, ID: #{e.id}, Age: #{e.age}"
              count += 1
            end
            continuefunc
          end


          def create_rental
            puts ' '
            puts 'Select a book from the following list by number'
            count1 = 0
            count2 = 0
            @books.each do |e|
              puts "#{count1}) Title: #{e.title}, Author: #{e.author}"
              count1 += 1
            end
            book = gets.chomp
            puts ' '
            puts 'Select a person fromt the following list by number'
            personsarray = []
            @students.each do |e|
              personsarray << e
              puts "#{count2}) [Student] Name: #{e.name}, ID: #{e.id}, Age: #{e.age}, Parent-permission: #{e.parentperm ? 'Yes' : 'No'}"
              count2 += 1
            end
            @teachers.each do |e|
              personsarray << e
              puts "#{count2}) [Teacher] Name: #{e.name}, ID: #{e.id}, Age: #{e.age}"
              count2 += 1
            end
            person = gets.chomp
            print 'Date: '
            date = gets.chomp
            rental = Rental.new(date, @books[Integer(book)], personsarray[Integer(person)])
            @rentals << rental.to_s
            puts ' '
            puts 'Rental created successfully'
            puts ' '
            continuefunc
          end

          def list_rentals
            personsarray = []
            @students.each do |e|
              personsarray << e
            end
            @teachers.each do |e|
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
            continuefunc
          end

          def run
            message = [' ', 'Welcome to School Library App!', ' ', 'Please choose an option by entering a number:',
                '1 - List all books', '2 - List all people', '3 - Create a person', '4 - Create a book',
                '5 - Create a rental', '6 - List all rentals for a given person id', '7 - Exit']
            message.each { |e| puts e }
            option = gets.chomp
            case option
            when '1'
            list_books
            run
            when '2'
            list_people
            run
            when '3'
            add_person
            run
            when '4'
            add_book
            run
            when '5'
            create_rental
            run
            when '6'
            list_rentals
            run
            when '7'
            puts 'Thank you for using this app'
            else
            puts 'This option is not available'
            run
            end
          end
        
end













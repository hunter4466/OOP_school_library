require_relative 'book'

class AddBook
  def add_book(books)
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    books << Book.new(title, author)
    puts ' '
    puts 'Book created successfully'
  end
end

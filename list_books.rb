class ListBooks
  def list_books(books)
    count = 0
    if books.empty?
      puts 'No books were found...'
      return false
    end
    books.each do |e|
      puts "#{count}) Title: #{e.title}, Author: #{e.author}"
      count += 1
    end
  end
end

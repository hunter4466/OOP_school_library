require 'json'

books = JSON.parse(File.read('books.json'))

puts books.class

puts books[0]

puts books[0]['title']
puts books[0]['author']

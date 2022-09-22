require 'json'
class CreateBook
  def initialize(book)
    @books = book
  end

  def create_book
    print "Create book \n"
    print ' Enter book publisher: '
    publisher = gets.chomp
    print ' Enter cover statement: '
    cover_stat = gets.chomp
    new_book = Book.new(publisher, cover_stat)
    book_obj = { Publisher: new_book.publisher, CoverStatement: new_book.cover_stat }
    @books << book_obj

    File.open('book.json', 'w+') do |file|
      books = JSON.dump(@books)
      file.write(books)
    end

    puts " '#{new_book.publisher}' added successfully"
  end
end
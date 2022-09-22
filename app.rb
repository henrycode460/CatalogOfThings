require './classes/item'
require './classes/genre'
require './classes/musicalbum'
require_relative './classes/book'
require_relative './classes/label'
# require_relative './classes/create_book.rb'
require_relative 'storage'

class App
  include Storage

  def initialize
    @genre = []
    @musicalbums = []
    @books = []
    @labels = []
  end

  def list_all_music_album
    if @musicalbums.empty?
      puts 'There is no music Album'
    else
      @musicalbums.each do |musicalbum|
        puts "Name: '#{musicalbum.name}', Publish_date: #{musicalbum.publish_date}, on_spotify: #{musicalbum.on_spotify}"
      end
    end
  end

  def list_all_genre
    if @genre.empty?
      puts 'There is no genre'
    else
      @genre.each { |genres| puts "Name: #{genres.name}" }
    end
  end

  def add_a_music_album
    print 'name:'
    name = gets.chomp.to_s
    print 'publish_date: '
    publish_date = gets.chomp
    print 'Is the music Album on_spotify [Y/N]: '
    spotify = gets.chomp.capitalize
    on_spotify = true if spotify == 'Y'
    on_spotify = false if spotify == 'N'
    @genre.push(Genre.new(name))
    @musicalbums.push(MusicAlbum.new(name, publish_date, on_spotify))
  end

  # create books

  def create_book
    print "Create book \n"
    print ' Enter book publisher: '
    publisher = gets.chomp
    print ' Enter cover statement: '
    cover_state = gets.chomp
    print ' Enter publish date: '
    publish_date = gets.chomp
    new_book = Book.new(publisher, cover_state, publish_date)
    book_obj = { Publisher: new_book.publisher, CoverStatement: new_book.cover_state, Date: new_book.publish_date }
    @books << book_obj

    File.open('./json-files/book.json', 'w+') do |file|
      books = JSON.dump(@books)
      file.write(books)
    end

    puts " '#{new_book.publish_date}' added successfully"
  end

  # list books
  def list_books
    File.open('./json-files/book.json', 'r') do |file|
      books = JSON.parse(file.read)
      books.each do |book|
        puts "Publisher: #{book['Publisher']}, CoverStatement: #{book['CoverStatement']}, Date: #{book['Date']} "
      end
    end
  end

  # create Label
  def create_label
    print "Create Label \n"
    print ' Enter Label Title: '
    title = gets.chomp
    print ' Enter Label Color: '
    color = gets.chomp
    new_label = Label.new(title, color)
    label_obj = { Title: new_label.title, Color: new_label.color }
    @labels << label_obj

    File.open('./json-files/label.json', 'w+') do |file|
      labels = JSON.dump(@labels)
      file.write(labels)
    end

    puts " '#{new_label.title}' added successfully"
  end

  # list all label
  def list_label
    File.open('./json-files/label.json', 'r') do |file|
      labels = JSON.parse(file.read)
      labels.each { |label| puts "Title: #{label['Title']}, Color: #{label['Color']} " }
    end
  end

  # saves data at the exit of the app
  def quit
    save_state
    save_genre
  end

  # loads the saved data on the start of the app
  def on_start
    read_music_album
    read_genre
    read_books
    read_label
  end
end

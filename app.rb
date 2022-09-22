require './classes/item'
require './classes/genre'
require './classes/musicalbum'
require_relative './classes/book'
require_relative './classes/label'
# require_relative './classes/create_book.rb'
require_relative 'storage'
require './classes/game'
require './classes/author'
require_relative 'store_game'
require_relative 'store_author'

class App
  include Storage
  include GamesPreserve
  include AuthorsPreserve

  def initialize
    @genre = []
    @musicalbums = []
    @games = []
    @authors = []
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
  
  # Add_game
  def add_game
    print 'Publish date [YYYY-MM-DD] : '
    publish_date = gets.chomp

    print 'Is multiplayer game? [ yes, no ]: '
    multiplayer = gets.chomp

    case multiplayer
    when 'yes'
      multiplayer = 'yes'
    when 'no'
      multiplayer = 'no'
    else
      puts 'yes or no'
      multiplayer = gets.chomp
    end

    print 'is Archived [Y/N]: '
    archived = gets.chomp.downcase

    case archived
    when 'y'
      archived = true

    when 'n'
      archived = false
    else
      puts('please enter [Y/N]: ')
    end

    print 'Last played at[YYYY-MM-DD]: '
    last_played_at = gets.chomp

    print 'Author First Name: '
    first_name = gets.chomp

    print 'Author Last Name: '
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors.push(author)
    game = Game.new(publish_date, multiplayer, last_played_at, archived, first_name)
    @games.push(game)

    author.add_item(game)
    game.add_author(author)

    puts 'New Game added successfully'
  end

  # List game and author

  def list_authors
    if @authors.empty?
      puts 'No author in the catalog'
      return
    end
    puts "\n"

    @authors.each_with_index do |author, i|
      puts "#{i + 1}) #{author.first_name} #{author.last_name}"
      puts
    end
  end

  def list_games
    if @games.empty?
      puts 'No game in the catalog'
      return
    end
    puts "\n"

    @games.each do |game|
      print "Author: #{game.first_name},
             publish date: #{game.publish_date},
             multiplayer: #{game.multiplayer},
             last_played_at: #{game.last_played_at}"
      puts
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
    store_games
    store_authors
  end

  # loads the saved data on the start of the app
  def on_start
    read_music_album
    read_genre
    read_books
    read_label
  end
end

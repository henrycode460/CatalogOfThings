require './app'
class MakeChoice
  def initialize
    @app = App.new
    @app.on_start
  end

  def on_exit
    puts 'Thanks for visiting Catalog of my things!'
    @app.quit
    exit!
  end

  def display_list
    puts 'Welcome to Catalog of my things!'
    puts "
          Choose an option by entering a number:
          1 - List all books
          2 - List all labels
          3 - List all MusicAlbum
          4 - List all Genre
          5 - List of games
          6 - List all authors
          7 - List all movies
          8 - List all sources
          9 - Add a game
          10 - Add a book
          11 - Add a music album
          12 - Add a movie
          13 - Exit"
  end
  # rubocop:disable Metrics/CyclomaticComplexity

  def choices(option)
    case option
    when 1
      @app.list_books
    when 2
      @app.list_label
    when 3
      @app.list_all_music_album
    when 4
      @app.list_all_genre
    when 5
      @app.list_games
    when 6
      @app.list_authors
    when 7
      @app.list_all_movies
    when 8
      @app.list_all_sources
    when 9
      @app.add_game
    when 10
      @app.create_book
    when 11
      @app.add_a_music_album
    when 12
      @app.add_a_movie
    else
      display_list
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end

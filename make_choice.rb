require './app'
class MakeChoice
  def initialize
    @app = App.new
  end

  def on_exit
    puts 'Thanks for visiting Catalog of my things!'
    @app.quit
    exit!
  end

  def display_list
    @app.on_start
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
      @app.create_label
    when 3
      @app.list_all_music_album
    when 4
      @app.list_all_genre
    when 5
      @app.List_of_games
    when 6
      @app.List_all_authors
    when 7
      @app.List_all_movies
    when 8
      @app.list_label
    when 9
      @app.List_all_sources
    when 10
      @app.Add_a_game
    when 11
      @app.create_book
    when 12
      @app.add_a_music_album
    else
      @app.Add_a_movie
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end

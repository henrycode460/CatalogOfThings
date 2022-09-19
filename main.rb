require './item'

class Main
    def initialize
        @item = Item.new
      end
    
      def on_exit
        puts 'Thanks for visiting Catalog of my things!'
        exit!
      end
    
      def display_list
        loop do
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
            option = gets.chomp.to_i
            case option
            when 1..12
              choices(option)
            else
              break
            end
          end
          on_exit
      end
def choices(option)
        case option
        when 1
          @item.List_all_books
        when 2
          @item.List_all_label
        when 3
          @item.List_all_MusicAlbum
        when 4
          @item.List_all_Genre
        when 5
          @item.List_of_games
        when 6
          @item.List_all_authors
        when 7
          @item.List_all_movies
        when 8
          @item.List_all_sources
        when 9
          @item.Add_a_game
        when 10
          @item.Add_a_book
        when 11
          @item.Add_a_music_album
        else
          @item.Add_a_movie
        end
      end

end
Main

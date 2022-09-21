require_relative 'item'
require_relative 'genre'
require_relative 'musicalbum'
require_relative 'storage'

class App
    include Storage

    def initialize
        @genre = []
        @musicalbums = []
    end
    def List_all_MusicAlbum
        if @musicalbums.empty?
            puts 'There is no music Album'
        else
            @musicalbums.each { |musicalbum| puts "Name: '#{musicalbum.name}', Publish_date: #{musicalbum.publish_date}, on_spotify: #{musicalbum.on_spotify}"}
        end
    end
    def List_all_Genre
        if @genre.empty?
            puts 'There is no genre'
        else
            @genre.each { |genres| puts "Name: #{genres.name}"}
        end
    end
    def Add_a_music_album
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

    #saves data at the exit of the app
    def quit
      save_state
      save_genre
    end
    #loads the saved data on the start of the app
    def on_start
      read_music_album
      read_genre
    end
end 
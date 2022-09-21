require 'json'

module Storage
  def load_music_album_to_file
    items = MusicAlbum.new(name, publish_date, on_spotify)
    items.each do |item|
      @musicalbums << item
    end
  end

  def load_genre_to_file
    items = Genre.new(name)
    items.each do |item|
      @genre << item
    end
  end

  # saving to the json files
  def save_state
    items = @musicalbums.map do |music|
      { name: music.name, publish_date: music.publish_date, on_spotify: music.on_spotify }
    end
    File.write('./json-files/music_album.json', items.to_json)
  end

  def save_genre
    items = @genre.map do |genres|
      { name: genres.name }
    end
    File.write('./json-files/genre.json', items.to_json)
  end

  # Reading work from the json files
  def read_music_album
    file = File.read('./json-files/music_album.json')
    read_music = JSON.parse(file)
    puts read_music

    read_music.each do |music|
      @musicalbums << MusicAlbum.new(music['name'], music['publish_date'], music['on_spotify'])
    end
  rescue StandardError
    print 'no music Album was saved'
  end

  def read_genre
    file = File.read('./json-files/genre.json')
    read_each_genre = JSON.parse(file)
    puts read_each_genre

    read_each_genre.each do |genre|
      @genre << Genre.new(genre['name'])
    end
  rescue StandardError
    print 'no genre was saved'
  end
end

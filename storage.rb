require 'json'

module Storage
  def save_state
    puts @musicalbums
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

    read_music.each do |music|
      @musicalbums << MusicAlbum.new(music['name'], music['publish_date'], music['on_spotify'])
    end
  rescue StandardError
    print 'no music Album was saved'
  end

  def read_genre
    file = File.read('./json-files/genre.json')
    read_each_genre = JSON.parse(file)

    read_each_genre.each do |genre|
      @genre << Genre.new(genre['name'])
    end
  rescue StandardError
    print 'no genre was saved'
  end

  # read books
  def read_books
    File.open('./json-files/book.json', 'r') do |file|
      books = JSON.parse(file.read)
      @books = []
      books.each { |book| @books << book }
    end
  end

  # read label
  def read_label
    File.open('./json-files/label.json', 'r') do |file|
      labels = JSON.parse(file.read)
      @labels = []
      labels.each { |label| @labels << label }
    end
  end
end

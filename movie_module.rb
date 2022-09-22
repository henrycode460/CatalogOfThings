module MovieModule
  def add_a_movie
    name, date, source, silet = movie_info
    movie = Movie.new(name, date, silet)
    sourc = Source.new(source)
    sourc.add_item(movie)
    save_movies(movie, sourc)
  end

  def list_all_movies
    @movies.each do |movie|
      puts "Name: #{movie.name} Source: #{movie.source} Release date: #{movie.publish_date}"
    end
  end

  def list_all_sources
    @sources.each do |source|
      puts "Name: #{source.name} ID: #{source.id}"
    end
  end

  private

  def movie_info
    print 'What is the name of the movie: '
    name = gets.chomp

    print 'When is the movie released? (yyyy-mm-dd): '
    date = gets.chomp

    print 'What is the source of the movie? '
    source = gets.chomp

    print 'Is the movie silet? y/n: '
    s = gets.chomp
    silet = s == 'y'

    [name, date, source, silet]
  end

  def create_json(string)
    File.write("./json-files/#{string}.json", []) unless File.exist?("./json-files/#{string}.json")
    File.open("./json-files/#{string}.json", 'r')
  end

  def save_movies(movie, sourc)
    @movies.push(movie)
    @sources.push(sourc)
    File.open('./json-files/movies.json', 'w+') do |file|
      movies = JSON.dump(@movies)
      file.write(movies)
    end
    File.open('./json-files/sources.json', 'w+') do |file|
      sources = JSON.dump(@sources)
      file.write(sources)
    end
  end

  def load_movies_sources
    @movies = JSON.parse(create_json('movies').read, create_additions: true)
    @sources = JSON.parse(create_json('sources').read, create_additions: true)
  end
end

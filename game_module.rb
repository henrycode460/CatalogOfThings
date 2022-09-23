module GameModule
  def add_game
    print 'Publish date [YYYY-MM-DD] : '
    publish_date = gets.chomp

    print 'Is multiplayer game? [ yes, no ]: '
    multi = gets.chomp
    multiplayer = multi == 'yes'

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

  def list_authors
    if @authors.empty?
      puts 'No author in the catalog'
      return
    end
    puts "\n"

    @authors.each_with_index do |author, i|
      puts "#{i + 1}) #{author.first_name} #{author.last_name}"
    end
  end

  def list_games
    if @games.empty?
      puts 'No game in the catalog'
      return
    end
    puts "\n"

    @games.each do |game|
      puts "
             Author: #{game.first_name},
             publish date: #{game.publish_date},
             multiplayer: #{game.multiplayer},
             last_played_at: #{game.last_played_at}"
    end
  end
end

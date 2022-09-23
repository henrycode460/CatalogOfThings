require 'json'

module GamesPreserve
  def store_games
    gamestore = []
    File.write('./json-files/game.json', []) unless File.exist?('./json-files/game.json')
    @games.each do |game|
      gamestore << {
        publish_date: game.publish_date,
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at,
        archived: game.archived,
        first_name: game.first_name
      }
    end
    File.write('./json-files/game.json', gamestore.to_json)
  end

  def load_games
    gamestore = []
    File.write('./json-files/game.json', []) unless File.exist?('./json-files/game.json')
    game_file = File.open('./json-files/game.json')
    if File.exist?(game_file) && File.read(game_file) != ''
      data = JSON.parse(game_file.read)
      data.each do |game|
        gamestore << Game.new(game['pubish_date'],
                              game['multiplayer'],
                              game['last_played_at'],
                              game['published_date'],
                              game['first_name'])
      end
    else
      File.write(game_file, [])
    end
    gamestore
  end
end

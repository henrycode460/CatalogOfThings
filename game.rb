require './item'
class Game < Item
  attr_accessor :multi_player, :last_played_at, :publish_date

  def initialize(multi_player, last_played_at, _publish_date)
    super(publish_date)
    @multi_player = multi_player
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (Date.today.year - last_played_at.year) > 2
  end

  private :can_be_archived?
end

require_relative './item'
require_relative './date'
class Games < Item

  attr_accessor :multi_player, :last_played_at, :publish_date
  def initialize(multi_player, last_played_at, publish_date)
    @multi_player = multi_player
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (Date.today.year - last_played_at.year) > 2

  end

  private :can_be_archived?

end
require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :pulish_date, :archived, :first_name

  def initialize(publish_date, multiplayer, last_played_at, archived, first_name)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = Date.strptime(last_played_at, '%Y-%m-%d')
    @first_name = first_name
    @archived = archived
  end

  def can_be_archived?
    super && (Date.today.year - @last_played_at.year) > 2
  end
end


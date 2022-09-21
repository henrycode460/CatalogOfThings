require './item'

class Movie < Item
  attr_accessor :silet

  def initialize(id, silet)
    super(id)
    @silet = silet
  end

  def can_be_archived?
    (Date.now - Date.parse(@publish_date)) / 365 > 10 || silet
  end
end

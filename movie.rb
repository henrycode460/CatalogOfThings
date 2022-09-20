require './item'

class Movie < Item
  attr_accessor :silet
  
  def initialize(silet)
    super()
    @silet = silet
  end

  def can_be_archived?
    (Date.now - Date.parse(@publish_date)) / 365 > 10 || silet
  end
end

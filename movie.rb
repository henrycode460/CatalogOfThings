require './item'

class Movie < Item
  attr_accessor :silet
  def initialize(silet)
    super()
    @silet = silet
  end
end

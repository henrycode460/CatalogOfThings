require_relative 'item'
class Genre < Item
  attr_accessor :name, :items, :id

  def initialize(name)
    super(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end

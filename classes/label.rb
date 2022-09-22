require_relative 'item'
class Label < Item
  attr_accessor :title, :color, :items, :id

  def initialize(title, color)
    super(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end

# label1 = Label.new("Dragon Teaser", "Brown")
# puts label1.title

# item1 = Item.new("2002-05-05")
#  item2 = Item.new("2002-06-05")

# label1.add_item(item1)
# label1.add_item(item2)

# puts label1.items.length

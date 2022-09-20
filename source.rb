class Source
  attr_accessor :name

  def initialize(name = 'Unknown')
    @id = Random.rand(1, 1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.source = self
  end
end
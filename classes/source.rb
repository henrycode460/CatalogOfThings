class Source
  attr_reader :id
  attr_accessor :name, :items

  def initialize(name = 'Unknown')
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.source = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'arguments' => [@name]
    }.to_json(*args)
  end

  # Deserialize JSON string by constructing new Foo object with arguments.
  def self.json_create(object)
    new(*object['arguments'])
  end
end

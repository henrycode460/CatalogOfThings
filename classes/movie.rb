require_relative 'item'
require 'date'

class Movie < Item
  attr_accessor :silet, :name

  def initialize(name, date, silet)
    super(date)
    @name = name
    @silet = silet
  end

  def can_be_archived?
    (Date.today - Date.parse(@publish_date)) > 3650 || silet
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'arguments' => [@name, @publish_date, @silet]
    }.to_json(*args)
  end

  # Deserialize JSON string by constructing new Foo object with arguments.
  def self.json_create(object)
    new(*object['arguments'])
  end
end

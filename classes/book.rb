require_relative 'item'
class Book < Item
  attr_accessor :publisher, :cover_state, :date, :id

  def initialize(publisher, cover_state, date)
    super(date)
    @id = Random.rand(1..1000)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    (Date.today - Date.parse(@publish_date)) / 365 > 10 || cover_state == 'bad'
  end
end

book1 = Book.new('Joseph Thomas', 'bad', '2002-05-05')
puts book1.publish_date
puts book1.can_be_archived?

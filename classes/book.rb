require_relative 'item'
class Book < Item
  attr_accessor :publisher,  :cover_stat, :id

  def initialize(publisher, cover_stat)
    @id = Random.rand(1..1000)
    @publisher = publisher
    @cover_stat  = cover_stat
    
  end

  def can_be_archived?
    (Date.now - Date.parse(@publish_date)) / 365 > 10 || cover_stat == 'bad'
  end

 
end

# book1 = Book.new("Joseph Thomas", "bad")
# puts book1.publisher

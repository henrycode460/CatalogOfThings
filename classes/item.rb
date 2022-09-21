require 'date'
class Item
  attr_reader :genre, :source, :label
  attr_accessor :publish_date, :archived

  def initialize(_id, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = date
    @archived = archived
  end

  def can_be_archived?
    Date.now - Date.parse(@publish_date) > 3650
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.includes?(self)
  end
  private :can_be_archived?
end

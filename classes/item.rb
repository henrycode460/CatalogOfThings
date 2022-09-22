require 'date'
class Item
  attr_accessor :publish_date, :archived, :genre, :source, :label

  def initialize(date, archived: false)
    @id = Random.rand(1..1000)
    @genre = nil
    @source = nil
    @label = nil
    @author = nil
    @publish_date = date
    @archived = archived
  end

  def can_be_archived?
    Date.now - Date.parse(@publish_date) > 3650
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_genres(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def add_source(source)
    @source = source
    source.item.push(self) unless source.item.include?(self)
  end

  def add_author(author)
    @author = author
    author.item.push(self) unless author.item.include?(self)
  end
  private :can_be_archived?
end

require 'date'
class Item
  def initialize(id, genre, source, label, publish_date, archived)
    @id = id
    @genre = genre
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    Date.now - Date.parse(@publish_date) > 3650
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
  private :can_be_archived?
end

require './item'
class  MusicAlbum < Item
    attr_accessor :name, :publish_date, :on_spotify, :archived
    def initialize(name, date, on_spotify)
        super(date)
        @name = name
        @on_spotify= on_spotify
    end
    def can_be_archived?
        super && @on_spotify
    end
end
require_relative 'spec_helper'

describe Genre do
  context 'it should create a genre and add items to it' do
    genre_a = Genre.new('Girlfriend')
    it 'it should return an instance of genre ' do
      expect(genre_a.name).to eq 'Girlfriend'
    end

    it 'should add the an item to the set of items' do
      item = Item.new('2000-03-08')
      genre_a.add_item(item)
      expect(genre_a.items.length).to eq 1
    end
  end
end

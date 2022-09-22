require_relative 'spec_helper'

describe Label do
  context 'it should create a genre and add items to it' do
    label1 = Label.new('Dragon Teaser', 'Brown')
    it 'it should return an instance of label ' do
      expect(label1.title).to eq 'Dragon Teaser'
    end

    it 'should add the an item to the set of items' do
      item1 = Item.new('1999-05-05')
      item2 = Item.new('2002-06-05')
      label1.add_item(item1)
      label1.add_item(item2)
      expect(label1.items.length).to eq 2
    end
  end
end

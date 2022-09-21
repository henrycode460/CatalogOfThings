require_relative 'spec_helper'

describe Genre do 
    context 'it should create a genre and add items to it' do
        genreA = Genre.new('Girlfriend')
        it 'it should return an instance of genre ' do
            expect(genreA.name).to eq 'Girlfriend'
        end

        it 'should add the an item to the set of items' do
            item = Item.new('2000-03-08')
            genreA.add_item(item)
            expect(genreA.items.length).to eq 1
        end
    end
end
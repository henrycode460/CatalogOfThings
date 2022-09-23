require './classes/author'
require './classes/game'
require './classes/item'

describe Author do
  before :each do
    @poet = Author.new('Wole', 'Soyinka')
  end

  context 'Test for author class' do
    it 'should be instance of author' do
      expect(@poet).to be_an_instance_of Author
    end

    it 'should return first-name' do
      expect(@poet.first_name).to eq('Wole')
    end

    it 'should return last-name' do
      expect(@poet.last_name).to eq('Soyinka')
    end
  end
end

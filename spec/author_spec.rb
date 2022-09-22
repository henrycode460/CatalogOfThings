require './classes/author'
require './classes/game'
require'./classes/item'

describe Author do
  before :each do
    @Poet = Author.new('Wole', 'Soyinka')
  end

  context 'Test for author class' do
    it 'should be instance of author' do
      expect(@Poet).to be_an_instance_of Author
    end

    it 'should return first-name' do
      expect(@Poet.first_name).to eq('Wole')
    end

    it 'should return last-name' do
      expect(@Poet.last_name).to eq('Soyinka')
    end
  end
end
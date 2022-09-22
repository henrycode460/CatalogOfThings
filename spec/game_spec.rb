require './classes/game'
require './classes/item'

describe Game do
  before :each do
    @temple_run = Game.new('2010-01-15', 'yes', '2018-02-09', true, 'Gbenga')
    @psp = Game.new('2021-12-08', 'yes', '2022-09-21', false, 'Thomas')
  end

  context 'Test for Game class' do
    it 'should be an instance of game class' do
      expect(@temple_run).to be_an_instance_of Game
    end

    it 'can_be_archived? return true' do
      expect(@temple_run.can_be_archived?).to eq(true)
    end

    it 'can_be_archived? return false' do
      expect(@psp.can_be_archived?).to eq(false)
    end
  end
end

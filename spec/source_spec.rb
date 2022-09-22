require_relative 'spec_helper'

describe Source do
  before :each do
    @source = Source.new
  end

  it 'Should create an instance of source class' do
    expect(@source).to be_an_instance_of Source
  end

  describe 'Check add_item method' do
    item = Item.new('2007-01-21')
    it 'Should add item to source items' do
      @source.add_item(item)
      expect(@source.items).to include(item)
    end
  end
end

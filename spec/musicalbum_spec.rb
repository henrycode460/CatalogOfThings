require_relative 'spec_helper'

describe MusicAlbum do 
    before :each do
        @musicalbum = MusicAlbum.new('name', 'publish_date', 'on_spotify')
    end
    context 'creating a new music album' do
        it 'should create an instance of the music album' do
          expect(@musicalbum).to be_an_instance_of MusicAlbum
        end
    end
end
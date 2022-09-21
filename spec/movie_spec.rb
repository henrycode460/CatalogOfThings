require '../movie'

describe Movie do
  before :each do
    silet = true
    id = 200
    @movie = Movie.new(id, silet)
  end

  it 'Should create a Movie instance' do
    expect(@movie).to be_an_instance_of Movie
  end

  describe 'can_be_archvied?' do
    it 'Should return be true' do
      expect(@movie.can_be_archived?).to be_truthy
    end
  end
end

require_relative 'spec_helper'

describe Book do
  context 'it should create a book ' do
    book1 = Book.new('Joseph Thomas', 'bad', '2002-05-05')
    it 'it should return an instance of label ' do
      expect(book1.publisher).to eq 'Joseph Thomas'
    end

    it 'should return true if publish date is older then ten years or cover_state is equal to bad ' do
      expect(book1.can_be_archived?).to eq true
    end
  end
end

require './book'

describe Book do
  context 'create a book' do
    book = Book.new 'Social Media Marketing', 'Ayo Moses'

    it 'show the title' do
      expect(book.title).to eq 'Social Media Marketing'
    end

    it 'show the author' do
      expect(book.author).to eq 'Ayo Moses'
    end
  end
end

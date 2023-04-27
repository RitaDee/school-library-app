require_relative '../book'
require_relative '../person'
require_relative '../student'
require_relative '../teacher'
require_relative '../classroom'
require_relative '../rental'

describe Rental do
  before :each do
    @book = Book.new 'Title', 'Author'
    @person = Teacher.new 26, 'Specialization', 'Name'
    @rental = Rental.new 'Date', @book, @person
  end

  describe '#new' do
    it 'takes three parameters and returns a rental object' do
      expect(@rental).to be_an_instance_of Rental
    end
  end

  describe '#date' do
    it 'returns the correct date' do
      expect(@rental.date).to eql 'Date'
    end
  end

  describe '#book' do
    it 'returns the correct book' do
      expect(@rental.book.title).to eql 'Title'
      expect(@rental.book.author).to eql 'Author'
    end
  end

  describe 'test if they correctly push in a new instance of the Rental object' do
    it 'Should return only one rental when adding a rental to a teacher and a book' do
      sample_book = Book.new 'DS', 'Lorem ipsum'
      sample_person = Teacher.new 26, 'JS', 'Jonh Doe'
      sample_rental = Rental.new '2023-04-26', sample_book, sample_person
      expect(sample_person.rentals.length).to eq 1
      expect(sample_book.rentals.length).to eq 1
      expect(sample_person.rentals).to eql [sample_rental]
    end

    it 'check if rental book is pushed into rentals correnctly' do
      sample_book = Book.new 'DS', 'Lorem ipsum'
      sample_person = Teacher.new 26, 'JS', 'Jonh Doe'
      sample_rental = Rental.new '2023-04-26', sample_book, sample_person
      expect(sample_person.rentals).to eql [sample_rental]
    end
  end
end

require './book'
require './person'

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    @book.rentals.push(self)
    @person.rentals.push(self)
  end
end

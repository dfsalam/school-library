require './person.rb'
require './book.rb'

class Rental
  attr_reader :person, :book

  def initialize(person, book)
    @person = person
    @book = book
    person.add_rental(self) 
    book.add_rental(self) 
  end
end
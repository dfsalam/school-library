# frozen_string_literal: true

require './person'
require './book'

# Class that represents a rental
class Rental
  attr_reader :person, :book

  def initialize(person, book)
    @person = person
    @book = book
    person.add_rental(self)
    book.add_rental(self)
  end
end

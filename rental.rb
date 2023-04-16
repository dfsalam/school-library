# frozen_string_literal: true

require './person'
require './book'

# Class that represents a rental
class Rental
  attr_reader :person, :book, :date

  def initialize(person, book, date)
    @person = person
    @book = book
    @date = date
    person.add_rental(self)
    book.add_rental(self)
  end
end

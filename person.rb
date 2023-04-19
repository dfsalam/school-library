# frozen_string_literal: true

require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
# Class that represents a person
class Person < Nameable
  attr_accessor :name, :age, :parent_permission, :id
  attr_reader :rentals

  def initialize(age, name, parent_permission: true)
    super()
    @id = rand_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end

  def rand_id
    letters = ('A'..'Z').to_a
    letters.sample.concat(Random.rand(1..1000).to_s, letters.sample)
  end
end

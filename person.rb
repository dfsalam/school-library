# frozen_string_literal: true

require './nameable'
require './capitalize_decorator'
# Class that represents a person
class Person < Nameable
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = rand_id
    @name = name
    @age = age
    @parent_permission = parent_permission
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
    letters.sample.concat(Random.rand(1..1000), letters.sample)
  end
end

person = Person.new(22, 'maximilianus')
person.correct_name
capitalizedPerson = CapitalizeDecorator.new(person)
capitalizedPerson.correct_name

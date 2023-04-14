# frozen_string_literal: true

require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
# Class that represents a person
class Person < Nameable
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
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
puts(person.correct_name)
capitalized_person = CapitalizeDecorator.new(person)
puts(capitalized_person.correct_name)
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts(capitalized_trimmed_person.correct_name)

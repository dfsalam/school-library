# frozen_string_literal: true

require './person'

# Class that represents a teacher
class Teacher < Person
  def initialize(age, specialization, name)
    super(age, name, true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

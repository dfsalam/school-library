# frozen_string_literal: true

require './person'
# frozen_string_literal: true

# Class that represents a student
class Student < Person
  attr_reader :classroom

  def initialize(age, name, parent_permission)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom&.students&.delete(self)

    @classroom = classroom
    classroom&.add_student(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end


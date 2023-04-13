# frozen_string_literal: true

require './person'
# frozen_string_literal: true

# Class that represents a student
class Student < Person
  def initialize(age, classroom, name)
    super(age, name, true)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

student1 = Student.new(23, 'Static')
puts(student1.play_hooky)
puts(student1.age)

# frozen_string_literal: true

require './person'
# frozen_string_literal: true

# Class that represents a student
class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name)
    super(age, name, true)
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

student1 = Student.new(23, 'Static')
puts(student1.play_hooky)
puts(student1.age)

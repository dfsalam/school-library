# frozen_string_literal: true

require './person'
# frozen_string_literal: true

# Class that represents a student
class Student < Person
  attr_accessor :classroom
  def initialize(age, classroom, name)
    super(age, name, true)
    @classroom = classroom
  end

  def classroom = (classroom)
    if @classroom
      @classroom.students.delete(self) 
    end

    @classroom = classroom
    classroom.add_student(self) if classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

student1 = Student.new(23, 'Static')
puts(student1.play_hooky)
puts(student1.age)

# frozen_string_literal: true

require './student'
# frozen_string_literal: true

# Class that represents classroom
class Classroom
  attr_accessor :label

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    student.classroom = self
    @students.push(student)
  end
end

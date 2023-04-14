# frozen_string_literal: true

require './nameable'

# Base decorator
class Base < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

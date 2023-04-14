# frozen_string_literal: true

require './base_decorator'

# Decorator to trim name
class TrimmerDecorator < Base
  def initialize(nameable)
    super(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name[0..9]
  end
end

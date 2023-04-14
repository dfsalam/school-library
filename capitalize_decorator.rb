# frozen_string_literal: true

require './base_decorator'

# Decorator to capitalize name
class CapitalizeDecorator < Base
  def initialize(nameable)
    super(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name.capitalize
  end
end

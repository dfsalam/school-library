# frozen_string_literal: true

# Class nameable
class Nameable
  def correct_name
    raise NotImplementedError, 'Subclasses must implement the correct_name method.'
  end
end

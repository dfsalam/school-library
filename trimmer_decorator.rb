require './base_decorator.rb'

#Decorator to trim name
class TrimmerDecorator < Base
  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name[0..9]
    
  end 

end
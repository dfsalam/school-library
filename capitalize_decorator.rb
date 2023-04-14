require './base_decorator.rb'

#Decorator to capitalize name
class CapitalizeDecorator < Base
  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    out=@nameable.correct_name.capitalize
    out
  end 

end

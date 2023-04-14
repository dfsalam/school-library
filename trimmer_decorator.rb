require './base_decorator.rb'

#Decorator to trim name
class TrimmerDecorator < Base
  def initialize
    super(nameable)
    @nameable = nameable
  end

  def correct_name
    out=@nameable.slice(0,10)
    out
  end 

end
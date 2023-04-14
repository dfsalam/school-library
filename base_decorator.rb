require './nameable.rb'

#Base decorator
class Decorator < Nameable
  def initialize()
    @nameable = Nameable.new
  end
  def correct_name
    @nameable.correct_name
  end
end
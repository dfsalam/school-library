# Class nameable 
class Nameable
  def correct_name
    raise NotImplementedError, "Subclasses must implement the 'sound' method."
  end
end

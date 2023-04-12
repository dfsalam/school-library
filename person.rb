class Person
  attr_accessor :name, :age
  def initialize(age, name = "Unknown",  parent_permission = true)
    @id = rand_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end

  def rand_id
    letters=('A'..'Z').to_a
    output = letters.sample.concat(Random.rand(1..1000), letters.sample)
    output
  end
  
end

person = Person.new(23, 'Richard', false)
puts(person.name)
puts(person.age)
person.age = 55
person.name = 'Paul'
puts(person.name)
puts(person.age)
puts (person.can_use_services?)
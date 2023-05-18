# Create a person object
class Person

  attr_accessor :id, :name, :age

  def initialize(age, name="Unknow", parent_permission=true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def id
    @id
  end

  def name
    @name
  end

  def age
    @age
  end

  def name=(value)
    @name = value
  end

  def age=(value)
    @age = value
  end

  private
  def of_age?
    return true if @age >= 18

    false
  end

  def can_use_services?
    return true if of_age? || @parent_permission
    
    false
  end
end
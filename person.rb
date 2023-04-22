require './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(id, age, name = 'Unknown', parent_permission = nil)
    super()
    @id = id
    @age = age
    @name = name
    @parent_permission = if parent_permission.nil?
                           true
                         else
                           parent_permission
                         end
  end

  def correct_name
    name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end

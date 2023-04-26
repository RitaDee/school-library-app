require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(name, age, specialization, parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @specialization = specialization
  end

  attr_writer :id

  def can_use_services?
    true
  end
end

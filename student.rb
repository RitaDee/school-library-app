require './person'

class Student < Person
  attr_accessor :rentals, :classroom

  def initialize(id, name, age, parent_permission)
    super(id, name, age, parent_permission)
    unless classroom.nil?
      @classroom = classroom
      @classroom.students << self
    end
    @rentals = []
    notify
  end

  def notify
    puts "Student #{@name} enrolled"
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

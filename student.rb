require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(_classroom, age, name: 'Unknow', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    unless classroom.students.include?(self)
      classroom.students << self
    end
  end
end

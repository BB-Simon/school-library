require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom = nil, name: 'Unknow', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
    @classroom.students << self if @classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end

class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def ad_student(student)
    students << student
    student.classroom = self
  end
end

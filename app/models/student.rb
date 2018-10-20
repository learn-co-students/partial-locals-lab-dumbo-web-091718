# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(name)
    if !name.empty?
      @students = Student.all.select {|student| student.name.downcase == name.downcase || student.name.downcase.include?(name.downcase)}
    else
      @students = Student.all
    end
    @students
  end
end

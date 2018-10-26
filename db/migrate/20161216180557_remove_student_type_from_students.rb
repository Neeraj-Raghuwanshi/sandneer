class RemoveStudentTypeFromStudents < ActiveRecord::Migration
  def change
  	remove_column :students, :student_type, :string
  end
end

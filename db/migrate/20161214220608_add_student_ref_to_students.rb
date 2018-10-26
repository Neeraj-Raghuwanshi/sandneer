class AddStudentRefToStudents < ActiveRecord::Migration
  def change
    add_column :students, :student_ref, :string
  end
end

class AddStudentTypeToStudents < ActiveRecord::Migration
  def change
    add_column :students, :student_type, :string, :default => "weekdays"
  end
end

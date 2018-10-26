class AddClassroomToStudents < ActiveRecord::Migration
  def change
    add_column :students, :classroom, :integer
  end
end

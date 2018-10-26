class AddStudentToAttendances < ActiveRecord::Migration
  def change
    add_reference :attendances, :student, index: true, foreign_key: true
  end
end

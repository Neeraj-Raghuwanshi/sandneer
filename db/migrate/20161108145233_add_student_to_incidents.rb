class AddStudentToIncidents < ActiveRecord::Migration
  def change
    add_reference :incidents, :student, index: true, foreign_key: true
  end
end

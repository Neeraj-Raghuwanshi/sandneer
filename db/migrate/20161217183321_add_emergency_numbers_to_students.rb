class AddEmergencyNumbersToStudents < ActiveRecord::Migration
  def change
    add_column :students, :emergencyno_1, :string
    add_column :students, :emergencyno_2, :string
    add_column :students, :emergencyno_3, :string
  end
end

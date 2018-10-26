class AddEmergencynoToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :emergencyno_1, :string
    add_column :teachers, :emergencyno_2, :string
    add_column :teachers, :emergencyno_3, :string
  end
end

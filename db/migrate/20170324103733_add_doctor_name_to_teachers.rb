class AddDoctorNameToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :doctors_name, :string
  end
end

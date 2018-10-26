class AddEthnicityToStudents < ActiveRecord::Migration
  def change
    add_column :students, :ethnicity_group, :string
  end
end

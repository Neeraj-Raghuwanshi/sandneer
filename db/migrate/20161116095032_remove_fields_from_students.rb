class RemoveFieldsFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :active, :boolean
  end
end

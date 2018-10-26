class RemoveFieldsFromTeachers < ActiveRecord::Migration
  def change
    remove_column :teachers, :active, :boolean
  end
end

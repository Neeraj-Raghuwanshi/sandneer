class RemoveTypeFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :type, :string
  end
end

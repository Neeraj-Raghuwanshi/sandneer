class RemoveFieldsFromParents < ActiveRecord::Migration
  def change
    remove_column :parents, :active, :boolean
  end
end

class AddActiveToParents < ActiveRecord::Migration
  def change
    add_column :parents, :active, :boolean, :default => true
  end
end

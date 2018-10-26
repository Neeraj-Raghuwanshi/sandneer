class AddDeletedAtToParents < ActiveRecord::Migration
  def change
    add_column :parents, :deleted_at, :datetime
    add_index :parents, :deleted_at
  end
end

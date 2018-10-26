class AddDeletedAtToWage < ActiveRecord::Migration
  def change
    add_column :wages, :deleted_at, :datetime
    add_index :wages, :deleted_at
  end
end

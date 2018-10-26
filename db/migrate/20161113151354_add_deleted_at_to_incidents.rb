class AddDeletedAtToIncidents < ActiveRecord::Migration
  def change
    add_column :incidents, :deleted_at, :datetime
    add_index :incidents, :deleted_at
  end
end

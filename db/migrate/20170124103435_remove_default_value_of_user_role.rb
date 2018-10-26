class RemoveDefaultValueOfUserRole < ActiveRecord::Migration
  def change
    change_column :users, :role, :string, :null => false, :default => ""
  end
end

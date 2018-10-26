class AddUserIdToModels < ActiveRecord::Migration
  def change
  	add_column :parents, :user_id, :integer
  	add_column :teachers, :user_id, :integer
  	add_column :students, :user_id, :integer
  	add_column :types, :user_id, :integer
  	add_column :levels, :user_id, :integer
  end
end

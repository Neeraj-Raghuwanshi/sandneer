class AddColumnParentTable < ActiveRecord::Migration
  def change
  	add_column :parents, :parent_token, :string
  end
end

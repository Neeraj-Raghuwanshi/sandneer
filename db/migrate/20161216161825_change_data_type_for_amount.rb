class ChangeDataTypeForAmount < ActiveRecord::Migration
  def up
    change_column :payments, :amount, :decimal, :precision => 8, :scale => 2
    end
 
 	def down
	change_column :payments, :amount, :integer
	end
end

class ChangeDataTypeToPresent < ActiveRecord::Migration
  def change
  	change_column :attendances, :present, :string  	
  end
end

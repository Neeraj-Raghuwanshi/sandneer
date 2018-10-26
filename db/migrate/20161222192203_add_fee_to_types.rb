class AddFeeToTypes < ActiveRecord::Migration
  def change
    add_column :types, :fee, :decimal, :precision => 8, :scale => 2
  end
end

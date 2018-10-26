class AddMonthToResult < ActiveRecord::Migration
  def change
    add_column :results, :month, :string
  end
end

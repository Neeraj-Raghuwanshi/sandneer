class AddDaysToLevels < ActiveRecord::Migration
  def change
		add_column :levels, :days, :string, array: true, default: '{}'
  end
end

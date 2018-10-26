class AddCountToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :students_count, :integer
  end
end

class AddCountToParents < ActiveRecord::Migration
  def change
    add_column :parents, :students_count, :integer
  end
end

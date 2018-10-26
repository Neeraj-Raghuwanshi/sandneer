class AddTypesCountToStudents < ActiveRecord::Migration
  def change
    add_column :types, :students_count, :integer
  end
end

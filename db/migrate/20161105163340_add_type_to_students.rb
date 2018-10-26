class AddTypeToStudents < ActiveRecord::Migration
  def change
    add_column :students, :type, :string, :default => "weekdays"
  end
end

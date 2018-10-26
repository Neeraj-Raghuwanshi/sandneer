class AddDisabilitiesToStudents < ActiveRecord::Migration
  def change
    add_column :students, :disabilities_note, :text
  end
end

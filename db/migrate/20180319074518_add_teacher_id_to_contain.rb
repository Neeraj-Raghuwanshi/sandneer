class AddTeacherIdToContain < ActiveRecord::Migration
  def change
    add_column :contains, :teacher_id, :integer
  end
end

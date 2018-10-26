class AddTeacherToLevels < ActiveRecord::Migration
  def change
    add_reference :levels, :teacher, index: true, foreign_key: true
  end
end

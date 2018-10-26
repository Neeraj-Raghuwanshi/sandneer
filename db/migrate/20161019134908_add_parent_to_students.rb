class AddParentToStudents < ActiveRecord::Migration
  def change
    add_reference :students, :parent, index: true, foreign_key: true
  end
end

class AddTypeIdToStudents < ActiveRecord::Migration
  def change
    add_reference :students, :type, index: true, foreign_key: true
  end
end

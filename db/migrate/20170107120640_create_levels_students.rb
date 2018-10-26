class CreateLevelsStudents < ActiveRecord::Migration
  def change
    create_table :levels_students do |t|
    	t.belongs_to :level, index: :true
    	t.belongs_to :student, index: :true
    end
  end
end

class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :exam_id
      t.integer :level_id
      t.integer :student_id
      t.string :obtain_marks
      t.string :total_marks
      t.timestamps null: false
    end
  end
end

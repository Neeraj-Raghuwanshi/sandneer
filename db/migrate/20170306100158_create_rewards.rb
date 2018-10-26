class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :compliment
      t.integer :student_id
      t.integer :teacher_id
      t.boolean :vote

      t.timestamps null: false
    end
  end
end

class CreateContains < ActiveRecord::Migration
  def change
    create_table :contains do |t|
      t.integer :parent_id
      t.string :bird_message_id
      t.timestamps null: false
    end
  end
end

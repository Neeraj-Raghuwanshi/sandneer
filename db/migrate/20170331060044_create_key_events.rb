class CreateKeyEvents < ActiveRecord::Migration
  def change
    create_table :key_events do |t|
      t.string :color
      # t.string :event_id
      t.string :name

      t.timestamps null: false
    end
  end
end

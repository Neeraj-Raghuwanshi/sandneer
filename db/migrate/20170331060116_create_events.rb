class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      # t.string :name
      t.string :description
      t.date :start_date
      t.date :end_date
      t.boolean :repeat_event
      t.string :key_event_id

      t.timestamps null: false
    end
  end
end

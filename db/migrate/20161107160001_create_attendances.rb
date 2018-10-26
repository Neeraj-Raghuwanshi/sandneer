class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.boolean :present
      t.boolean :absent
      t.boolean :partial
      t.date :attendance_date

      t.timestamps null: false
    end
  end
end

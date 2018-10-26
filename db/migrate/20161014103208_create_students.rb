class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :gender
      t.string :address
      t.string :postcode
      t.boolean :active, :default => true
      t.string :status
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end

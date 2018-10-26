class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :amount
      t.string :payment_type
      t.string :payment_for
      t.date :due_date
      t.date :paid_on

      t.timestamps null: false
    end
  end
end

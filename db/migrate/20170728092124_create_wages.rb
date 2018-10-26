class CreateWages < ActiveRecord::Migration
  def change
    create_table :wages do |t|
      t.decimal :amount, :precision => 8, :scale => 2
      t.string :payment_type
      t.date :paid_on
      t.references :teacher, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

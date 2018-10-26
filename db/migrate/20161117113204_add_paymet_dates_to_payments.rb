class AddPaymetDatesToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :payment_from, :date
    add_column :payments, :payment_until, :date
  end
end

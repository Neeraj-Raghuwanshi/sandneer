class AddChequeAndReceiptToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :receipt, :string
    add_column :payments, :cheque, :string
  end
end

class AddPaymentTermsToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :payment_term, :string
  end
end

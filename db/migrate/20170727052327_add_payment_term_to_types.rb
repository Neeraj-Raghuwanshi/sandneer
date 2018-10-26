class AddPaymentTermToTypes < ActiveRecord::Migration
  def change
    add_column :types, :payment_terms, :string
  end
end

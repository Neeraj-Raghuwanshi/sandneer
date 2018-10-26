class AddBookNumberToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :book_number, :string
  end
end

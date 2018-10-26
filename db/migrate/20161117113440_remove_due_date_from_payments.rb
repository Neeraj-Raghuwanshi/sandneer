class RemoveDueDateFromPayments < ActiveRecord::Migration
  def change
    remove_column :payments, :due_date, :date
  end
end

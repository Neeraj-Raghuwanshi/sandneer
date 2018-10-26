class AddOutstandingFeeToStudents < ActiveRecord::Migration
  def change
    add_column :students, :outstanding_fee, :decimal, :precision => 8, :scale => 2
  end
end

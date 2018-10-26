class AddDiscountToStudents < ActiveRecord::Migration
  def change
    add_column :students, :discount, :boolean
  end
end

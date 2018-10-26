class AddFieldsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :dd_student, :boolean
    add_column :students, :dd_amount, :float
    add_column :students, :dd_start_date, :date
    add_column :students, :dd_end_date, :date
  end
end
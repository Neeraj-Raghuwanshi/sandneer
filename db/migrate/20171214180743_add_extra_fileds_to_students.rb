class AddExtraFiledsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :home_phone, :string
    add_column :students, :languages_spoken, :string
    add_column :students, :p_maktab_name, :string
    add_column :students, :p_maktab_notes, :text
  end
end

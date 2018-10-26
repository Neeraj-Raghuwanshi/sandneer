class AddCrbCheckedAndDateToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :crb_checked, :boolean
    add_column :teachers, :crb_checked_on, :date
  end
end

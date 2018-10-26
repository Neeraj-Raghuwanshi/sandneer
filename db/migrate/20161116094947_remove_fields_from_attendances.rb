class RemoveFieldsFromAttendances < ActiveRecord::Migration
  def change
    remove_column :attendances, :absent, :boolean
    remove_column :attendances, :partial, :boolean
  end
end

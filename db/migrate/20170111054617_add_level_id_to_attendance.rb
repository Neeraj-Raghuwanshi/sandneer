class AddLevelIdToAttendance < ActiveRecord::Migration
  def change
    add_column :attendances, :level_id, :integer
  end
end

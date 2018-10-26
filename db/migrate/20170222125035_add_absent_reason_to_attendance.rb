class AddAbsentReasonToAttendance < ActiveRecord::Migration
  def change
  	add_column :attendances, :absent_reason, :text
  end
end

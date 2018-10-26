class AddReasonToAttendance < ActiveRecord::Migration
  def change
  	add_column :attendances, :reason, :text
  end
end

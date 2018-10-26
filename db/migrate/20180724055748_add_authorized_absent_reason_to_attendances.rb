class AddAuthorizedAbsentReasonToAttendances < ActiveRecord::Migration
  def change
    add_column :attendances, :authorized_absent_reason, :text
  end
end

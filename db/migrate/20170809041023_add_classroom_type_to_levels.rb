class AddClassroomTypeToLevels < ActiveRecord::Migration
  def change
    add_column :levels, :classroom_type, :string
  end
end

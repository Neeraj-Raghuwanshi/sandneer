class AddLevelIdToReward < ActiveRecord::Migration
  def change
    add_column :rewards, :level_id, :integer
  end
end

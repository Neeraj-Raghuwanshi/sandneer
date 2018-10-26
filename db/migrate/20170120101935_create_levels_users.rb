class CreateLevelsUsers < ActiveRecord::Migration
  def change
    create_table :levels_users do |t|
    	t.belongs_to :level, index: :true
    	t.belongs_to :user, index: :true
    end
  end
end

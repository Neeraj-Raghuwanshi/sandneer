class AddLatitudeAndLongitudeToParent < ActiveRecord::Migration
  def change
    add_column :parents, :latitude, :float
    add_column :parents, :longitude, :float
  end
end

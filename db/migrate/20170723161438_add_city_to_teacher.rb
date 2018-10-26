class AddCityToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :city, :string
  end
end

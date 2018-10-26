class AddCountryAndCityToParent < ActiveRecord::Migration
  def change
    add_column :parents, :country, :string
    add_column :parents, :city, :string
  end
end

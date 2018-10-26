class AddOtherFieldsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :school_name, :string
    add_column :students, :special_needs, :boolean
    add_column :students, :specialneeds_notes, :text
    add_column :students, :pickup_dropoff, :string
    add_column :students, :is_disabled, :boolean
    add_column :students, :doctors_name, :string
  end
end

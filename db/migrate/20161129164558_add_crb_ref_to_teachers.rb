class AddCrbRefToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :dbs_ref, :string
  end
end

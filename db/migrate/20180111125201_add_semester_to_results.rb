class AddSemesterToResults < ActiveRecord::Migration
  def change
    add_column :results, :semester_id, :integer
    add_column :results, :year, :string
  end
end

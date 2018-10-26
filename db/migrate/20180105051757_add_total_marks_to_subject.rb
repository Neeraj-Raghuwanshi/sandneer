class AddTotalMarksToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :total_marks, :string
  end
end

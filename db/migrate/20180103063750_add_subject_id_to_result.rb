class AddSubjectIdToResult < ActiveRecord::Migration
  def change
    add_column :results, :subject_id, :integer
    add_column :results, :category_id, :integer
  end
end

class CreateSubjectsCategories < ActiveRecord::Migration
  def change
    create_table :subjects_categories do |t|
      t.belongs_to :subject, index: :true
      t.belongs_to :category, index: :true
      t.timestamps null: false
    end
  end
end


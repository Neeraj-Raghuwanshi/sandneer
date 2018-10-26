class CreateLevelsExams < ActiveRecord::Migration
  def change
    create_table :levels_exams do |t|
      t.belongs_to :level, index: :true
      t.belongs_to :exam, index: :true
    end
  end
end

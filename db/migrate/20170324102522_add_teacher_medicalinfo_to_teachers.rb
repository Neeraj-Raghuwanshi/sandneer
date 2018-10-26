class AddTeacherMedicalinfoToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :special_needs, :boolean
    add_column :teachers, :specialneeds_notes, :text
    add_column :teachers, :is_disabled, :boolean
    add_column :teachers, :disabilities_note, :text
  end
end

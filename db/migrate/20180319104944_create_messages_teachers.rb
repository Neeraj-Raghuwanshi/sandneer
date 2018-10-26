class CreateMessagesTeachers < ActiveRecord::Migration
  def change
    create_table :messages_teachers, :id => false do |t|
      t.integer :message_id
      t.integer :teacher_id
    end
  end
end

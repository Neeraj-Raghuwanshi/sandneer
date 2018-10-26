class CreateMessagesParents < ActiveRecord::Migration
  def change
    create_table :messages_parents, :id => false do |t|
      t.integer :message_id
      t.integer :parent_id
    end
  end
end

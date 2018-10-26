class AddMessageBirdIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :message_bird_id, :string
  end
end

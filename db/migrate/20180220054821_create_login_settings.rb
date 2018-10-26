class CreateLoginSettings < ActiveRecord::Migration
  def change
    create_table :login_settings do |t|
      t.string :day
      t.string :login_from
      t.string :login_to
      t.boolean :prohibit_login
      t.integer :user_id
      t.timestamps null: false
    end
  end
end

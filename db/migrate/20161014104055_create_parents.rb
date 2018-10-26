class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :name
      t.string :address
      t.string :postcode
      t.string :home_phone
      t.string :mobile
      t.string :email
      t.string :relationship

      t.timestamps null: false
    end
  end
end

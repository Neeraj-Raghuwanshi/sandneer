class AddMobileandEmailToStudent < ActiveRecord::Migration
  def change
    add_column :students, :mobile, :string
    add_column :students, :email, :string
  end
end

class AddColumnToTeacher < ActiveRecord::Migration
  def change
  	add_column :teachers, :teacher_token, :string
  	add_column :teachers, :token_expiry, :datetime
  end
end

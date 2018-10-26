class AddColumnToStudents < ActiveRecord::Migration
  def change
  	add_column :students, :student_token, :string
  	add_column :students, :token_expiry, :datetime
  end
end

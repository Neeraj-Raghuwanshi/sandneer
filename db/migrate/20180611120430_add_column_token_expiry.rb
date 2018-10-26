class AddColumnTokenExpiry < ActiveRecord::Migration
  def change
  	add_column :parents, :token_expiry, :datetime
  end
end

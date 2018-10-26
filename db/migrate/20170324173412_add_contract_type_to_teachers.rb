class AddContractTypeToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :contract_type, :string
    add_column :teachers, :leaving_date, :date
  end
end

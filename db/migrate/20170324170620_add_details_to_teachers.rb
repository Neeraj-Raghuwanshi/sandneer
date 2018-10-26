class AddDetailsToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :gender, :string
    add_column :teachers, :dob, :date
    add_column :teachers, :marital_status, :string
    add_column :teachers, :nationality, :string
    add_column :teachers, :NI_number, :string
    add_column :teachers, :employee_number, :string
    add_column :teachers, :job_title, :string
    add_column :teachers, :salary, :integer
    add_column :teachers, :start_date, :date
    add_column :teachers, :working_hours, :integer
    add_column :teachers, :type, :string
  end
end

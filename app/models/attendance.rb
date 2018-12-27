class Attendance < ActiveRecord::Base
  belongs_to :student
  belongs_to :level

  # Validations
  validates :present, :presence =>{message: "Present can't be empty"}
  validates :attendance_date, :presence =>{message: "Attendance date can't be empty"}

end

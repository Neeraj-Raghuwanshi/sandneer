class Event < ActiveRecord::Base
  belongs_to :key_event

  # Validations
  validates :description, :presence =>{message: "Description can't be empty"}
  validates :start_date, :presence =>{message: "Start date can't be empty"}
  validates :end_date, :presence =>{message: "End date can't be empty"}

end

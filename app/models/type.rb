class Type < ActiveRecord::Base
  # Association
  has_many :students

  # Validations
  validates :name, :presence =>{message: "Name can't be empty"}
  validates :fee, :presence =>{message: "Fee can't be empty"}
  validates :payment_terms, :presence =>{message: "Payment terms can't be empty"}

end

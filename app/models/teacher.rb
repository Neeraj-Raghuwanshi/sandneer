class Teacher < ActiveRecord::Base
  has_one :level
  has_many :rewards
  has_many :messages
  has_many :contains
  has_many :wages, :dependent => :destroy
  has_and_belongs_to_many :messages

  # Validations
  validates :name, :presence =>{message: "Name can't be empty"}
  validates :contact, :presence =>{message: "Contact can't be empty"}
  validates :email, :presence =>{message: "Email can't be empty"}

end

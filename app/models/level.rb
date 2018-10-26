class Level < ActiveRecord::Base
  serialize :days, Array

  # Associations
  has_many :LevelsStudent
  has_many :students,through: :LevelsStudent,dependent: :destroy,counter_cache: true
  has_and_belongs_to_many :users
  belongs_to :teacher
  belongs_to :user
  has_many :rewards
  has_many :attendances, :dependent => :destroy
  has_many :LevelsExam
  has_many :exams,through: :LevelsExam,dependent: :destroy,counter_cache: true

  # Validations
  validates :name, :presence =>{message: "Name can't be empty"}
  validates :name, uniqueness: true
  validates :classroom_type, :presence =>{message: "Classroom type can't be empty"}
  validates :days, :presence =>{message: "Days can't be empty"}

end

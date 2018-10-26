class Exam < ActiveRecord::Base
  has_many :ExamsCategory
  has_many :categories, through: :ExamsCategory, dependent: :destroy,counter_cache: true
  has_many :LevelsExam
  has_many :levels, through: :LevelsExam, dependent: :destroy,counter_cache: true
end

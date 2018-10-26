class Category < ActiveRecord::Base
  has_many :ExamsCategory
  has_many :exams,through: :ExamsCategory,dependent: :destroy,counter_cache: true
  has_many :SubjectsCategory
  has_many :subjects,through: :SubjectsCategory,dependent: :destroy,counter_cache: true
end

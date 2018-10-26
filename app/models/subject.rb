class Subject < ActiveRecord::Base
  audited
  has_many :SubjectsCategory
  has_many :categories, through: :SubjectsCategory, dependent: :destroy,counter_cache: true
  accepts_nested_attributes_for :categories,:allow_destroy => true
  # validates :name, presence: true
  # validates :total_marks, presence: true
  # validates :categories, presence: true
  # validates_associated :categories
end

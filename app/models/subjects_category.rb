class SubjectsCategory < ActiveRecord::Base
  belongs_to :subject
  belongs_to :category
end

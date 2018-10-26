class LevelsStudent < ActiveRecord::Base

  # audited associated_with: :student
  # audited associated_with: :level
  belongs_to :student
  belongs_to :level
end

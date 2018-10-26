class LevelsExam < ActiveRecord::Base
  belongs_to :exam
  belongs_to :level
end

class Contain < ActiveRecord::Base
  belongs_to :parent
  belongs_to :teacher
end

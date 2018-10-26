class Message < ActiveRecord::Base
  # paginates_per 5
  belongs_to :user
  belongs_to :teacher
  has_and_belongs_to_many :parents , join_table: :messages_parents
  has_and_belongs_to_many :teachers
  has_many :contains
  # scope :published_in_month, ->(date) { where("MONTH(created_at) = ?", date.month) }
end

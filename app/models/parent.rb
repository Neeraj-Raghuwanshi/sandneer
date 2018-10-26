class Parent < ActiveRecord::Base
  # Associations
  belongs_to :auditlog
  has_many :students, :dependent => :destroy
  has_many :contains
  has_and_belongs_to_many :messages , join_table: :messages_parents

  # Validations
  validates :name, :presence =>{message: "Name can't be empty"}
  validates :relationship, :presence =>{message: "Relationship can't be empty"}
  validates :mobile, :presence =>{message: "Mobile can't be empty"}
  validates :mobile, uniqueness: true
  validates_associated :students

  # Nested Attributes
  accepts_nested_attributes_for :students, :allow_destroy => true

  # For Map
  geocoded_by :full_address
  after_validation :geocode, :if => :postcode_changed? and :address_changed?

  # Callbacks
  attr_accessor :notify
  before_save :capitalize_name
  after_create :send_parent_email,:fill_student_detail
  after_update :fill_student_detail

  def fill_student_detail
    if self.students.present?
      student_object_1 = self.students.where.not(emergencyno_1: nil).first
      student_object_2 = self.students.where.not(emergencyno_2: nil).first
      student_object_3 = self.students.where.not(emergencyno_3: nil).first
      self.students.all.each do |student|
        student.emergencyno_1 = student_object_1.emergencyno_1
        student.emergencyno_2 = student_object_2.emergencyno_2
        student.emergencyno_3 = student_object_3.emergencyno_3
        student.save
      end
    end
  end

  def self.check_string(string)
    string.scan(/\D/).empty?
  end

  def full_address
    [address, city, postcode].compact.join(', ')
  end

  def send_parent_email
    if self.notify == 'true' && self.email.present?
      ParentMailer.welcome_email(self).deliver_now
    end
  end

  # Country Selection
  UK_OPTION = {
    "United Kingdom" => "GB",
    "Ireland" => "IE",
  }

  IE_OPTION = {
    "Ireland" => "IE",
    "United Kingdom" => "GB",
  }

  # For capitalize parent name
  def capitalize_name
    self.name = self.name.split.collect(&:capitalize).join(' ') if self.name && !self.name.blank?
  end

end

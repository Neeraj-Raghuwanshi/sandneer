class Student < ActiveRecord::Base
  # associations
  belongs_to :parent, counter_cache: true
  belongs_to :type, counter_cache: true
  belongs_to :user, foreign_key: :type_id
  has_many :rewards
  has_many :LevelsStudent
  has_many :levels, through: :LevelsStudent,counter_cache: true
  has_many :payments, :dependent => :destroy
  has_many :attendances, :dependent => :destroy
  has_many :incidents, :dependent => :destroy
  has_many :results, :dependent => :destroy

  # Validations
  validates :first_name, :presence =>{message: "First name can't be empty"}
  validates :last_name, :presence =>{message: "Last name can't be empty"}
  validates :dob, :presence =>{message: "Dob can't be empty"}
  validates :gender, :presence =>{message: "Gender can't be empty"}
  validates :status, :presence =>{message: "Status can't be empty"}

  # Callbacks
  before_create :copy_parent_address, :copy_mobile, :copy_email, :copy_home_phone
  before_create :update_name
  before_update :update_name

  #scope for status
  scope :enrolled, -> { where('status = ?', "Enrolled") }
  scope :applied, -> { where('status = ?', "Applied") }
  scope :shortlist, -> { where('status = ?', "Shortlist") }
  scope :waitlist, -> { where('status = ?', "Waitlist") }

  def update_name
    self.name = "#{self.first_name} #{self.last_name}"
  end

  def copy_parent_address
    if self.address.blank? && self.parent.present?
      self.address = self.parent.address
      self.postcode = self.parent.postcode
    end
  end

  def copy_mobile
    if self.mobile.blank? && self.parent.present?
      self.mobile = self.parent.mobile
    end
  end

  def copy_email
    if self.email.blank? && self.parent.present?
      self.email = self.parent.email
    end
  end

  def copy_home_phone
    if self.home_phone.blank? && self.parent.present?
      self.home_phone = self.parent.home_phone
    end
  end

end


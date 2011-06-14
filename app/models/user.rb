class User < ActiveRecord::Base
  # Devise generated code
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :remember_me

  # Has many courses, can't exist by themselves
  has_many :courses, :dependent => :destroy

  # Validations
  validates_presence_of :role
  validates_inclusion_of :role, :in => %w(member admin)
  validates_associated :courses

  def gpa
    totalGpaValue = 0.0
    courses.each{|c| totalGpaValue += (c.gpa_value * c.credit)}
    totalCredits = 0.0
    courses.each{|c| totalCredits += c.credit}
    totalGpaValue/totalCredits
  end
end

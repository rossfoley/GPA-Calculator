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
    return 0.0 if self.courses.empty?
    totalGpaValue, totalCredits = 0.0, 0.0
    self.courses.each do |c|
      totalGpaValue += (c.gpa_value * c.credit)
      totalCredits += c.credit
    end
    totalGpaValue/totalCredits
  end

  def honor_status
    return "None" if self.courses.empty?
    totalHonorValue, totalCredits = 0.0, 0.0
    self.courses.each do |c|
      totalHonorValue += (c.honor_value * c.credit)
      totalCredits += c.credit
    end
    honor = (totalHonorValue/totalCredits).round
    case honor
    when 12,11,10 then "High Honors"
    when 9 then "Honors"
    when 8 then "Honorable Mention"
    else
      "None"
    end
  end
end

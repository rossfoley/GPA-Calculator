class Course < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :grade, :level, :credit, :user_id
  validates_numericality_of :credit, :less_than_or_equal_to => 1.000
  validates_inclusion_of :level, :in => %w(AP L1 L2)

  LEVELS = %w(AP L1 L2)
  GRADES = %w(A+ A A- B+ B B- C+ C C- D+ D D- F)
  CREDITS = [1.0, 0.5, 0.375, 0.25]

  def gpa_value
    case self.level
    when "AP" then ap_value(self.grade)
    when "L1" then l1_value(self.grade)
    when "L2" then l2_value(self.grade)
    end
  end

  def honor_value
    case self.grade
    when "A+"  then 12
    when "A"   then 11
    when "A-"  then 10
    when "B+"  then 9
    when "B"   then 8
    when "B-"  then 7
    when "C+"  then 6
    when "C"   then 5
    when "C-"  then 4
    when "D+"  then 3
    when "D"   then 2
    when "D-"  then 1
    when "F"  then 0
    end
  end

  private

  def ap_value(gr)
    case gr
    when "A+"  then 5.3
    when "A"   then 5.0
    when "A-"  then 4.7
    when "B+"  then 4.3
    when "B"   then 4.0
    when "B-"  then 3.7
    when "C+"  then 3.3
    when "C"   then 3.0
    when "C-"  then 2.7
    when "D+"  then 2.3
    when "D"   then 2.0
    when "D-"  then 1.7
    when "F"  then 0.0
    end
  end
  def l1_value(gr)
    case gr
    when "A+"  then 4.8
    when "A"   then 4.5
    when "A-"  then 4.2
    when "B+"  then 3.8
    when "B"   then 3.5
    when "B-"  then 3.2
    when "C+"  then 2.8
    when "C"   then 2.5
    when "C-"  then 2.2
    when "D+"  then 1.8
    when "D"   then 1.5
    when "D-"  then 1.2
    when "F"  then 0.0
    end
  end
  def l2_value(gr)
    case gr
    when "A+"  then 4.3
    when "A"   then 4.0
    when "A-"  then 3.7
    when "B+"  then 3.3
    when "B"   then 3.0
    when "B-"  then 2.7
    when "C+"  then 2.3
    when "C"   then 2.0
    when "C-"  then 1.7
    when "D+"  then 1.3
    when "D"   then 1.0
    when "D-"  then 0.7
    when "F"  then 0.0
    end
  end
end

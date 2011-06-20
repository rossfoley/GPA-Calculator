class Course < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :grade, :level, :credit, :user_id
  validates_numericality_of :credit, :less_than_or_equal_to => 1.000
  validates_inclusion_of :level, :in => %w(AP L1 L2)

  LEVELS = %w(AP L1 L2)
  GRADES = %w(A+ A A- B+ B B- C+ C C- D+ D D- F)
  CREDITS = [1.0, 0.5, 0.375, 0.25]

  VALUES = {"A+" => {"AP" => 5.3, "L1" => 4.8, "L2" => 4.3, "Honor" => 12, "Standard" => 4},
            "A"  => {"AP" => 5.0, "L1" => 4.5, "L2" => 4.0, "Honor" => 11, "Standard" => 4},
            "A-" => {"AP" => 4.7, "L1" => 4.2, "L2" => 3.7, "Honor" => 10, "Standard" => 4},
            "B+" => {"AP" => 4.3, "L1" => 3.8, "L2" => 3.3, "Honor" =>  9, "Standard" => 3},
            "B"  => {"AP" => 4.0, "L1" => 3.5, "L2" => 3.0, "Honor" =>  8, "Standard" => 3},
            "B-" => {"AP" => 3.7, "L1" => 3.2, "L2" => 2.7, "Honor" =>  7, "Standard" => 3},
            "C+" => {"AP" => 3.3, "L1" => 2.8, "L2" => 2.3, "Honor" =>  6, "Standard" => 2},
            "C"  => {"AP" => 3.0, "L1" => 2.5, "L2" => 2.0, "Honor" =>  5, "Standard" => 2},
            "C-" => {"AP" => 2.7, "L1" => 2.2, "L2" => 1.7, "Honor" =>  4, "Standard" => 2},
            "D+" => {"AP" => 2.3, "L1" => 1.8, "L2" => 1.3, "Honor" =>  3, "Standard" => 1},
            "D"  => {"AP" => 2.0, "L1" => 1.5, "L2" => 1.0, "Honor" =>  2, "Standard" => 1},
            "D-" => {"AP" => 1.7, "L1" => 1.2, "L2" => 0.7, "Honor" =>  1, "Standard" => 1},
            "F"  => {"AP" => 0.0, "L1" => 0.0, "L2" => 0.0, "Honor" =>  0, "Standard" => 0}}

  def gpa_value
    VALUES[self.grade][self.level]
  end

  def standard_gpa_value
    VALUES[self.grade]["Standard"]
  end

  def honor_value
    VALUES[self.grade]["Honor"]
  end
end

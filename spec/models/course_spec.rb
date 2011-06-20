require 'spec_helper'

describe Course do
  context "Associations" do
    it "should belong to a user" do
      should respond_to(:user)
    end
  end
  context "Validations" do
    [:name, :grade, :level, :credit, :user_id].each do |attr|
      it "should validate the presence of #{attr}" do
        course = Course.new
        course.should_not be_valid
        course.errors_on(attr).should_not be_nil
      end
    end
    it "should validate that credit is a number <= 1" do
      course = Factory.build(:course)
      ["notanumber", 2.000].each do |a|
        course.credit = a
        course.should_not be_valid
        course.errors_on(:credit).should_not be_nil
      end
      course.credit = 0.375
      course.should be_valid
    end
    it "should have a valid level" do
      course = Factory.build(:course, :level => "L3")
      course.should_not be_valid
      course.errors_on(:level).should_not be_nil
      %w(AP L1 L2).each do |lvl|
        course.level = lvl
        course.should be_valid
      end
    end
  end
  {"AP" => 4.0, "L1" => 3.5, "L2" => 3.0}.each do |key, value|
    it "should correctly compute a #{key} GPA value" do
      course = Factory(:course, :level => key, :grade => "B")
      course.gpa_value.should == value
    end
  end
  it "should compute a standard 4.0 based GPA value" do
    course = Factory(:course, :grade => "A")
    course.standard_gpa_value.should == 4
  end
  it "should compute an honor value" do
    course = Factory(:course, :grade => "B-")
    course.honor_value.should == 7
  end
end

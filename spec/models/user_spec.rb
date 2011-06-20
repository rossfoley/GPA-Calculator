require 'spec_helper'

describe User do
  context "Validations" do
    it "should validate the presence of a role" do
      user = User.new
      user.should_not be_valid
      user.errors_on(:role).should_not be_nil
      user.role = "member"
      user.errors_on(:role).should be_empty
    end
    it "should validate that the user can only be a member or admin" do
      user = Factory.build(:user, :role => "thisisnotvalid")
      user.should_not be_valid
      %w(member admin).each do |a|
        user.role = a
        user.should be_valid
      end
    end
    it "should validate all of its courses" do
      user = Factory(:user)
      course = Course.new
      user.courses = [course]
      user.should_not be_valid
    end
  end
  context "Associations" do
    it "should have many courses" do
      should respond_to(:courses)
    end
    it "should delete the courses when the user is deleted" do
      user = Factory(:user)
      course = Factory(:course)
      user.courses = [course]
      expect {
        user.destroy
      }.to change{Course.count}.from(1).to(0)
    end
  end
  it "should have a GPA" do
    should respond_to(:gpa)
  end
  it "should calculate a GPA" do
    user = Factory(:user)
    user.courses = 5.times.collect do
      Factory(:course, :level => "L1", :credit => 1.000, :grade => "A+") 
    end
    user.gpa.should == 4.8
  end
  it "should return 0.0 if there are no courses" do
    user = User.new
    user.gpa.should == 0.0
  end
  it "should calculate Honor Role status" do
    user = Factory(:user)
    user.courses = [Factory(:course, :grade => "A-"), Factory(:course, :grade => "B")]
    user.honor_status.should == "Honors"
  end
end

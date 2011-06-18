require "spec_helper"
require "cancan/matchers"

describe "Ability" do
  describe "as guest" do
    before(:each) do
      @ability = Ability.new(nil)
    end

    it "can only create a user" do
      @ability.should be_able_to(:create, User)
      @ability.should_not be_able_to(:update, User)
    end

    it "can access home and info pages" do
      @ability.should be_able_to(:access, :home)
      @ability.should be_able_to(:access, :info)
    end
  end

  describe "as member" do
    before(:each) do
      @user = Factory(:user)
      @course = Factory(:course, :user_id => @user.id)
      @ability = Ability.new(@user)
    end
    
    it "can update their own account" do
      @ability.should be_able_to(:update, @user)
      @ability.should_not be_able_to(:update, User.new)
    end

    it "can CRUD their courses" do
      @ability.should be_able_to(:create, Course)
      @ability.should be_able_to(:read, @course)
      @ability.should be_able_to(:update, @course)
      @ability.should be_able_to(:destroy, @course)
      @ability.should_not be_able_to(:read, Course.new)
      @ability.should_not be_able_to(:update, Course.new)
      @ability.should_not be_able_to(:destroy, Course.new)
    end
  end
  describe "as admin" do
    before(:each) do
      @user = Factory(:user, :role => "admin")
      @ability = Ability.new(@user)
    end

    it "can manage all" do
      @ability.should be_able_to(:manage, :all)
    end
  end
end

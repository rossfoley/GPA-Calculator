require "spec_helper"
require "cancan/matchers"

describe "Ability" do
  describe "as guest" do
    before(:each) do
      @ability = Ability.new(nil)
    end

    it "can only create a user" do
      @ability.should be_able_to(:create, :users)
      @ability.should_not be_able_to(:update, :users)
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

    it "can update their courses" do
      @ability.should be_able_to(:update, @course)
      @ability.should_not be_able_to(:update, Course.new)
    end
  end
end

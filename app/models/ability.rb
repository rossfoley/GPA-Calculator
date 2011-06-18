class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new {|u| u.role = "guest"} # using :role => "guest" doesn't work
    can :create, :users

    if user
      can :update, User, :id => user.id 
      can :update, Course do |course|
        course.user_id == user.id
      end
    end

  end
end

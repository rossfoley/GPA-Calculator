class Ability
  include CanCan::Ability

  def initialize(user)
    # user ||= User.new {|u| u.role = "guest"} # using :role => "guest" doesn't work
    can :create, User
    can :access, :home
    can :access, :info

    if user
      if user.role == "admin"
        can :manage, :all
      else
        can :update, User, :id => user.id 
        can :create, Course
        can [:read, :update, :destroy], Course do |course|
          course.user_id == user.id
        end
      end
    end

  end
end

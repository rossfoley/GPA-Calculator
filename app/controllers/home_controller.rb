class HomeController < ApplicationController
  def index
    redirect_to user_courses_path(current_user), :flash => flash if user_signed_in?
  end
end

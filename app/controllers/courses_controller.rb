class CoursesController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :authenticate_user!
  load_and_authorize_resource :user
  load_and_authorize_resource :course, :through => :user

  def index
    respond_with @user.courses
  end

  def show
    respond_with @course
  end

  def new
    respond_with @course
  end

  def edit
  end

  def create
    if @course.save
      flash[:notice] = "Successfully created course."
    end
    respond_with @course, :location => user_courses_url
  end

  def update
    if @course.update_attributes(params[:course])
      flash[:notice] = "Successfully updated course."
    end
    respond_with @course, :location => user_courses_url
  end

  def destroy
    @course.destroy
    flash[:notice] = "Successfully destroyed course."
    respond_with @course, :location => user_courses_url
  end
end

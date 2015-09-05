class CoursesController < ApplicationController
  respond_to :html, :xml, :json, :js
  before_filter :authenticate_user!
  load_and_authorize_resource :user
  load_and_authorize_resource :course, through: :user, param_method: :resource_params

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
      flash[:notice] = "Successfully created #{@course.name}."
    end
    respond_with @course, :location => user_courses_url
  end

  def update
    if @course.update_attributes(resource_params)
      flash[:notice] = "Successfully updated #{@course.name}."
    end
    respond_with @course, :location => user_courses_url
  end

  def destroy
    course_name = @course.name
    @course.destroy
    flash[:notice] = "Successfully deleted #{course_name}."
    respond_with @course, :location => user_courses_url
  end

  private

  def resource_params
    params.require(:course).permit(:name, :grade, :level, :credit, :user, :user_id)
  end
end

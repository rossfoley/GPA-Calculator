class CoursesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_user
  load_and_authorize_resource :user
  load_and_authorize_resource :course, :through => :user

  def index
    respond_to do |format|
      format.html
      format.xml  { render :xml => @courses }
    end
  end

  def show
    respond_to do |format|
      format.html 
      format.xml  { render :xml => @course }
    end
  end

  def new
    respond_to do |format|
      format.html
      format.xml  { render :xml => [@user, @course] }
    end
  end

  def edit
  end

  def create
    respond_to do |format|
      if @course.save
        format.html { redirect_to(user_courses_url, :notice => 'Course was successfully created.') }
        format.xml  { render :xml => [@user, @course], :status => :created, :location => @course }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to(user_courses_url, :notice => 'Course was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @course.destroy

    respond_to do |format|
      format.html { redirect_to(user_courses_url) }
      format.xml  { head :ok }
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end

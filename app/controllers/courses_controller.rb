class CoursesController < ApplicationController
  before_action :find_course, only: [:show, :edit, :update, :destroy]
  before_action :admin_only, except: [:show, :index]
  before_action :require_login

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      flash[:success] = "#{@course.name} information has been updated in the database"
      redirect_to @course
    else
      render 'edit'
    end
  end

  def index
    @courses = Course.all.order('NAME ASC')
  end

  def show
  end

  def destroy
    @course.destroy
    flash[:success] = "Instructor has been deleted from the database!"
    redirect_to courses_path
  end

  private

  def find_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :total_hours, :tuition)
  end

  def admin_only
    if current_user.admin === false || current_user.admin === nil
      flash[:notice] = "Access Denied. You were not authorized to view that page"
      redirect_to root_path alert: 'Access Denied'
    end
  end

  def require_login
    if current_user === nil
      flash[:notice] = "You are not logged in and/or signed up yet. Please Try again"
      redirect_to login_path
    end
  end
end

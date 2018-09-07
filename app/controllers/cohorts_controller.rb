class CohortsController < ApplicationController
  before_action :find_cohort, only: [:show, :edit, :update, :destroy]
  before_action :find_course
  before_action :find_instructor, except: [:new, :create]
  before_action :admin_only, except:[:index, :show]
  before_action :require_login

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)
    @cohort.course_id = @course.id

    if @cohort.save
      msg = "New cohort #{@cohort.name} for #{@course.name} has been created for #{@cohort.start_date} to #{@cohort.end_date}"
      flash[:success] = msg
      redirect_to course_cohort_path(@cohort.course_id, @cohort)
    else
      render 'new'
    end
  end

  def edit

  end

  def update

    if @cohort.update(cohort_params)
      flash[:success] = "#{@cohort.name} records has been updated in the database"
      redirect_to course_cohort_path(@cohort.course.id, @cohort)
    else
      render 'edit'
    end
  end

  def show

  end

  def destroy
    @cohort.destroy
    flash[:success] = "Cohort has been deleted from the database!"
    redirect_to course_path(@course.id)
  end

  def index
    @cohorts = Cohort.all
  end

  private

  def find_cohort
    @cohort = Cohort.find(params[:id])
  end

  def find_course
    @course = Course.find(params[:course_id])
  end

  def find_instructor
    @instructor = Instructor.find_by(cohort_id:@cohort.id)
  end

  def cohort_params
    params.require(:cohort).permit(:name, :start_date, :end_date)
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

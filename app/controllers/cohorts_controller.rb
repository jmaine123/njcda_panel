class CohortsController < ApplicationController
  before_action :find_cohort, only: [:show, :edit, :update, :destroy]
  before_action :find_course
  before_action :find_instructor

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
    flash[:success] = "Instructor has been deleted from the database!"
    redirect_to instructors_path
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
end

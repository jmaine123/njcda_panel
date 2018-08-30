class CohortsController < ApplicationController
  before_action :find_cohort, only: [:show, :edit, :update, :destroy]
  def new
    @cohort = Cohort.new
    @course = Course.find(params[:course_id])
  end

  def create
    @cohort = Cohort.new(cohort_params)
    @course = Course.find(params[:course_id])
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
    @course = Course.find(params[:course_id])
  end

  def update
    @course = Course.find(params[:course_id])
    if @cohort.update(cohort_params)
      flash[:success] = "#{@cohort.name} records has been updated in the database"
      redirect_to course_cohort_path(@cohort.course.id, @cohort)
    else
      render 'edit'
    end
  end

  def show
  end

  def index
    @course = Course.find(params[:course_id])
    @cohorts = Cohort.all
  end
  private

  def find_cohort
    @cohort = Cohort.find(params[:id])
  end

  def cohort_params
    params.require(:cohort).permit(:name, :start_date, :end_date)
  end
end

class CohortsController < ApplicationController
  before_action :find_cohort, only: [:show, :edit, :update, :destroy]
  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)

    if @cohort.save
      msg = "New cohort #{@cohort.name} has been created for #{@cohort.start_date} to #{@cohort.end_date}"
      flash[:success] = msg
      redirect_to @cohort
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @cohort.update(cohort_params)
          flash[:success] = "#{@cohort.name} records has been updated in the database"
      redirect_to @cohort
    else
      render 'edit'
    end
  end

  def show
  end

  def index
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

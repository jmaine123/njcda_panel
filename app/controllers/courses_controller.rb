class CoursesController < ApplicationController
  before_action :find_course, only: [:show, :edit, :update, :destroy]

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
  end

  private

  def find_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :total_hours)
  end
end

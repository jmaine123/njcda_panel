class InstructorsController < ApplicationController
before_action :find_instructor, only: [:show, :edit, :update, :destroy]
before_action :find_course_cohort

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(instructor_params)
    @instructor.cohort_id = @cohort.id
    @instructor.course_id = @course.id
    if @instructor.save
      flash[:notice] = "Instructor successfully registered"
      redirect_to course_cohort_instructor_path(@course.id,@instructor.cohort_id, @instructor)
    else
      render 'new'
    end
  end

  def index
    @instructors = Instructor.all
  end

  def edit
  end

  def update
    if @instructor.update(instructor_params)
      redirect_to course_cohort_instructor_path(@course.id,@instructor.cohort_id, @instructor), notice: 'Instructor information has been successfully updated'
    else
      render 'edit'
    end
  end

  def destroy
    @instructor.destroy
    flash[:success] = "Instructor has been deleted from the database!"
    redirect_to course_cohort_path(@course.id, @cohort.id)
  end

  def show
  end

  private

  def instructor_params
    params.require(:instructor).permit(:first_name, :last_name, :email, :age, :salary, :education)
  end

  def find_instructor
  @instructor = Instructor.find(params[:id])
  end

  def find_course_cohort
    @cohort = Cohort.find(params[:cohort_id])
    @course = Course.find(params[:course_id])
  end

end

class InstructorsController < ApplicationController
before_action :find_instructor, only: [:show, :edit, :update, :destroy]
before_action :find_course_cohort, except: [:index]
before_action :admin_only, except: [:index]
before_action :require_login

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(instructor_params)
    @instructor.cohort_id = @cohort.id
    @instructor.course_id = @course.id
    @instructor.generate_instructor_id
    if @instructor.save
      flash[:notice] = "Instructor successfully registered"
      redirect_to course_cohort_instructor_path(@course.id,@instructor.cohort_id, @instructor)
    else
      render 'new'
    end
  end

  def index
    @instructors = Instructor.all.order('last_name ASC')
  end

  def edit
  end

  def update
    if @instructor.update(instructor_params)
      flash[:notice] = "Instructor successfully updated"
      redirect_to course_cohort_instructor_path(@course.id,@instructor.cohort_id, @instructor), notice: 'Instructor information has been successfully updated'
    else
      render 'edit'
    end
  end

  def destroy
    @instructor.destroy
    flash[:success] = "Instructor has been deleted from the database!"
    # redirect_to course_cohort_path(@course.id, @cohort.id)
    # redirect_to root_path
    respond_to do |format|
      format.js
      format.html { p 'html response'; redirect_to root_path}
    end
  end

  def show
  end

  private

  def instructor_params
    params.require(:instructor).permit(:first_name, :last_name, :email, :age, :salary, :education, :phone_number)
  end

  def find_instructor
  @instructor = Instructor.find(params[:id])
  end

  def find_course_cohort
    @cohort = Cohort.find(params[:cohort_id])
    @course = Course.find(params[:course_id])
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

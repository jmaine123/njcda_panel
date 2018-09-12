class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update, :destroy]
  before_action :find_course_cohort, except: [:index]
  before_action :admin_only, except: [:index]
  before_action :require_login
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.cohort_id = @cohort.id
    @student.course_id = @course.id
    @student.generate_student_id
    if @cohort.max_students == nil ||(@cohort.students.count <= @cohort.max_students)
      if @student.save
        msg = "New Student #{@student.first_name} registered"
        redirect_to course_cohort_path(@course.id,@student.cohort_id, @student)
        flash[:success] = msg
      else
        render 'new'
      end
    end
  end

  def index
    @students = Student.all.order('last_name ASC')
  end

  def edit

  end

  def update
    if @student.update(student_params)
      flash[:success] = "#{@student.full_name} records has been updated in the database"
      redirect_to course_cohort_student_path(@course.id,@student.cohort_id, @student.id), notice: 'Instructor information has been successfully updated'
    else
      render 'edit'
    end
  end

  def destroy
    @student.destroy
    flash[:notice] = "A student has been deleted from the #{@cohort.name}!"
    # redirect_to course_cohort_path(@course.id, @cohort.id)
    respond_to do |format|
      format.js
      format.html { p 'html response'; redirect_to root_path}
    end
  end

  def show
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :age, :education, :phone_number)
  end

  def find_student
    @student = Student.find(params[:id])
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

class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update, :destroy]
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      msg = "New Student #{@student.first_name} registered"
      flash[:success] = msg
      redirect_to @student
    else
      render 'new'
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
      redirect_to @student
    else
      render 'edit'
    end
  end

  def destroy
    @student.destroy
    flash[:success] = "A Instructor has been deleted from the database!"
    redirect_to students_path
  end

  def show
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :age, :education)
  end

  def find_student
    @student = Student.find(params[:id])
  end
end

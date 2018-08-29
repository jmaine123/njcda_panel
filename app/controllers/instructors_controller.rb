class InstructorsController < ApplicationController
before_action :find_instructor, only: [:show, :edit, :update, :destroy]

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(instructor_params)
    if @instructor.save!
      flash[:notice] = "Instructor successfully registered"
      redirect_to @instructor
    else
      render 'new'
    end
  end

  def index
    @instructors = Instructor.all
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def update
    if @instructor.update(instructor_params)
      redirect_to @instructor, notice: 'Instructor information has been successfully updated'
    else
      render 'edit'
    end
  end

  def destroy
    @instructor.destroy
    flash[:success] = "Instructor has been deleted from the database!"
    redirect_to instructors_path
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
end

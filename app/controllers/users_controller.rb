class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.type_of_user
    p 'start'
    if @user.admin === true || Instructor.exists?(email: @user.email) || Student.exists?(email: @user.email)
      if @user.save
        p msg = "Thanks for signing up, #{@user.email}"
        flash[:notice] = msg
        redirect_to root_path
      else
        render 'new'
      end
    else
      p 'not in the database, please enter the right information'
    end
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all.order('last_name DESC')
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :email, :age, :auth_code, :last_name, :password, :password_confirmation)
  end

  def valid_user?

  end
end

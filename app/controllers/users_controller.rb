class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.type_of_user
    if @user.save
      msg = "Thanks for signing up, #{@user.email}"
      flash[:success] = msg
      redirect_to 'register'
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end
  
  private

  def user_params
    params.require(:user).permit(:first_name, :email, :age, :auth_code, :last_name, :password_digest)
  end
end

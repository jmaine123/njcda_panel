class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def edit
  end

  def index
  end

  def show
  end

  private

  def user_params
    params.require.(:user).permit(:first_name, :last_name,:email, :age, :position, :auth_code)
  end
end

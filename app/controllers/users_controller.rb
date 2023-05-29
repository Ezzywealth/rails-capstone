class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_params, only: [:create]

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created successfully"
      redirect_to categories_path
    else
      flash[:alert] = "User not created"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
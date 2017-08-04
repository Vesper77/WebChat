class UsersController < ApplicationController
  include Swagger::Docs::Methods
  before_action :authenticate_user!
  swagger_controller :users, "User Management"

  swagger_api :index do
    summary "Fetches all Users"
    notes "This lists all the active users"
  end

  def index
    @users = User.all
  end

  swagger_api :show do
    summary "Show user on click"
    notes "Finding user by id"
  end

  def show
    @user = User.find(params[:id])
  end

  def new

  end


  def delete

  end


  private
  def user_params
    params.require(:user).permit(:name, :password)
  end
end

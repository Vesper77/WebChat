class WelcomeController < ApplicationController
  def index
  end

  def create
    @user = User.new(params)

    @user.save
    redirect_to @user
  end

end

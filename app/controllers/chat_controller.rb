class ChatController < ApplicationController
  before_action :authenticate_user!


  def index
    @users = User.all

  end

  def show

  end

  def create

  end

end

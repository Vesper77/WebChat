class ChatController < ApplicationController
  def index
    @users = User.all
  end

  def show

  end

end

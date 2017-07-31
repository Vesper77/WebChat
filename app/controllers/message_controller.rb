class MessageController < ApplicationController
  before_action :authenticate_user!



  # def index
  #   @user = User.find(params[:userId])
  #   puts "Username = #{@user.name}"
  #   @receiver = @user.id
  #   join1 = User.joins("FULL JOIN messages ON messages.user_id = users.id").where("(author = '#{current_user.id}' and receiver = '#{@receiver}') or (author = '#{@receiver}' and receiver = '#{current_user.id}')")
  #   join2 = Message.joins("FULL JOIN users ON messages.user_id = users.id").where("(author = '#{current_user.id}' and receiver = '#{@receiver}') or (author = '#{@receiver}' and receiver = '#{current_user.id}')")
  #
  #
  #   json = []
  #   json << join1
  #   json << join2
  #   json << {username: current_user.name}
  #   json << {receiver: @receiver}
  #
  #
  #   render json: json
  # end

  def index
    @author = {:id => current_user.id, :name => current_user.name}
    @receiver = {:id => params[:userId], :name => User.find(params[:userId]).name}
    @msgs = Message.where("(author = '#{@author[:id]}'
                                  and receiver = '#{@receiver[:id]}')
                                  or (author = '#{@receiver[:id]}'
                                  and receiver = '#{@author[:id]}')")
    @array = []
    @msg = {}
    @msgs.find_each do |item|
      @msg = {:text => item.text, :date => item.created_at}
      if @author[:id] == item.author
        @msg[:author] = @author[:name]
        @msg[:receiver] = @receiver[:name]
      else
        @msg[:author] = @receiver[:name]
        @msg[:receiver] = @author[:name]
      end
      @array << @msg
    end
    puts "SSL works"
    json = {:author => @author, :receiver => @receiver, :msgs => @array}
    render json: json
  end

  def create
    @message = Message.new({
                               author: current_user.id,
                               user_id: current_user.id,
                               receiver: params[:userId],
                               text: params[:message]
                           })
    puts "Author = #{@message.author}"
    puts "Receiver = #{@message.receiver}"
    @message.save
    if @message.save
      ActionCable.server.broadcast 'messages',
                                   message: @message.text,
                                   user: current_user.name
      head :ok
    end
  end


end



class MessageController < ApplicationController
  before_action :authenticate_user!


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
    json = {:author => @author, :receiver => @receiver, :msgs => @array}

    render json: json
  end

  def create

    @message = Message.new({
                               author: current_user.id,
                               receiver: params[:userId],
                               text: params[:message]
                           })
    puts "Author = #{@message.author}"
    puts "Receiver = #{@message.receiver}"
    @message.save


    if item = @message.text.match(/\/bot\s{1}\d+$/)


      Resque.enqueue(Sleeper, @message.author, item[0].split[1].to_i)

    end

    if @message.save
      ActionCable.server.broadcast 'messages',
                                   message: @message.text,
                                   user: current_user.name
      head :ok
    end


  end


end


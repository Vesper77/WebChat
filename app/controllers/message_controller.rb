class MessageController < ApplicationController
  before_action :authenticate_user!


  def index
    @user = User.find(params[:userId])
    puts "Username = #{@user.name}"
    @receiver = @user.id
    join1 = User.joins("FULL JOIN messages ON messages.user_id = users.id").where("(author = '#{current_user.id}' and receiver = '#{@receiver}') or (author = '#{@receiver}' and receiver = '#{current_user.id}')")
    join2 = Message.joins("FULL JOIN users ON messages.user_id = users.id").where("(author = '#{current_user.id}' and receiver = '#{@receiver}') or (author = '#{@receiver}' and receiver = '#{current_user.id}')")
    # join = User.joins(:messages)
    # join.each {|t| puts "#{t.name} = #{t.id}"}
    # a =  Message.where("(author = '#{current_user.id}' and receiver = '#{@receiver}') or (author = '#{@receiver}' and receiver = '#{current_user.id}')")
    # a.each {|t| puts t.author}

    json = []
    # json << Message.where("(author = '#{current_user.id}' and receiver = '#{@receiver}') or (author = '#{@receiver}' and receiver = '#{current_user.id}')")
    # json << join.where("(author = '#{current_user.id}' and receiver = '#{@receiver}') or (author = '#{@receiver}' and receiver = '#{current_user.id}')")
    json << join1
    json << join2
    json << {username: current_user.name}
    json << {receiver: @receiver}


    # render json: Message.where("author = '#{current_user.id}' and receiver = '#{@receiver}'")
    render json: json
  end

  def create
    @message = Message.new

    @message.author = current_user.id
    @message.user_id = @message.author
    @message.receiver = params[:userId]
    @message.text = params[:message]
    puts "Author = #{@message.author}"
    puts "Receiver = #{@message.receiver}"
    @message.save
  end


end

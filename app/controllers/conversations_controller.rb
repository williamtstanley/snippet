class ConversationsController < ApplicationController

  before_action :authenticate_user!

  def new
    @recipient = User.find params[:to]
  end

  def create
    @convo = Conversation.new
    @convo.sender_id = current_user.id
    @convo.recipient_id = 1 # User.find params[:recipient]
    @message = Message.new
    @message.user = current_user
    @message.body = params[:body]
    @message.conversation = @convo
    if @convo.save && @message.save
      redirect_to root_path, notice: "Message sent"
    else
       redirect_to root_path, alert: "An Error has occured"
    end
  end

  def index
    @conversations = Conversation.where(sender_id: current_user.id).order(created_at: :desc)
  end

end

class MessagesController < ApplicationController

  def index
    @messages = Message.where(conversation: params[:conversation_id]).order(created_at: :desc)
  end

  def create
    conversation = Conversation.find params[:conversation_id]
    message = Message.new
    message.body = params[:body]
    message.user = current_user
    message.conversation = conversation
    if message.save
      redirect_to user_conversation_messages_path(current_user, conversation), notice: "Message made"
    else
      redirect_to user_conversation_messages_path(current_user, conversation), alert: "An Error Occured"
    end
  end
end

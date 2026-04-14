class MessagesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @received_messages = current_user.received_messages.order(created_at: :desc)
    @sent_messages = current_user.sent_messages.order(created_at: :desc)
  end
  
  def show
    @message = Message.find(params[:id])
    # 确保用户只能查看自己的消息
    unless @message.sender == current_user || @message.receiver == current_user
      redirect_to messages_path, alert: "You don't have permission to view this message"
      return
    end
    # 标记为已读
    @message.mark_as_read if @message.receiver == current_user && @message.read_at.nil?
  end
  
  def new
    @message = Message.new
    @receiver = User.find(params[:receiver_id]) if params[:receiver_id]
  end
  
  def create
    @message = current_user.sent_messages.build(message_params)
    if @message.save
      redirect_to messages_path, notice: "Message sent successfully"
    else
      render :new
    end
  end
  
  private
  
  def message_params
    params.require(:message).permit(:receiver_id, :content)
  end
end

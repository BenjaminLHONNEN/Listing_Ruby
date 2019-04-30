class Account::MessagesController < Account::AccountController

  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @messages = @conversation.messages


    @messages.where("user_id != ?", current_user.id)

    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    @message.user = current_user

    if @message.save
      redirect_to account_conversation_messages_path(@conversation)
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :user_id).merge(user_id: current_user.id)
  end
end



# class Account::MessagesController < Account::AccountController
#
#   # before_action do
#   #   @conversation = Conversation.find(params[:conversation_id])
#   # end
#
#   def index
#     @messages = Message.where(["user_id != ?", current_user.id])
#   end
#
#   def create
#     @message = @conversation.messages.new(message_params)
#     @message.user = current_user
#
#     if @message.save
#       redirect_to conversation_messages_path(@conversation)
#     end
#   end
#
#   private
#
#   def message_params
#     params.require(:message).permit(:body, :user_id, :article_id)
#   end
# end
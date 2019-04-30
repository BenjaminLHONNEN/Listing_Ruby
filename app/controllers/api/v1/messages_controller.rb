class Api::V1::MessagesController < Api::V1::ApiController


  before_action :authorize_request

  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index

    @messages = @conversation.messages

    @messages.where("user_id != ?", @current_user)

    @message = @conversation.messages.new
  end
  def create


    @message = @conversation.messages.new(message_params)

    @message.user =  @current_user

    if @message.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id).merge(user_id: @current_user)
  end
end
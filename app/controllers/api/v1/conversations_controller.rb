class Api::V1::ConversationsController < Api::V1::ApiController

  before_action :authorize_request

  def index
    @users = User.where.not(id: @current_user)
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", @current_user, @current_user)
  end

  def create

    if Conversation.between(params[:sender_id], params[:receiver_id], params[:article_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:receiver_id], params[:article_id]).first

      render json: @conversation, status: :create
    else
      @conversation = Conversation.create!(conversation_params)
      render json: @conversation, status: :unprocessable_entity
    end
  end

  private

  def conversation_params
    params.permit(:sender_id, :receiver_id, :article_id)
  end

end
class Account::ConversationsController < Account::AccountController


  def index
    @user = current_user

    if @user
      @users = User.where.not(id: current_user.id)
      @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
    else
      redirect_to new_user_session_path
    end

  end

  def create
    if Conversation.between(params[:sender_id], params[:receiver_id], params[:article_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:receiver_id], params[:article_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

    redirect_to account_conversation_messages_path(@conversation)
  end

  private

  def conversation_params
    params.permit(:sender_id, :receiver_id, :article_id)
  end

end
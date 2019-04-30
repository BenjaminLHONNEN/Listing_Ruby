class Api::V1::ArticlesController < Api::V1::ApiController

  before_action :authorize_request, except: :index

  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/1
  def show
    @article = Article.find(params[:id])
  end

  # POST /articles
  def create
    @article = Article.new(article_params(@current_user))
    if @article.save
      render json: @article, status: :create
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params(@current_user))
      render json: @article, status: :update
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
  end

  private

  def article_params(current_user)
    params.require(:article)
        .permit(:title, :content, :price, :category_id, :user_id)
        .merge(user_id: current_user)
  end
end
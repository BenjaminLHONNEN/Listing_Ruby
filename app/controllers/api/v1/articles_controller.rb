class Api::V1::ArticlesController < Api::V1::ApiController


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
    @article = Article.new(article_params)
    if @article.save
      render json: @article, status: :create
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
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

  def article_params
    authorization_object = Authorization.new(request)
    current_user = authorization_object.current_user

    params.require(:article).permit(:title, :content, :price, current_user, :category_id)
  end
end
class Api::V1::CategoryController < Api::V1::ApiController

  # GET /categories
  def index
    @categories = Category.all
  end

  # GET /categories/1
  def show
    @category = Category.find(params[:id])
  end

  # POST /categories
  def create
    before_action :authorize_request
    @category = Category.new(category_params)
    if @category.save
      render json: @category, status: :create
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  def update
    before_action :authorize_request
    if @category.update(article_params)
      render json: @category , status: :update
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  def destroy
    before_action :authorize_request
    @category.destroy
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
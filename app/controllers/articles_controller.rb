# frozen_string_literal: true
class ArticlesController < ApplicationController

  def index
    @articles = Article.search(params[:search])
  end

  def new

    @user = current_user

    if @user
      @article = Article.new
    else
      redirect_to new_user_session_path
    end

  end

  def create
    # raise article_params.inspect
    @article = Article.new(article_params)
    @article.user = current_user

    if @article.save
      redirect_to articles_path
    else
      render template: 'articles/new'
      #@article.errors.messages.inspect
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Post.find(params[:id])
  end

  def destroy
    @article = Post.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article)
        .permit(:title, :content, :price, :category_id, :user_id)
        .merge(user_id: current_user.id)
  end

  def search_params
    params.require(:articles).permit(:title, :content, :price, :category_id, :search)
  end
end

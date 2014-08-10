class ArticlesController < ApplicationController
  def index
    @articles = Article.page(params[:page]).per(15).order("released_at DESC")
  end

  def show
    @article = Article.readable_for(@current_member).find(params[:id])
  end
end

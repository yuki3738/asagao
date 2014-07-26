class TopController < ApplicationController
  def index
    @articles = Article.readable.order("released_at DESC").limit(5)
  end
end

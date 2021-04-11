class ArticlesController < ApplicationController
  # shows all posts | GET
  def index
    @articles = Articles.all
  end

  # shows a specific post | GET
  def show 
    @article = Article.find(params[:id])
  end

  # shows the 'new' post view | GET
  def new
  end

  # creates the new post and redirects to the new post | POST
  def create
    @article = Article.new(article_params)

    @article.save
    redirect_to @article
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end

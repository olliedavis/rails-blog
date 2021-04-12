class ArticlesController < ApplicationController
  # shows all posts | GET
  def index
    @articles = Article.all
  end

  # shows a specific post | GET
  def show 
    @article = Article.find(params[:id])
  end

  # shows the 'new' post view | GET
  def new
    @article = Article.new
  end

  # creates the new post and redirects to the new post | POST
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end

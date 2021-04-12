class ArticlesController < ApplicationController
  # shows all posts | HTML GET REQUEST
  def index
    @articles = Article.all
  end

  # shows the specified post | HTML GET REQUEST
  def show
    @article = Article.find(params[:id])
  end

  # shows the 'new' post view | HTML GET REQUEST
  def new
    @article = Article.new
  end

  # shows the specified post page to be edited | HTML GET REQUEST
  def edit
    @article = Article.find(params[:id])
  end

  # creates the new post and redirects to the new post | HTML POST REQUEST
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  # updates the specified post and redirects to the updated post if valid, else it renders the edit page again.
  # using 'render' rather than redirect_to allows the new params to be passed back, rather than erasing the fields
  # HTML PATCH REQUEST
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  # delete/destroy the specified post and redirects to the index | HTML DELETE REQUEST
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end

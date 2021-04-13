class CommentsController < ApplicationController
  http_basic_authenticate_with name: 'Ollie', password: 'supersecretplaintextpw', only: :destroy

  # creates the new comment and redirects to the post | HTML POST REQUEST
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  # delete/destroy the specified comment and redirects to the index | HTML DELETE REQUEST
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end

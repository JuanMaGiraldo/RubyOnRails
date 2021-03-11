class CommentsController < ApplicationController
  before_action :require_permission, only: :create

  def create
    @article = Article.find(params[:article_id])
    if @article
      @comment = @article.comments.create(comment_params)
      redirect_to article_path(@article)
    else
      redirect_to articles_path, alert: "Error saving the article"
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :status).merge(commenter: helpers.current_user.username)
  end

  def require_permission
    return if logged_in?

    redirect_to articles_path, alert: 'You are not allowed to perform this action'
  end

  def require_permission
    return if logged_in? # following

    redirect_to articles_path, notice: 'You are not allowed to perform this action'
  end
end

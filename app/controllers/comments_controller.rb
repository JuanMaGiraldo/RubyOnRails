class CommentsController < ApplicationController

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
    @comment.destroy()
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :status).merge(commenter: current_user.username)
  end
end

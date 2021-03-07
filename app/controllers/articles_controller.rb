class ArticlesController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :require_permission, only: %i[edit destroy]
  helper_method %i[user_follows_blogger?]

  def index
    if logged_in?
      @articles = Article.where.not(user_id: current_user.id)
      @user_articles = current_user.articles
    else
      @articles = Article.all
      @user_articles
    end
  end

  def show
    @article = Article.find(params[:id])
    @author = @article.user
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.create(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  private

  def owner?
    return false unless logged_in?

    article = Article.find(params[:id])
    current_user.owner?(article)
  end

  def user_can_comment?
    user_follows_blogger? || owner?
  end

  def require_permission
    return if owner?

    redirect_to articles_path, alert: 'You are not allowed to perform this action'
  end

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end

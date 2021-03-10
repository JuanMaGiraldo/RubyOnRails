class ArticlesController < ApplicationController

  def index
    @user = current_user
    @articles = @user.articles
    @count = @articles.count
    @user_name = @user.username
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @user = User.find(current_user.id)
    @article = @user.articles.create(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @user = User.find(params[current_user.id])
    @article = @user.articles.find(params[:id])
    @article.destroy()
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

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end

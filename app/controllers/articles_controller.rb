class ArticlesController < ApplicationController

  def getList
    [{ value: "title",type: InputsHelper::INPUT_TEXT},{ value: "body",type: InputsHelper::INPUT_TEXT},
      { value: "status",type: InputsHelper::INPUT_SELECT, select_list: ['public','private','archived']}]
  end

  helper_method :getList

  def index
    @user = current_user
    @articles = Article.where.not(user_id: @user.id)
    @user_articles = @user.articles
    @count = @user_articles.count
    @user_name = @user.username
  end

  def show
    @article = Article.find(params[:id])
    @user = User.find(@article.user_id)
    @days = ((Time.new - @article.created_at) / 86400).to_i
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

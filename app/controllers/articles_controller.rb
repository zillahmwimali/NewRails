class ArticlesController < ApplicationController
  http_basic_authenticate_with name:"mwimash", password: "secret", except: [:index, :show] 
  before_action :increment_views, only: [:show]
  

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, status: :see_other

  end
  

  private
    def article_params
      params.require(:article).permit(:title, :body, :image, :status)
    end

    def increment_views
      @article = Article.find(params[:id])
      @article.increment!(:views_count)
    end

  end  

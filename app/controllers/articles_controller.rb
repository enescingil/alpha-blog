class ArticlesController < ApplicationController
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article is destroyed bro!"
    redirect_to articles_path
  end
  
  def index
    @articles = Article.all
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Your article has been updated!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  
  end
  
  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was created!"
      redirect_to article_path(@article)
    else
      render 'new'
    end
    
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
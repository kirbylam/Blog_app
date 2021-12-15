class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
 
  # creates a new article but does not save it
  def new
    @article = Article.new
  end

  # saves the new article 
  def create
    @article = Article.new(article_params)

    # if article is saved, page is redirected to new article
    # else it redisplays the form (to create an article)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  # edits existing article but does not save it
  def edit
    @article = Article.find(params[:id])
  end

  # saves edited article
  def update
    @article = Article.find(params[:id])

    # if article is updated, redirect to page of article
    # else redirect to edit article page
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  # user must have a title and body to submit new article
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end

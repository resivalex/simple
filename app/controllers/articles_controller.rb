class ArticlesController < ApplicationController
  def index
    respond_to do |format|
      format.html do
        @articles = Article.all
        @article = Article.new
        render :index
      end
      format.json { render json: Article.all }
    end
  end

  def create
    article = Article.new article_params
    if article.save
      render partial: 'article', locals: { article: article }
    else
      render status: :bad_request
    end
  end

  def destroy
    article = Article.find_by_id params[:id]
    if article
      article.destroy
      render nothing: true
    else
      render plain: 'Not found', status: :not_found
    end
  end

private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end

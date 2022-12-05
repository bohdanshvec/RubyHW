class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[show update destroy]

  # GET /api/v1/articles
  def index
    @articles = Article.all

    render json: @articles
  end

  # POST /api/v1/articles
  def create
    @article = Article.new(article_params)
    @article.save

    render json: @article
  end

  # GET /api/v1/articles/:id
  def show
    render json: { article: @article, comment: @article.comments.get_lastten_comments, tag: @article.tags }
    # render json: { article: @article, comment: @article.comments.get_all_comments, tag: @article.tags }
  end

  # PUT/PATCH /api/v1/articles/:id
  def update
    @article.update(article_status_update_params)

    render json: @article
  end

  # DELETE /api/v1/articles/:id
  def destroy
    @article.delete

    render json: :ok
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :author_id)
  end

  def article_status_update_params
    params.require(:article).permit(:status)
  end
end
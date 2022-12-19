class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[like show update destroy]
  before_action :set_tag, only: %i[tag_add]

  def index
    @articles = Article.all
    @articles = @articles.where("title || body LIKE ?", "%#{params[:q]}%") if params[:q]
    @articles = @articles.where(status: params[:status]) if params[:status]
    @articles = @articles.joins(:author).where("authors.name LIKE ?", "%#{params[:author]}%") if params[:author]
    @articles = @articles.joins(:tags).where("tags.name IN (?)", params[:tags].split(', ')) if params[:tags]
    @articles = @articles.order(title: params[:order]) if params[:order]

    @pagy, @articles = pagy(@articles)

    render json: @articles
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      render json: @article
    else
      render json: @article.errors.messages, status: 422
    end
  end

  def show
    render json: @article, include: "comments"
  end

  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors.messages, status: 422
    end
  end

  def destroy
    @article.delete

    render json: :ok
  end

  def tag_add
    @article = Article.find(params[:article_id])
    if @article.tags.include?(@tag)
      render json: { data: "Tag '#{@tag.name}' has is." }
    else
      @article.tags << @tag
      render json: { data: "Tag '#{@tag.name}' added in Article #{@article.title}" }
    end
  end

  private

  def like_params
    params.require(:article).permit(:title)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :author_id, :status)
  end
end
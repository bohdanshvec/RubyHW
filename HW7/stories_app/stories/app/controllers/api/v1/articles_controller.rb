class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[like show update destroy]
  before_action :set_tag, only: %i[tag_add]

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
    render json: { article: @article, comment: @article.comments.get_lastten_comments, tag: @article.tags, like: @article.likes }
    # render json: { article: @article, comment: @article.comments.get_all_comments, tag: @article.tags, like: @article.likes }
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

  # POST /api/v1/articles/:id/like
  # def like
  #   @like = Like.new(like_params)
  #   @like.likeable = @article
  #   @like.save

  #   render json: @like
  # end

  def tag_add
    @article = Article.find(params[:article_id])
    if @article.tags.include?(@tag)
      render plain: "Tag '#{@tag.name}' has is."
    else
      @article.tags << @tag
      render plain: "Tag '#{@tag.name}' added in Article #{@article.title}"
    end
    # byebug
  end

  private

  # def like_params
  #   params.require(:article).permit(:title)
  # end

  def set_article
    @article = Article.find(params[:id])
    # byebug
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :author_id)
  end

  def article_status_update_params
    params.require(:article).permit(:status)
  end
end
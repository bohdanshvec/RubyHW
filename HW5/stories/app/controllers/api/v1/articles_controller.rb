class Api::V1::ArticlesController < ApplicationController
  def index
    @articles = Article.all

    render json: @articles
  end

  def create
    @article = Article.new(title: params[:title], body: params[:body])
    @article.save

    render json: @article
  end

  def show
    @article = Article.find(params[:id])

    render json: @article
  end

  def update
    @article = Article.find(params[:id])
    @article.update(body: params[:body])

    render json: @article
  end

  def destroy
    @article = Article.find(params[:id])
    @article.delete

    render json: :ok
  end
end

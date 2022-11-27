# frozen_string_literal: true

module Api
  module V1
    # Articles controller
    class ArticlesController < ApplicationController
      before_action :set_article, only: %i[show update destroy]

      # GET /api/v1/articles
      def index
        @articles = Article.all

        render json: @articles
      end

      # POST /api/v1/articles
      def create
        @article = Article.new(article_params) # (title: params[:title], body: params[:body])
        @article.save

        render json: @article
      end

      # GET /api/v1/articles/:id
      def show
        render json: { article: @article, comments: @article.comments.get_all_comments }
      end

      # PUT/PATCH /api/v1/articles/:id
      def update
        @article.update(article_params)

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
        params.require(:article).permit(:title, :body)
      end
    end
  end
end
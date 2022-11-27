# frozen_string_literal: true

module Api
  module V1
    # Articles controller
    class ArticlesController < ApplicationController
      before_action :set_article, only: %i[show update destroy]

      def index
        @articles = Article.all
        render json: @articles
      end

      def create
        @article = Article.new(params_article) # (title: params[:title], body: params[:body])
        @article.save
        render json: @article
      end

      def show
        render json: { article: @article, comments: @article.comments.get_all_comments }
      end

      def update
        @article.update(params_article) # (body: params[:body])
        render json: @article
      end

      def destroy
        @article.delete
        render json: :ok
      end

      private

      def set_article
        @article = Article.find(params[:id])
      end

      def params_article
        params.require(:article).permit(:title, :body)
      end
    end
  end
end

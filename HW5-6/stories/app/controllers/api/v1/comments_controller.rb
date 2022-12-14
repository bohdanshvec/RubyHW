# frozen_string_literal: true

module Api
  module V1
    # Comments controller
    class CommentsController < ApplicationController
      before_action :set_comment, only: %i[update]

      # GET /api/v1/comments
      def index
        @comments = Comment.where(status: params[:status] || :unpublished)
        # or 
        # @comments = Comment.get_all_comments

        render json: @comments
      end

      def create
        @comment = Comment.new(comment_create_params)
        @comment.save

        render json: @comment
      end

      # PUT/PATCH /api/v1/comments/:id
      def update
        @comment.update(comment_params)

        render json: @comment
      end

      private

      def set_comment
        @comment = Comment.find(params[:id])
      end

      def comment_params
        params.require(:comment).permit(:status, :body)
      end

      def comment_create_params
        params.require(:comment).permit(:status, :body, :article_id, :author_id)
      end
    end
  end
end
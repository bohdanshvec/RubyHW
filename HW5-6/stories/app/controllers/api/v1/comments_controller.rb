# frozen_string_literal: true

module Api
  module V1
    # Comments controller
    class CommentsController < ApplicationController
      before_action :set_comment, only: %i[update]

      def index
        @comments = Comment.where(status: params[:status] || :unpublished) # get_all_comments

        render json: @comments
      end

      def update
        @comment.update(params_comment)

        render json: @comment
      end

      private

      def set_comment
        @comment = Comment.find(params[:id])
      end

      def params_comment
        params.require(:comment).permit(:status, :body)
      end
    end
  end
end

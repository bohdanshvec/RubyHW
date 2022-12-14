class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: %i[like show update destroy]

  # GET /api/v1/comments
  # or
  # GET /api/v1/comments?status=published
  def index
    @comments = Comment.all
    @comments = @comments.where(status: params[:status]) if params[:status]
    # @comments = Comment.where(status: params[:status] || :unpublished)

    render json: @comments
  end

  # POST /api/v1/comments
  def create
    @comment = Comment.new(comment_params)
    @comment.save

    render json: @comment
  end

  # PUT/PATCH /api/v1/comments/:id
  def update
    @comment.update(comment_update_status_params)

    render json: @comment
  end

  # GET /api/v1/comments/:id
  def show
    render json: { comment: @comment, like: @comment.likes }
  end

   # DELETE /api/v1/comments/:id
  def destroy
    @comment.delete

    render json: :ok
  end

   # POST /api/v1/comments/:id/like
  # def like
  #   @like = Like.new(like_params)
  #   @like.likeable = @comment
  #   @like.save

  #   render json: @like
  # end

  private

  # def like_params
  #   params.require(:like).permit(:title)
  # end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:status, :body, :article_id, :author_id)
  end

  def comment_update_status_params
    params.require(:comment).permit(:status)
  end
end

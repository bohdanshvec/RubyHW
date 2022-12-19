class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: %i[like show update destroy]

  def index
    @comments = Comment.all
    @comments = @comments.where(status: params[:status]) if params[:status]

    render json: @comments
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.messages, status: 422
    end

  end

  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors.messages, status: 422
    end
  end

  def show
    render json: { comment: @comment, like: @comment.likes }
  end

  def destroy
    @comment.delete

    render json: :ok
  end

  private

  def like_params
    params.require(:like).permit(:title)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:status, :body, :article_id, :author_id)
  end

end
class Api::V1::LikesController < ApplicationController
  before_action :like_params, only: %i[create]

  def index
    @likes = Like.all

    render json: @likes
  end

  def create
    @like = Like.new(like_params)
    @like.likeable = @like.likeable_type.constantize.find(@like.likeable_id)
    if @like.save
      render json: @like
    else
      render json: @like.errors.messages, status: 422
    end
  end

  private

  def like_params
    params.require(:like).permit(:author_id, :likeable_id, :likeable_type)
  end
end
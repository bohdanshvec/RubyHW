class Api::V1::LikesController < ApplicationController
  before_action :like_params, only: %i[like]

  def index
    @likes = Like.all

    render json: @likes
  end

  def like
    @like = Like.new(like_params)
    @like.save

    render json: @like
  end

  private

  def like_params
  params.require(:like).permit(:title, :likeable_id, :likeable_type)
  end
end

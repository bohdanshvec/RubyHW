class Api::V1::LikesController < ApplicationController
  before_action :like_params, only: %i[like]

  def index
    @likes = Like.all

    render json: @likes
  end

  def like
    @like = Like.new(like_params)
    # @numb = @like.likeable_id
    # @essence = @like.likeable_type.constantize.find(@numb)
    # @like.likeable = @essence
    # @likeable = params[:likeable_type].constantize.find(params[:likeable_id])
    @like.likeable = @like.likeable_type.constantize.find(@like.likeable_id)
    # byebug
    @like.save

    render json: @like
  end

  private

  def like_params
  params.require(:like).permit(:title, :likeable_id, :likeable_type)
  end
end

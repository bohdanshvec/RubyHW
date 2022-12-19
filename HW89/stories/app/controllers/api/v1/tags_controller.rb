class Api::V1::TagsController < ApplicationController
  before_action :set_tag, only: %i[destroy]

  def index
    @tags = Tag.all

    render json: @tags
  end

  def create
    @tag = Tag.find_or_initialize_by(tag_params)
    if @tag.save
      render json: @tag
    else
      render json: @tag.errors.messages, status: 422
    end
  end

  def destroy
    @tag.delete

    render json: :ok
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name, :article_id)
  end
end

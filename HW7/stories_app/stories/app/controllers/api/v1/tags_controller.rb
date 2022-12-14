class Api::V1::TagsController < ApplicationController
  before_action :set_tag, only: %i[show destroy]

  # GET /api/v1/tags
  def index
    @tags = Tag.all

    render json: @tags
  end

  # POST /api/v1/tags
  def create
    @tag = Tag.find_or_initialize_by(tag_params)
    @tag.save
    # Article.find(params[:ar]).tags << @tag if params[:ar]

    render json: @tag
  end

  # This is an experimental method, do not use it. For personal use.
  # GET /api/v1/tags/:id
  # def show
  #   Article.find(params[:ar]).tags << @tag if params[:ar]

  #   render json: @tag
  # end

  # DELETE /api/v1/tags/:id
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

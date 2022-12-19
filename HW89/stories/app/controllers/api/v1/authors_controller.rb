class Api::V1::AuthorsController < ApplicationController
  before_action :set_author, only: %i[destroy]

  def index
    @authors = Author.all

    render json:@authors
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      render json: @author
    else
      render json: @author.errors.messages, status: 422
    end
  end

  def destroy
    @author.delete

    render plain: "Author delete"
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name)
  end
end
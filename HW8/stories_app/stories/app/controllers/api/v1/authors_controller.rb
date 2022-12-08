class Api::V1::AuthorsController < ApplicationController
  before_action :set_author, only: %i[destroy]

  # http://localhost:3000/api/v1/authors
  def index
    @authors = Author.all

    render json:@authors
  end

  # http://localhost:3000/api/v1/authors
  def create
    @author = Author.new(author_params)
    if @author.save
      render json: @author
    else
      # render plain: 'Update unsuccessfully'
      # render plain: "#{@author.errors.messages}"
      render json: @author.errors.messages

    end
  end

  # http://localhost:3000/api/v1/authors/3
  def destroy
    @author.delete

    # render json: :ok
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

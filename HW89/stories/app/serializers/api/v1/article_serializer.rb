class Api::V1::ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at, :author

  def author
    # byebug
    self.object.author.name
  end

  has_many :comments
end

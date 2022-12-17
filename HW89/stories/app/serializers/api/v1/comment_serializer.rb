class Api::V1::CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :status, :author, :created_at

  def author
    self.object.author.name
  end

  belongs_to :article
end

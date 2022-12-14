class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :author
  has_and_belongs_to_many :tags
  has_many :likes, as: :likeable, dependent: :destroy

  enum :status, %i[unpublished published]#, default: :unpublished

  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 5 }
end